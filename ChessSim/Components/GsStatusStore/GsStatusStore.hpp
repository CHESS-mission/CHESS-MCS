#ifndef CHESSSIM_COMPONENTS_GSSTATUSSTORE_GSSTATUSSTORE_HPP
#define CHESSSIM_COMPONENTS_GSSTATUSSTORE_GSSTATUSSTORE_HPP

#include "ChessSim/Components/GsStatusStore/GsStatusStoreComponentAc.hpp"

namespace ChessSim {

class GsStatusStore : public GsStatusStoreComponentBase {
  public:
    GsStatusStore(const char* const compName);
    ~GsStatusStore() override;

  private:
    void UPDATE_STATUS_cmdHandler(
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
    ) override;
};

}  // namespace ChessSim

#endif