# CMake generated Testfile for 
# Source directory: /home/pi/mailbox/avs-device-sdk/InterruptModel/test
# Build directory: /home/pi/mailbox/build/InterruptModel/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(InterruptModelTest.test_emptyConfiguration "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_emptyConfiguration" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_NonExistentChannelConfigReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_NonExistentChannelConfigReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_MissingContentTypeKeyReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_MissingContentTypeKeyReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_MissingMixingBehaviorKeyReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_MissingMixingBehaviorKeyReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_MissingConfigReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_MissingConfigReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_MissingIncomingChannelKeyReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_MissingIncomingChannelKeyReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_UnspecifiedMixingBehaviorKeyReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_UnspecifiedMixingBehaviorKeyReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_UnspecifiedIncomingMixingBehaviorReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_UnspecifiedIncomingMixingBehaviorReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
add_test(InterruptModelTest.test_InvalidIncomingMixingBehaviorReturnsUndefined "/home/pi/mailbox/build/InterruptModel/test/InterruptModelTest" "--gtest_filter=InterruptModelTest.test_InvalidIncomingMixingBehaviorReturnsUndefined" "/home/pi/mailbox/avs-device-sdk/InterruptModel/test")
