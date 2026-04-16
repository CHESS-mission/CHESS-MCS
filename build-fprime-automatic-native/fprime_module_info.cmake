set_property(GLOBAL PROPERTY FPRIME_BASE_CHOSEN_IMPLEMENTATIONS Os_File_Posix Os_Console_Posix Os_Task_Posix Os_Mutex_Posix Os_Generic_PriorityQueue Os_RawTime_Posix Fw_StringFormat_snprintf Os_Cpu_Stub Os_Memory_Stub Os_Cpu_Linux Os_Memory_Linux)
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/cmake/platform/unix/Platform/PlatformTypes.fpp_MODULE"
    "UnixPlatformTypes")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Fpp/ToCpp.fpp_MODULE"
    "FppToCppSettings")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/AcConstants.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/ComCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/DpCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/FpConfig.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/FpConstants.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/FpySequencerCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/GenericHubCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/MemoryAllocation.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/MemoryAllocation.hpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/PlatformCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/PolyDbCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/default/config/VersionCfg.fpp_MODULE"
    "default_config")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Buffer/Buffer.fpp_MODULE"
    "Fw_Buffer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Cmd/Cmd.fpp_MODULE"
    "Fw_Cmd")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Com/Com.fpp_MODULE"
    "Fw_Com")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Dp/Dp.fpp_MODULE"
    "Fw_Dp")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Fpy/StatementArgBuffer.fpp_MODULE"
    "Fw_Fpy")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Interfaces/Channel.fpp_MODULE"
    "Fw_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Interfaces/Command.fpp_MODULE"
    "Fw_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Interfaces/Event.fpp_MODULE"
    "Fw_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Log/Log.fpp_MODULE"
    "Fw_Log")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Prm/Prm.fpp_MODULE"
    "Fw_Prm")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Time/Time.fpp_MODULE"
    "Fw_Time")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Tlm/Tlm.fpp_MODULE"
    "Fw_Tlm")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Ports/CompletionStatus/CompletionStatus.fpp_MODULE"
    "Fw_Ports_CompletionStatus")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Ports/Ready/Ready.fpp_MODULE"
    "Fw_Ports_Ready")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Ports/Signal/Signal.fpp_MODULE"
    "Fw_Ports_Signal")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Ports/SuccessCondition/SuccessCondition.fpp_MODULE"
    "Fw_Ports_SuccessCondition")
include(utilities)
append_list_property("Fw_StringFormat" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Fw/Types/Types.fpp_MODULE"
    "Fw_Types")
set_property(GLOBAL PROPERTY FPRIME_Fw_StringFormat_snprintf_IMPLEMENTS Fw_StringFormat)
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Cycle/Cycle.fpp_MODULE"
    "Svc_Cycle")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Fatal/Fatal.fpp_MODULE"
    "Svc_Fatal")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/BufferAllocation.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/Com.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/Deframer.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/FrameAccumulator.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/Framer.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/Router.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Interfaces/Time.fpp_MODULE"
    "Svc_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ping/Ping.fpp_MODULE"
    "Svc_Ping")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PolyIf/PolyIf.fpp_MODULE"
    "Svc_PolyIf")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Sched/Sched.fpp_MODULE"
    "Svc_Sched")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Seq/Seq.fpp_MODULE"
    "Svc_Seq")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/WatchDog/WatchDog.fpp_MODULE"
    "Svc_WatchDog")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ports/CommsPorts/CommsPorts.fpp_MODULE"
    "Svc_Ports_CommsPorts")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ports/OsTimeEpoch/OsTimeEpoch.fpp_MODULE"
    "Svc_Ports_OsTimeEpoch")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ports/VersionPorts/VersionPorts.fpp_MODULE"
    "Svc_Ports_VersionPorts")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ActivePhaser/ActivePhaser.fpp_MODULE"
    "Svc_ActivePhaser")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ActiveRateGroup/ActiveRateGroup.fpp_MODULE"
    "Svc_ActiveRateGroup")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/AssertFatalAdapter/AssertFatalAdapter.fpp_MODULE"
    "Svc_AssertFatalAdapter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/BufferAccumulator/BufferAccumulator.fpp_MODULE"
    "Svc_BufferAccumulator")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/BufferManager/BufferManager.fpp_MODULE"
    "Svc_BufferManager")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/BufferLogger/BufferLogger.fpp_MODULE"
    "Svc_BufferLogger")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/BufferRepeater/BufferRepeater.fpp_MODULE"
    "Svc_BufferRepeater")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ChronoTime/ChronoTime.fpp_MODULE"
    "Svc_ChronoTime")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ComLogger/ComLogger.fpp_MODULE"
    "Svc_ComLogger")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ComQueue/ComQueue.fpp_MODULE"
    "Svc_ComQueue")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ComSplitter/ComSplitter.fpp_MODULE"
    "Svc_ComSplitter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ComStub/ComStub.fpp_MODULE"
    "Svc_ComStub")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/CmdDispatcher/CmdDispatcher.fpp_MODULE"
    "Svc_CmdDispatcher")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/CmdSequencer/CmdSequencer.fpp_MODULE"
    "Svc_CmdSequencer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/CmdSplitter/CmdSplitter.fpp_MODULE"
    "Svc_CmdSplitter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/DpCatalog/DpCatalog.fpp_MODULE"
    "Svc_DpCatalog")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/DpManager/DpManager.fpp_MODULE"
    "Svc_DpManager")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/DpPorts/DpPorts.fpp_MODULE"
    "Svc_DpPorts")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/DpWriter/DpWriter.fpp_MODULE"
    "Svc_DpWriter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/EventManager/EventManager.fpp_MODULE"
    "Svc_EventManager")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FatalHandler/FatalHandler.fpp_MODULE"
    "Svc_FatalHandler")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FileDownlinkPorts/FileDownlinkPorts.fpp_MODULE"
    "Svc_FileDownlinkPorts")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FileDownlink/FileDownlink.fpp_MODULE"
    "Svc_FileDownlink")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FileManager/FileManager.fpp_MODULE"
    "Svc_FileManager")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FileUplink/FileUplink.fpp_MODULE"
    "Svc_FileUplink")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FprimeDeframer/FprimeDeframer.fpp_MODULE"
    "Svc_FprimeDeframer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FprimeFramer/FprimeFramer.fpp_MODULE"
    "Svc_FprimeFramer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FprimeProtocol/FprimeProtocol.fpp_MODULE"
    "Svc_FprimeProtocol")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FprimeRouter/FprimeRouter.fpp_MODULE"
    "Svc_FprimeRouter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FrameAccumulator/FrameAccumulator.fpp_MODULE"
    "Svc_FrameAccumulator")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/GenericHub/GenericHub.fpp_MODULE"
    "Svc_GenericHub")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Health/Health.fpp_MODULE"
    "Svc_Health")
set_property(GLOBAL PROPERTY FPRIME_Svc_OsTime_test_RawTimeTester_IMPLEMENTS Os_RawTime)
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/OsTime/OsTime.fpp_MODULE"
    "Svc_OsTime")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PassiveRateGroup/PassiveRateGroup.hpp_MODULE"
    "Svc_PassiveRateGroup")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PassiveRateGroup/PassiveRateGroup.fpp_MODULE"
    "Svc_PassiveRateGroup")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PolyDb/PolyDb.fpp_MODULE"
    "Svc_PolyDb")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PrmDb/PrmDb.fpp_MODULE"
    "Svc_PrmDb")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/RateGroupDriver/RateGroupDriver.fpp_MODULE"
    "Svc_RateGroupDriver")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/SeqDispatcher/SeqDispatcher.fpp_MODULE"
    "Svc_SeqDispatcher")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/StaticMemory/StaticMemory.fpp_MODULE"
    "Svc_StaticMemory")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/TlmChan/TlmChan.fpp_MODULE"
    "Svc_TlmChan")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/TlmPacketizer/TlmPacketizer.fpp_MODULE"
    "Svc_TlmPacketizer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/SystemResources/SystemResources.fpp_MODULE"
    "Svc_SystemResources")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/CdhCore/CdhCoreConfig/CdhCoreConfig.fpp_MODULE"
    "Svc_Subtopologies_CdhCore_CdhCoreConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/CdhCore/CdhCoreConfig/CdhCoreFatalHandlerConfig.fpp_MODULE"
    "Svc_Subtopologies_CdhCore_CdhCoreConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/CdhCore/CdhCoreConfig/CdhCoreTlmConfig.fpp_MODULE"
    "Svc_Subtopologies_CdhCore_CdhCoreConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Subtopologies/CdhCore/CdhCore.fpp_MODULE"
    "Svc_Subtopologies_CdhCore")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/ComCcsds/ComCcsdsConfig/ComCcsdsConfig.fpp_MODULE"
    "Svc_Subtopologies_ComCcsds_ComCcsdsConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Subtopologies/ComCcsds/ComCcsds.fpp_MODULE"
    "Svc_Subtopologies_ComCcsds")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/ComFprime/ComFprimeConfig/ComFprimeConfig.fpp_MODULE"
    "Svc_Subtopologies_ComFprime_ComFprimeConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Subtopologies/ComFprime/ComFprime.fpp_MODULE"
    "Svc_Subtopologies_ComFprime")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/FileHandling/FileHandlingConfig/FileHandlingConfig.fpp_MODULE"
    "Svc_Subtopologies_FileHandling_FileHandlingConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Subtopologies/FileHandling/FileHandling.fpp_MODULE"
    "Svc_Subtopologies_FileHandling")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/DataProducts/DataProductsConfig/DataProductsConfig.fpp_MODULE"
    "Svc_Subtopologies_DataProducts_DataProductsConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Subtopologies/DataProducts/DataProducts.fpp_MODULE"
    "Svc_Subtopologies_DataProducts")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/build-fprime-automatic-native/F-Prime/Svc/Subtopologies/ComLoggerTee/ComLoggerTeeConfig/ComLoggerTeeConfig.fpp_MODULE"
    "Svc_Subtopologies_ComLoggerTee_ComLoggerTeeConfig")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Subtopologies/ComLoggerTee/ComLoggerTee.fpp_MODULE"
    "Svc_Subtopologies_ComLoggerTee")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PassiveConsoleTextLogger/PassiveConsoleTextLogger.fpp_MODULE"
    "Svc_PassiveConsoleTextLogger")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ActiveTextLogger/ActiveTextLogger.fpp_MODULE"
    "Svc_ActiveTextLogger")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/PosixTime/PosixTime.fpp_MODULE"
    "Svc_PosixTime")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/LinuxTimer/LinuxTimer.fpp_MODULE"
    "Svc_LinuxTimer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Version/Version.fpp_MODULE"
    "Svc_Version")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FpySequencer/FpySequencer.fpp_MODULE"
    "Svc_FpySequencer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/FpySequencer/FpySequencerTypes.fpp_MODULE"
    "Svc_FpySequencer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/Types/Types.fpp_MODULE"
    "Svc_Ccsds_Types")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/Ports/Ports.fpp_MODULE"
    "Svc_Ccsds_Ports")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/SpacePacketDeframer/SpacePacketDeframer.fpp_MODULE"
    "Svc_Ccsds_SpacePacketDeframer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/SpacePacketFramer/SpacePacketFramer.fpp_MODULE"
    "Svc_Ccsds_SpacePacketFramer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/TcDeframer/TcDeframer.fpp_MODULE"
    "Svc_Ccsds_TcDeframer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/TmFramer/TmFramer.fpp_MODULE"
    "Svc_Ccsds_TmFramer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/Ccsds/ApidManager/ApidManager.fpp_MODULE"
    "Svc_Ccsds_ApidManager")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Svc/ComAggregator/ComAggregator.fpp_MODULE"
    "Svc_ComAggregator")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/File.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/Task.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/Mutex.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/Directory.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/FileSystem.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/Generic.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/RawTime.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Models/Queue.fpp_MODULE"
    "Os_Models")
set_property(GLOBAL PROPERTY FPRIME_Os_File_Stub_IMPLEMENTS Os_File)
set_property(GLOBAL PROPERTY FPRIME_Os_Console_Stub_IMPLEMENTS Os_Console)
set_property(GLOBAL PROPERTY FPRIME_Os_Task_Stub_IMPLEMENTS Os_Task)
set_property(GLOBAL PROPERTY FPRIME_Os_Mutex_Stub_IMPLEMENTS Os_Mutex)
set_property(GLOBAL PROPERTY FPRIME_Os_Cpu_Stub_IMPLEMENTS Os_Cpu)
set_property(GLOBAL PROPERTY FPRIME_Os_Memory_Stub_IMPLEMENTS Os_Memory)
set_property(GLOBAL PROPERTY FPRIME_Os_Queue_Stub_IMPLEMENTS Os_Queue)
set_property(GLOBAL PROPERTY FPRIME_Os_RawTime_Stub_IMPLEMENTS Os_RawTime)
set_property(GLOBAL PROPERTY FPRIME_Os_File_None_IMPLEMENTS Os_File)
set_property(GLOBAL PROPERTY FPRIME_Os_File_Posix_IMPLEMENTS Os_File)
set_property(GLOBAL PROPERTY FPRIME_Os_Console_Posix_IMPLEMENTS Os_Console)
set_property(GLOBAL PROPERTY FPRIME_Os_Task_Posix_IMPLEMENTS Os_Task)
set_property(GLOBAL PROPERTY FPRIME_Os_Mutex_Posix_IMPLEMENTS Os_Mutex)
set_property(GLOBAL PROPERTY FPRIME_Os_RawTime_Posix_IMPLEMENTS Os_RawTime)
set_property(GLOBAL PROPERTY FPRIME_Os_Generic_PriorityQueue_IMPLEMENTS Os_Queue)
set_property(GLOBAL PROPERTY FPRIME_Os_Cpu_Linux_IMPLEMENTS Os_Cpu)
set_property(GLOBAL PROPERTY FPRIME_Os_Memory_Linux_IMPLEMENTS Os_Memory)
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Os/Types.fpp_MODULE"
    "Os")
include(utilities)
append_list_property("Os_Console" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_File" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_Task" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_Mutex" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_Queue" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_Cpu" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_Memory" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
include(utilities)
append_list_property("Os_RawTime" GLOBAL PROPERTY FPRIME_REQUIRED_IMPLEMENTATIONS)
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/AsyncByteStreamDriver.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/ByteStreamDriver.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/Gpio.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/I2c.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/PassiveAsyncByteStreamDriverClient.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/PassiveBufferDriver.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/PassiveBufferDriverClient.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/PassiveByteStreamDriverClient.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/PassiveByteStreamDriverClientReadyRecv.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/Spi.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Interfaces/Tick.fpp_MODULE"
    "Drv_Interfaces")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Ports/DataTypes/DataTypes.fpp_MODULE"
    "Drv_Ports_DataTypes")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Ports/GpioDriverPorts.fpp_MODULE"
    "Drv_Ports")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Ports/I2cDriverPorts.fpp_MODULE"
    "Drv_Ports")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Ports/SpiDriverPorts.fpp_MODULE"
    "Drv_Ports")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/AsyncByteStreamBufferAdapter/AsyncByteStreamBufferAdapter.fpp_MODULE"
    "Drv_AsyncByteStreamBufferAdapter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/ByteStreamBufferAdapter/ByteStreamBufferAdapter.fpp_MODULE"
    "Drv_ByteStreamBufferAdapter")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/ByteStreamDriverModel/ByteStreamDriverModel.fpp_MODULE"
    "Drv_ByteStreamDriverModel")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/LinuxGpioDriver/LinuxGpioDriver.fpp_MODULE"
    "Drv_LinuxGpioDriver")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/LinuxI2cDriver/LinuxI2cDriver.fpp_MODULE"
    "Drv_LinuxI2cDriver")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/LinuxSpiDriver/LinuxSpiDriver.fpp_MODULE"
    "Drv_LinuxSpiDriver")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/LinuxUartDriver/LinuxUartDriver.fpp_MODULE"
    "Drv_LinuxUartDriver")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/TcpClient/TcpClient.fpp_MODULE"
    "Drv_TcpClient")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/TcpServer/TcpServer.fpp_MODULE"
    "Drv_TcpServer")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/lib/fprime/Drv/Udp/Udp.fpp_MODULE"
    "Drv_Udp")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/ChessSim/Components/CsvTM/CsvTM.fpp_MODULE"
    "ChessSim_Components_CsvTM")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/DeploymentSim/Top/instances.fpp_MODULE"
    "DeploymentSim_Top")
set_property(GLOBAL PROPERTY "FPRIME_/home/melinad/CHESS-MCS/DeploymentSim/Top/topology.fpp_MODULE"
    "DeploymentSim_Top")
