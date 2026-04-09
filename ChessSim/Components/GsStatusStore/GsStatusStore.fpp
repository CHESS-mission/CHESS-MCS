module ChessSim {

  active component GsStatusStore {

    command recv port cmdIn
    command reg port cmdRegOut
    command resp port cmdResponseOut

    event port logOut
    text event port logTextOut
    telemetry port tlmOut
    time get port timeGetOut

    async command UPDATE_STATUS(
      gs_status: string size 32,
      backend_health: string size 32,
      service_status_raw: string size 32,
      downlink_status: string size 32,
      pass_active: bool,
      time_to_aos_s: I32,
      time_to_los_s: I32,
      rssi_dbm: F32,
      snr_db: F32
    )

    telemetry LatestGsStatus: string size 32 format "{}"
    telemetry LatestBackendHealth: string size 32 format "{}"
    telemetry LatestServiceStatusRaw: string size 32 format "{}"
    telemetry LatestDownlinkStatus: string size 32 format "{}"
    telemetry LatestPassActive: bool format "{}"
    telemetry LatestTimeToAosS: I32 format "{}"
    telemetry LatestTimeToLosS: I32 format "{}"
    telemetry LatestRssiDbm: F32 format "{}"
    telemetry LatestSnrDb: F32 format "{}"

    event StatusUpdated(
      gs_status: string size 32,
      backend_health: string size 32,
      pass_active: bool
    ) severity activity high format "GS status={}, backend={}, pass_active={}"

  }

}