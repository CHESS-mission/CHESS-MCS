/**
 * sim-health/addon.js
 *
 * Simulation Health tab for the F' GDS.
 * Displays DeploymentSim telemetry channels with color-coded values
 * based on threshold ranges (green/yellow/orange/red).
 *
 * Reads channel data from the existing GDS datastore (populated by the
 * InfluxDB telemetry bridge plugin). Thresholds are embedded from
 * telemetry_ranges.json.
 */
import {_datastore, _dictionaries} from "../../js/datastore.js";
import {timeToString, formatHexId} from "../../js/vue-support/utils.js";


/**
 * Channel thresholds (ranges) fetched from the json files, which we call with the SIM_HEALTH_RANGES env variable
 */
let CHANNEL_THRESHOLDS = {};

/**
 * Subsystem groupings for organized display.
 */
const SUBSYSTEM_GROUPS = [
    {
        name: "Power",
        icon: "⚡",
        channels: [
            "DeploymentSim.Battery",
            "DeploymentSim.Consumption",
            "DeploymentSim.Generation",
            "DeploymentSim.Eclipse",
            "DeploymentSim.SolarCellsEfficiency"
        ]
    },
    {
        name: "Orbit",
        icon: "🛰",
        channels: [
            "DeploymentSim.Altitude",
            "DeploymentSim.Latitude",
            "DeploymentSim.Longitude",
            "DeploymentSim.RAAN",
            "DeploymentSim.AOP",
            "DeploymentSim.ECC",
            "DeploymentSim.INC",
            "DeploymentSim.Density"
        ]
    },
    {
        name: "Data",
        icon: "💾",
        channels: [
            "DeploymentSim.Storage",
            "DeploymentSim.StoragePayload",
            "DeploymentSim.StorageHK"
        ]
    },
    {
        name: "Operations",
        icon: "📡",
        channels: [
            "DeploymentSim.Mode",
            "DeploymentSim.Visibility"
        ]
    }
];

/**
 * Determine the health color for a given value based on thresholds.
 * Returns: "red", "orange", "yellow", or "green"
 */
function getHealthColor(channelName, value) {
    const t = CHANNEL_THRESHOLDS[channelName];
    if (!t || value === null || value === undefined || value === "") return "none";
    const v = Number(value);
    if (isNaN(v)) return "none";

    // Check low thresholds (from most severe to least)
    if (t.low_red !== undefined && v <= t.low_red) return "red";
    if (t.low_orange !== undefined && v <= t.low_orange) return "orange";
    if (t.low_yellow !== undefined && v <= t.low_yellow) return "yellow";

    // Check high thresholds (from most severe to least)
    if (t.high_red !== undefined && v >= t.high_red) return "red";
    if (t.high_orange !== undefined && v >= t.high_orange) return "orange";
    if (t.high_yellow !== undefined && v >= t.high_yellow) return "yellow";

    return "green";
}

/**
 * Get a CSS class name for a health color.
 */
function healthClass(color) {
    const map = {
        "red": "sim-status-red",
        "orange": "sim-status-orange",
        "yellow": "sim-status-yellow",
        "green": "sim-status-green",
        "none": ""
    };
    return map[color] || "";
}


Vue.component("sim-health", {
    template: `
        <div class="fp-flex-repeater sim-view">
            <div class="fp-flex-header sim-header">
                <div>
                    <h2>Simulation Health</h2>
                    <div class="sim-subtitle">
                        DeploymentSim telemetry — color-coded by threshold ranges
                    </div>
                </div>
                <div class="sim-header-right">
                    <div :class="['sim-status-pill', hasData ? 'sim-pill-active' : 'sim-pill-idle']">
                        {{ hasData ? "Receiving" : "Waiting" }}
                    </div>
                    <div class="sim-update-count" v-if="hasData">
                        {{ channelCount }} channels active
                    </div>
                </div>
            </div>

            <div class="fp-scroll-container">
                <div class="fp-scrollable sim-scrollable">
                    <div class="sim-grid">
                        <section class="sim-panel" v-for="group in groups" :key="group.name">
                            <div class="sim-panel-title">
                                <span class="sim-panel-icon">{{ group.icon }}</span>
                                {{ group.name }}
                            </div>
                            <div class="sim-kv" v-for="ch in group.channels" :key="ch">
                                <div class="sim-label">{{ shortName(ch) }}</div>
                                <div :class="['sim-value', healthCls(ch)]">
                                    {{ displayValue(ch) }}
                                    <span class="sim-unit">{{ getUnit(ch) }}</span>
                                </div>
                                <div class="sim-time">{{ displayTime(ch) }}</div>
                            </div>
                        </section>
                    </div>

                    <section class="sim-panel sim-legend-panel">
                        <div class="sim-panel-title">Legend</div>
                        <div class="sim-legend">
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-green"></span> Normal
                            </span>
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-yellow"></span> Caution
                            </span>
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-orange"></span> Warning
                            </span>
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-red"></span> Critical
                            </span>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    `,
    data() {
        return {
            channels: _datastore.channels,
            groups: SUBSYSTEM_GROUPS,
            refreshKey: 0,
            refreshTimer: null
        };
    },
    mounted() {
        // Load thresholds from Flask endpoint
        fetch("/sim-health/ranges")
            .then(r => r.json())
            .then(data => {
                for (let [name, props] of Object.entries(data.channels)) {
                    CHANNEL_THRESHOLDS[name] = props;
                }
                console.log("[SimHealth] Loaded thresholds from", Object.keys(CHANNEL_THRESHOLDS).length, "channels");
            })
            .catch(err => console.error("[SimHealth] Failed to load thresholds:", err));
        
        this.refreshTimer = setInterval(() => { this.refreshKey++; }, 2000);
    },
    beforeDestroy() {
        if (this.refreshTimer) {
            clearInterval(this.refreshTimer);
            this.refreshTimer = null;
        }
    },
    computed: {
        hasData() {
            // Trigger reactivity on refreshKey
            let _ = this.refreshKey;
            return this.channelCount > 0;
        },
        channelCount() {
            let _ = this.refreshKey;
            let count = 0;
            for (let id in this.channels) {
                let template = _dictionaries.channels[id];
                if (template && template.full_name && template.full_name.startsWith("DeploymentSim.")) {
                    if (this.channels[id].val !== null && this.channels[id].val !== undefined) {
                        count++;
                    }
                }
            }
            return count;
        }
    },
    methods: {
        /**
         * Find a channel entry by its full name (e.g. "DeploymentSim.Altitude")
         */
        findChannel(fullName) {
            // Trigger reactivity
            let _ = this.refreshKey;
            for (let id in this.channels) {
                let template = _dictionaries.channels[id];
                if (template && template.full_name === fullName) {
                    return this.channels[id];
                }
            }
            return null;
        },

        shortName(fullName) {
            return fullName.replace("DeploymentSim.", "");
        },

        displayValue(fullName) {
            let ch = this.findChannel(fullName);
            if (!ch || ch.val === null || ch.val === undefined) return "—";
            let val = ch.display_text !== undefined ? ch.display_text : ch.val;
            if (typeof val === "number") {
                // Show reasonable precision
                if (Math.abs(val) < 0.01 && val !== 0) return val.toExponential(3);
                if (Math.abs(val) > 10000) return val.toFixed(1);
                if (Number.isInteger(val)) return val.toString();
                return val.toFixed(4);
            }
            return val;
        },

        displayTime(fullName) {
            let ch = this.findChannel(fullName);
            if (!ch || ch.time === null || ch.time === undefined) return "";
            let t = ch.time;
            // If it's a raw number (seconds), convert to readable date (unix to human-readable time conversion)
            if (typeof t === "object" && t.seconds !== undefined) {
                let d = new Date(t.seconds * 1000);
                return d.toISOString().replace("T", " ").slice(0, 19);
            }
            return timeToString(t);
        },

        getUnit(fullName) {
            let t = CHANNEL_THRESHOLDS[fullName];
            return (t && t.unit) ? t.unit : "";
        },

        healthCls(fullName) {
            let ch = this.findChannel(fullName);
            if (!ch || ch.val === null || ch.val === undefined) return "";
            return healthClass(getHealthColor(fullName, ch.val));
        }
    }
});
