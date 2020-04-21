# Install script for directory: /home/pi/mailbox/avs-device-sdk/ApplicationUtilities/DefaultClient/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "DEBUG")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libDefaultClient.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE SHARED_LIBRARY FILES "/home/pi/mailbox/build/ApplicationUtilities/DefaultClient/src/libDefaultClient.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so"
         OLD_RPATH "/home/pi/mailbox/build/CapabilityAgents/AIP/src:/home/pi/mailbox/build/CapabilityAgents/Alerts/src:/home/pi/mailbox/build/CapabilityAgents/ApiGateway/src:/home/pi/mailbox/build/CapabilityAgents/AudioPlayer/src:/home/pi/mailbox/build/CapabilityAgents/System/src:/home/pi/mailbox/build/CapabilityAgents/Bluetooth/src:/home/pi/mailbox/build/EXTENSION/DoNotDisturb/src:/home/pi/mailbox/build/Endpoints/src:/home/pi/mailbox/build/CapabilityAgents/Equalizer/src:/home/pi/mailbox/build/CapabilityAgents/ExternalMediaPlayer/src:/home/pi/mailbox/build/CapabilityAgents/InteractionModel/src:/home/pi/mailbox/build/CapabilityAgents/Notifications/src:/home/pi/mailbox/build/CapabilityAgents/PlaybackController/src:/home/pi/mailbox/build/CapabilityAgents/SpeakerManager/src:/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/src:/home/pi/mailbox/build/ApplicationUtilities/SystemSoundPlayer/src:/home/pi/mailbox/build/CapabilityAgents/TemplateRuntime/src:/home/pi/mailbox/build/ADSL/src:/home/pi/mailbox/build/AFML/src:/home/pi/mailbox/build/InterruptModel/src:/home/pi/mailbox/build/SpeechEncoder/src:/home/pi/mailbox/build/ACL/src:/home/pi/mailbox/build/Settings/src:/home/pi/mailbox/build/CapabilityAgents/Alexa/src:/home/pi/mailbox/build/EqualizerImplementations/src:/home/pi/mailbox/build/CertifiedSender/src:/home/pi/mailbox/build/ApplicationUtilities/Resources/Audio/src:/home/pi/mailbox/build/RegistrationManager/src:/home/pi/mailbox/build/Storage/SQLiteStorage/src:/home/pi/mailbox/build/ContextManager/src:/home/pi/mailbox/build/Captions/Interface/src:/home/pi/mailbox/build/AVSCommon:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/lib/libDefaultClient.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE DIRECTORY FILES "/home/pi/mailbox/avs-device-sdk/ApplicationUtilities/DefaultClient/include")
endif()

