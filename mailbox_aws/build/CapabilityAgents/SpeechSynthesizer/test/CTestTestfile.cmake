# CMake generated Testfile for 
# Source directory: /home/pi/mailbox/avs-device-sdk/CapabilityAgents/SpeechSynthesizer/test
# Build directory: /home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(SpeechSynthesizerTest.test_callingHandleImmediately "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingHandleImmediately")
add_test(SpeechSynthesizerTest.test_callingHandle "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingHandle")
add_test(SpeechSynthesizerTest.test_callingCancel "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingCancel")
add_test(SpeechSynthesizerTest.test_callingCancelAfterHandle "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingCancelAfterHandle")
add_test(SpeechSynthesizerTest.test_callingProvideStateWhenNotPlaying "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingProvideStateWhenNotPlaying")
add_test(SpeechSynthesizerTest.test_callingProvideStateWhenPlaying "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingProvideStateWhenPlaying")
add_test(SpeechSynthesizerTest.testTimer_bargeInWhilePlaying "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.testTimer_bargeInWhilePlaying")
set_tests_properties(SpeechSynthesizerTest.testTimer_bargeInWhilePlaying PROPERTIES  LABELS "timertest")
add_test(SpeechSynthesizerTest.testTimer_notCallStopTwice "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.testTimer_notCallStopTwice")
set_tests_properties(SpeechSynthesizerTest.testTimer_notCallStopTwice PROPERTIES  LABELS "timertest")
add_test(SpeechSynthesizerTest.testSlow_callingCancelBeforeOnFocusChanged "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.testSlow_callingCancelBeforeOnFocusChanged")
set_tests_properties(SpeechSynthesizerTest.testSlow_callingCancelBeforeOnFocusChanged PROPERTIES  LABELS "slowtest")
add_test(SpeechSynthesizerTest.test_callingCancelBeforeOnExecuteStateChanged "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_callingCancelBeforeOnExecuteStateChanged")
add_test(SpeechSynthesizerTest.test_mediaPlayerFailedToStop "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_mediaPlayerFailedToStop")
add_test(SpeechSynthesizerTest.testTimer_mediaPlayerAlwaysFailToStop "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.testTimer_mediaPlayerAlwaysFailToStop")
set_tests_properties(SpeechSynthesizerTest.testTimer_mediaPlayerAlwaysFailToStop PROPERTIES  LABELS "timertest")
add_test(SpeechSynthesizerTest.testSlow_setStateTimeout "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.testSlow_setStateTimeout")
set_tests_properties(SpeechSynthesizerTest.testSlow_setStateTimeout PROPERTIES  LABELS "slowtest")
add_test(SpeechSynthesizerTest.test_givenPlayingStateFocusBecomesNone "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_givenPlayingStateFocusBecomesNone")
add_test(SpeechSynthesizerTest.testTimer_onPlayedStopped "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.testTimer_onPlayedStopped")
set_tests_properties(SpeechSynthesizerTest.testTimer_onPlayedStopped PROPERTIES  LABELS "timertest")
add_test(SpeechSynthesizerTest.test_replaceAllWithEmptyQueue "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_replaceAllWithEmptyQueue")
add_test(SpeechSynthesizerTest.test_replaceAllWithNonEmptyQueue "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_replaceAllWithNonEmptyQueue")
add_test(SpeechSynthesizerTest.test_replaceAllStopActiveSpeech "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_replaceAllStopActiveSpeech")
add_test(SpeechSynthesizerTest.test_enqueueWithActiveSpeech "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_enqueueWithActiveSpeech")
add_test(SpeechSynthesizerTest.test_replaceEnqueuedWithAnotherEnqueuedItem "/home/pi/mailbox/build/CapabilityAgents/SpeechSynthesizer/test/SpeechSynthesizerTest" "--gtest_filter=SpeechSynthesizerTest.test_replaceEnqueuedWithAnotherEnqueuedItem")
