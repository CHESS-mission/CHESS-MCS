import {_loader} from "../../js/loader.js";


const POLL_INTERVAL_MS = 1000;


Vue.component("ground-station", {
    template: `
        <div class="fp-flex-repeater gs-view">
            <div class="fp-flex-header gs-header">
                <div>
                    <h2>Ground Station</h2>
                    <div class="gs-subtitle">
                        Last bridge update: {{ lastUpdate }}
                    </div>
                </div>
                <div :class="['gs-status-pill', available ? 'gs-status-online' : 'gs-status-offline']">
                    {{ available ? "Receiving" : "Waiting" }}
                </div>
            </div>

            <div class="fp-scroll-container">
                <div class="fp-scrollable gs-scrollable">
                    <div v-if="error" class="alert alert-danger gs-alert" role="alert">
                        {{ error }}
                    </div>

                    <div class="gs-grid">
                        <section class="gs-panel">
                            <div class="gs-panel-title">Status</div>
                            <div class="gs-kv" v-for="row in statusRows" :key="row.label">
                                <div class="gs-label">{{ row.label }}</div>
                                <div class="gs-value">{{ display(row.value) }}</div>
                            </div>
                        </section>

                        <section class="gs-panel">
                            <div class="gs-panel-title">Pass And RF</div>
                            <div class="gs-kv" v-for="row in passRows" :key="row.label">
                                <div class="gs-label">{{ row.label }}</div>
                                <div class="gs-value">{{ display(row.value) }}</div>
                            </div>
                        </section>

                        <section class="gs-panel" v-if="systemRows.length">
                            <div class="gs-panel-title">System</div>
                            <div class="gs-kv" v-for="row in systemRows" :key="row.label">
                                <div class="gs-label">{{ row.label }}</div>
                                <div class="gs-value">{{ display(row.value) }}</div>
                            </div>
                        </section>

                        <section class="gs-panel" v-if="rotatorRows.length">
                            <div class="gs-panel-title">Rotator</div>
                            <div class="gs-kv" v-for="row in rotatorRows" :key="row.label">
                                <div class="gs-label">{{ row.label }}</div>
                                <div class="gs-value">{{ display(row.value) }}</div>
                            </div>
                        </section>
                    </div>

                    <section class="gs-panel gs-wide-panel" v-if="sourceErrors.length">
                        <div class="gs-panel-title">Source Errors</div>
                        <div class="gs-error-row" v-for="(sourceError, index) in sourceErrors" :key="index">
                            {{ sourceError }}
                        </div>
                    </section>
                </div>
            </div>
        </div>
    `,
    data() {
        return {
            latest: null,
            error: null,
            pollTimer: null,
        };
    },
    mounted() {
        this.loadStatus();
        this.pollTimer = setInterval(this.loadStatus, POLL_INTERVAL_MS);
    },
    beforeDestroy() {
        if (this.pollTimer) {
            clearInterval(this.pollTimer);
            this.pollTimer = null;
        }
    },
    computed: {
        available() {
            return Boolean(this.latest && this.latest.available && this.payload);
        },
        payload() {
            return (this.latest || {}).payload || null;
        },
        status() {
            return (this.payload || {}).status || {};
        },
        flat() {
            return (this.payload || {}).flat || {};
        },
        lastUpdate() {
            return this.display((this.latest || {}).server_received_at_utc || (this.payload || {}).received_at_utc);
        },
        statusRows() {
            return [
                this.row("GS Status", this.pick(this.flat.gs_status, this.status.gs_status)),
                this.row("Backend Health", this.pick(this.flat.backend_health, this.status.backend_health)),
                this.row("Service Status", this.pick(this.flat.service_status_raw, this.status.service_status_raw)),
                this.row("Downlink Status", this.pick(this.flat.downlink_status, this.status.downlink_status)),
                this.row("Topic", (this.payload || {}).topic),
            ];
        },
        passRows() {
            const rf = this.status.rf || {};
            return [
                this.row("Pass Active", this.pick(this.flat.pass_active, this.status.pass_active)),
                this.row("Next AOS UTC", this.status.next_aos_utc),
                this.row("Next LOS UTC", this.status.next_los_utc),
                this.row("Time To AOS", this.seconds(this.pick(this.flat.time_to_aos_s, this.status.time_to_aos_s))),
                this.row("Time To LOS", this.seconds(this.pick(this.flat.time_to_los_s, this.status.time_to_los_s))),
                this.row("RSSI", this.dbm(this.pick(this.flat.rssi_dbm, rf.rssi_dbm))),
                this.row("SNR", this.db(this.pick(this.flat.snr_db, rf.snr_db))),
            ];
        },
        systemRows() {
            return this.objectRows(this.status.system);
        },
        rotatorRows() {
            return this.objectRows(this.status.rotator);
        },
        sourceErrors() {
            return this.status.source_errors || [];
        },
    },
    methods: {
        loadStatus() {
            _loader.load("/gs-status").then((data) => {
                this.latest = data;
                this.error = null;
            }).catch((error) => {
                this.error = "Unable to load ground-station status: " + (error.message || error);
            });
        },
        row(label, value) {
            return {label, value};
        },
        pick(...values) {
            return values.find((value) => value !== null && typeof value !== "undefined" && value !== "");
        },
        objectRows(value) {
            if (!value || typeof value !== "object" || Array.isArray(value)) {
                return [];
            }
            return Object.keys(value).sort().map((key) => this.row(this.titleize(key), value[key]));
        },
        titleize(value) {
            return value.replace(/_/g, " ").replace(/\b\w/g, (match) => match.toUpperCase());
        },
        seconds(value) {
            if (value === null || typeof value === "undefined" || value < 0) {
                return value;
            }
            return value + " s";
        },
        dbm(value) {
            if (value === null || typeof value === "undefined" || value <= -999) {
                return value;
            }
            return Number(value).toFixed(1) + " dBm";
        },
        db(value) {
            if (value === null || typeof value === "undefined" || value <= -999) {
                return value;
            }
            return Number(value).toFixed(1) + " dB";
        },
        display(value) {
            if (value === null || typeof value === "undefined" || value === "") {
                return "-";
            }
            if (typeof value === "boolean") {
                return value ? "True" : "False";
            }
            if (Array.isArray(value)) {
                return value.length ? value.join(", ") : "-";
            }
            if (typeof value === "object") {
                return JSON.stringify(value);
            }
            return value;
        },
    },
});
