/**
 * adcs-health/addon.js
 *
 * ADCS Health tab for the F' GDS.
 * Displays ADCS subsystem telemetry channels as placeholders with
 * color-coded thresholds from the FDIR document.
 *
 * These channels are NOT connected to the digital twin simulation.
 * Values will show as "—" (no data) until real ADCS hardware or a
 * simulator provides telemetry.
 */
import {_datastore, _dictionaries} from "../../js/datastore.js";
import {timeToString} from "../../js/vue-support/utils.js";

/**
 * ADCS channel thresholds and subsystem groups.
 * Loaded dynamically from /adcs-health/ranges on mount.
 */
let ADCS_THRESHOLDS = {};
let ADCS_SHORT_NAMES = {};

/**
 * Determine the health color for a given value based on thresholds.
 */
function getHealthColor(channelName, value) {
    const t = ADCS_THRESHOLDS[channelName];
    if (!t || value === null || value === undefined || value === "") return "none";
    const v = Number(value);
    if (isNaN(v)) return "none";

    if (t.low_red !== undefined && v <= t.low_red) return "red";
    if (t.low_orange !== undefined && v <= t.low_orange) return "orange";
    if (t.low_yellow !== undefined && v <= t.low_yellow) return "yellow";
    if (t.high_red !== undefined && v >= t.high_red) return "red";
    if (t.high_orange !== undefined && v >= t.high_orange) return "orange";
    if (t.high_yellow !== undefined && v >= t.high_yellow) return "yellow";

    return "green";
}

function healthClass(color) {
    return {
        "red": "sim-status-red",
        "orange": "sim-status-orange",
        "yellow": "sim-status-yellow",
        "green": "sim-status-green",
        "none": ""
    }[color] || "";
}


Vue.component("adcs-health", {
    template: `
        <div class="fp-flex-repeater sim-view">
            <div class="fp-flex-header sim-header">
                <div>
                    <h2>ADCS Health</h2>
                    <div class="sim-subtitle">
                        Attitude Determination & Control — FDIR thresholds
                    </div>
                </div>
                <div class="sim-header-right">
                    <div :class="['sim-status-pill', hasData ? 'sim-pill-active' : 'sim-pill-idle']">
                        {{ hasData ? "Receiving" : "Placeholder" }}
                    </div>
                    <div class="sim-update-count" v-if="!hasData">
                        {{ totalChannels }} channels defined
                    </div>
                    <div class="sim-update-count" v-if="hasData">
                        {{ activeChannels }} / {{ totalChannels }} channels active
                    </div>
                </div>
            </div>

            <div class="fp-scroll-container">
                <div class="fp-scrollable sim-scrollable">
                    <div v-if="!loaded" class="adcs-loading">
                        Loading ADCS channel definitions...
                    </div>
                    <div v-if="loaded" class="sim-grid">
                        <section class="sim-panel adcs-panel" v-for="group in groups" :key="group.name">
                            <div class="sim-panel-title">
                                <span class="sim-panel-icon">{{ group.icon }}</span>
                                {{ group.label }}
                                <span class="adcs-channel-count">{{ group.channels.length }} params</span>
                            </div>
                            <div class="sim-kv" v-for="ch in group.channels" :key="ch">
                                <div class="sim-label" :title="getDescription(ch)">{{ shortName(ch) }}</div>
                                <div :class="['sim-value', healthCls(ch)]">
                                    {{ displayValue(ch) }}
                                    <span class="sim-unit">{{ getUnit(ch) }}</span>
                                </div>
                                <div class="sim-time">{{ displayTime(ch) }}</div>
                            </div>
                        </section>
                    </div>

                    <section class="sim-panel sim-legend-panel" v-if="loaded">
                        <div class="sim-panel-title">Legend</div>
                        <div class="sim-legend">
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-green"></span> Normal
                            </span>
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-yellow"></span> Caution
                            </span>
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-orange"></span> Warning (LWL/UWL)
                            </span>
                            <span class="sim-legend-item">
                                <span class="sim-legend-dot sim-status-red"></span> Critical (LCL/UCL)
                            </span>
                            <span class="sim-legend-item adcs-placeholder-note">
                                "—" = No telemetry data (placeholder channel)
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
            groups: [],
            loaded: false,
            totalChannels: 0,
            refreshKey: 0,
            refreshTimer: null
        };
    },
    mounted() {
        // Load thresholds from Flask endpoint
        fetch("/adcs-health/ranges")
            .then(r => r.json())
            .then(data => {
                // Populate thresholds and short names
                for (let [name, props] of Object.entries(data.channels)) {
                    ADCS_THRESHOLDS[name] = props;
                    if (props.short_name) {
                        ADCS_SHORT_NAMES[name] = props.short_name;
                    }
                }
                // Populate groups
                this.groups = [];
                for (let [gName, gData] of Object.entries(data.subsystem_groups)) {
                    this.groups.push({
                        name: gName,
                        label: gData.label,
                        icon: gData.icon,
                        channels: gData.channels
                    });
                }
                this.totalChannels = Object.keys(data.channels).length;
                this.loaded = true;
                console.log("[ADCSHealth] Loaded", this.totalChannels, "channels in", this.groups.length, "groups");
            })
            .catch(err => {
                console.error("[ADCSHealth] Failed to load ranges:", err);
            });

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
            let _ = this.refreshKey;
            return this.activeChannels > 0;
        },
        activeChannels() {
            let _ = this.refreshKey;
            let count = 0;
            for (let id in this.channels) {
                let template = _dictionaries.channels[id];
                if (template && template.full_name && template.full_name.startsWith("ADCS.")) {
                    if (this.channels[id].val !== null && this.channels[id].val !== undefined) {
                        count++;
                    }
                }
            }
            return count;
        }
    },
    methods: {
        findChannel(fullName) {
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
            // Use the human-readable short_name from the JSON if available
            if (ADCS_SHORT_NAMES[fullName]) {
                return ADCS_SHORT_NAMES[fullName];
            }
            // Fallback: strip the prefix
            let parts = fullName.split(".");
            return parts[parts.length - 1];
        },

        getDescription(fullName) {
            let t = ADCS_THRESHOLDS[fullName];
            return (t && t.description) ? t.description : fullName;
        },

        displayValue(fullName) {
            let ch = this.findChannel(fullName);
            if (!ch || ch.val === null || ch.val === undefined) return "—";
            let val = ch.display_text !== undefined ? ch.display_text : ch.val;
            if (typeof val === "number") {
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
            if (typeof t === "object" && t.seconds !== undefined) {
                let d = new Date(t.seconds * 1000);
                return d.toISOString().replace("T", " ").slice(0, 19);
            }
            return timeToString(t);
        },

        getUnit(fullName) {
            let t = ADCS_THRESHOLDS[fullName];
            return (t && t.unit) ? t.unit : "";
        },

        healthCls(fullName) {
            let ch = this.findChannel(fullName);
            if (!ch || ch.val === null || ch.val === undefined) return "";
            return healthClass(getHealthColor(fullName, ch.val));
        }
    }
});