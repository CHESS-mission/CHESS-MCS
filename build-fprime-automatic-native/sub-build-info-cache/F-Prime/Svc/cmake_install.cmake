# Install script for directory: /home/melinad/CHESS-MCS/lib/fprime/Svc

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/melinad/CHESS-MCS/build-artifacts")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Cycle/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Fatal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Interfaces/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Ping/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/PolyIf/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Sched/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Seq/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/WatchDog/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Ports/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ActivePhaser/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ActiveRateGroup/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/AssertFatalAdapter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/BufferAccumulator/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/BufferManager/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/BufferLogger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/BufferRepeater/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ChronoTime/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ComLogger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ComQueue/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ComSplitter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ComStub/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/CmdDispatcher/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/CmdSequencer/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/CmdSplitter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/DpCatalog/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/DpManager/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/DpPorts/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/DpWriter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/EventManager/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FatalHandler/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FileDownlinkPorts/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FileDownlink/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FileManager/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FileUplink/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FprimeDeframer/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FprimeFramer/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FprimeProtocol/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FprimeRouter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FrameAccumulator/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FramingProtocol/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/GenericHub/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Health/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/OsTime/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/PassiveRateGroup/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/PolyDb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/PrmDb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/RateGroupDriver/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/SeqDispatcher/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/StaticMemory/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/TlmChan/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/TlmPacketizer/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/SystemResources/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Subtopologies/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/PassiveConsoleTextLogger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ActiveTextLogger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/PosixTime/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/LinuxTimer/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Version/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/FpySequencer/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/Ccsds/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/melinad/CHESS-MCS/build-fprime-automatic-native/sub-build-info-cache/F-Prime/Svc/ComAggregator/cmake_install.cmake")
endif()

