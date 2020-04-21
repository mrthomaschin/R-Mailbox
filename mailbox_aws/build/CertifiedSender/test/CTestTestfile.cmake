# CMake generated Testfile for 
# Source directory: /home/pi/mailbox/avs-device-sdk/CertifiedSender/test
# Build directory: /home/pi/mailbox/build/CertifiedSender/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(CertifiedSenderTest.test_clearData "/home/pi/mailbox/build/CertifiedSender/test/CertifiedSenderTest" "--gtest_filter=CertifiedSenderTest.test_clearData" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(CertifiedSenderTest.testSendMessageWithURI "/home/pi/mailbox/build/CertifiedSender/test/CertifiedSenderTest" "--gtest_filter=CertifiedSenderTest.testSendMessageWithURI" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.test_constructionAndDestruction "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.test_constructionAndDestruction" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.test_databaseCreation "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.test_databaseCreation" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.test_openAndCloseDatabase "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.test_openAndCloseDatabase" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.test_databaseStoreAndLoad "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.test_databaseStoreAndLoad" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.test_databaseErase "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.test_databaseErase" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.test_databaseClear "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.test_databaseClear" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
add_test(MessageStorageTest.testDatabaseStoreAndLoadWithURI "/home/pi/mailbox/build/CertifiedSender/test/MessageStorageTest" "--gtest_filter=MessageStorageTest.testDatabaseStoreAndLoadWithURI" "/home/pi/mailbox/avs-device-sdk/CertifiedSender/test")
subdirs("Common")
