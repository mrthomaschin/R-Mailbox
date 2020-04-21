# CMake generated Testfile for 
# Source directory: /home/pi/mailbox/avs-device-sdk/KWD/Sensory/test
# Build directory: /home/pi/mailbox/build/KWD/Sensory/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(SensoryKeywordTest.test_invalidStream "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_invalidStream" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_incompatibleEndianness "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_incompatibleEndianness" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_getExpectedNumberOfDetectionsInFourAlexasAudioFileForOneObserver "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_getExpectedNumberOfDetectionsInFourAlexasAudioFileForOneObserver" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_getExpectedNumberOfDetectionsInFourAlexasAudioFileForTwoObservers "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_getExpectedNumberOfDetectionsInFourAlexasAudioFileForTwoObservers" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_getExpectedNumberOfDetectionsInAlexaStopAlexaJokeAudioFileForOneObserver "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_getExpectedNumberOfDetectionsInAlexaStopAlexaJokeAudioFileForOneObserver" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_getActiveState "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_getActiveState" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_getStreamClosedState "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_getStreamClosedState" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
add_test(SensoryKeywordTest.test_getExpectedNumberOfDetectionsInAlexaStopAlexaJokeAudioFileWithRandomDataAtBeginning "/home/pi/mailbox/build/KWD/Sensory/test/SensoryKeywordDetectorTest" "--gtest_filter=SensoryKeywordTest.test_getExpectedNumberOfDetectionsInAlexaStopAlexaJokeAudioFileWithRandomDataAtBeginning" "/home/pi/mailbox/avs-device-sdk/KWD/inputs")
