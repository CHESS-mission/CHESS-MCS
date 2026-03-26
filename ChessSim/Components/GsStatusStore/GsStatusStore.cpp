#include "ChessSim/Components/GsStatusStore/GsStatusStore.hpp"

namespace ChessSim {

GsStatusStore::GsStatusStore(const char* const compName)
    : GsStatusStoreComponentBase(compName) {}

GsStatusStore::~GsStatusStore() {}

void GsStatusStore::UPDATE_STATUS_cmdHandler(
    const FwOpcodeType opCode,
    const U32 cmdSeq,
    const Fw::CmdStringArg& gs_status,
    const Fw::CmdStringArg& backend_health,
    const Fw::CmdStringArg& service_status_raw,
    const Fw::CmdStringArg& downlink_status,
    const bool pass_active,
    const I32 time_to_aos_s,
    const I32 time_to_los_s,
    const F32 rssi_dbm,
    const F32 snr_db
) {
    this->tlmWrite_LatestGsStatus(gs_status);
    this->tlmWrite_LatestBackendHealth(backend_health);
    this->tlmWrite_LatestServiceStatusRaw(service_status_raw);
    this->tlmWrite_LatestDownlinkStatus(downlink_status);
    this->tlmWrite_LatestPassActive(pass_active);
    this->tlmWrite_LatestTimeToAosS(time_to_aos_s);
    this->tlmWrite_LatestTimeToLosS(time_to_los_s);
    this->tlmWrite_LatestRssiDbm(rssi_dbm);
    this->tlmWrite_LatestSnrDb(snr_db);

    this->log_ACTIVITY_HI_StatusUpdated(gs_status, backend_health, pass_active);
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

}  // namespace ChessSim