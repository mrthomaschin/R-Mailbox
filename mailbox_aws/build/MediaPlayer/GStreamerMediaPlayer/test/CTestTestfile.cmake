# CMake generated Testfile for 
# Source directory: /home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/test
# Build directory: /home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(ErrorTypeConversionTest.test_errorTypeToString "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/ErrorTypeConversionTest" "--gtest_filter=ErrorTypeConversionTest.test_errorTypeToString" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(ErrorTypeConversionTest.test_gstCoreErrorToErrorType "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/ErrorTypeConversionTest" "--gtest_filter=ErrorTypeConversionTest.test_gstCoreErrorToErrorType" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(ErrorTypeConversionTest.test_gstLibraryErrorToErrorType "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/ErrorTypeConversionTest" "--gtest_filter=ErrorTypeConversionTest.test_gstLibraryErrorToErrorType" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(ErrorTypeConversionTest.test_gstResourceErrorToErrorType "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/ErrorTypeConversionTest" "--gtest_filter=ErrorTypeConversionTest.test_gstResourceErrorToErrorType" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(ErrorTypeConversionTest.test_gstStreamErrorToErrorType "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/ErrorTypeConversionTest" "--gtest_filter=ErrorTypeConversionTest.test_gstStreamErrorToErrorType" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.testSlow_startPlayWaitForEnd/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_startPlayWaitForEnd/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_startPlayWaitForEnd/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_startPlayForUrl/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_startPlayForUrl/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_startPlayForUrl/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_consecutiveSetSource/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_consecutiveSetSource/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_consecutiveSetSource/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_startPlayWaitForEndStartPlayAgain/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_startPlayWaitForEndStartPlayAgain/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_startPlayWaitForEndStartPlayAgain/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_stopPlay/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_stopPlay/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_stopPlay/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_startPlayCallAfterStopPlay/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_startPlayCallAfterStopPlay/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_startPlayCallAfterStopPlay/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_startPlayCallAfterStopPlayDifferentSource/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_startPlayCallAfterStopPlayDifferentSource/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_startPlayCallAfterStopPlayDifferentSource/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_pauseDuringPlay/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_pauseDuringPlay/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_pauseDuringPlay/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_resumeAfterPauseThenStop/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_resumeAfterPauseThenStop/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_resumeAfterPauseThenStop/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_stopAfterPause/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_stopAfterPause/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_stopAfterPause/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_pauseAfterPause/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_pauseAfterPause/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_pauseAfterPause/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.test_resumeAfterPlay/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_resumeAfterPlay/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.testTimer_getOffsetInMilliseconds/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testTimer_getOffsetInMilliseconds/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testTimer_getOffsetInMilliseconds/* PROPERTIES  LABELS "timertest")
add_test(*/MediaPlayerTest.test_getOffsetInMillisecondsNullPipeline/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_getOffsetInMillisecondsNullPipeline/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.testSlow_getOffsetWhenStoppedFails/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_getOffsetWhenStoppedFails/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_getOffsetWhenStoppedFails/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_getOffsetWhenPaused/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_getOffsetWhenPaused/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_getOffsetWhenPaused/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_playingTwoAttachments/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_playingTwoAttachments/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_playingTwoAttachments/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_unsteadyReads/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_also_run_disabled_tests" "--gtest_filter=*/MediaPlayerTest.DISABLED_testSlow_unsteadyReads/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_unsteadyReads/* PROPERTIES  DISABLED "TRUE" LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_recoveryFromPausedReads/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_also_run_disabled_tests" "--gtest_filter=*/MediaPlayerTest.DISABLED_testSlow_recoveryFromPausedReads/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_recoveryFromPausedReads/* PROPERTIES  DISABLED "TRUE" LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_startPlayWithUrlPlaylistWaitForEnd/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_startPlayWithUrlPlaylistWaitForEnd/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_startPlayWithUrlPlaylistWaitForEnd/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testTimer_setOffsetSeekableSource/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testTimer_setOffsetSeekableSource/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testTimer_setOffsetSeekableSource/* PROPERTIES  LABELS "timertest")
add_test(*/MediaPlayerTest.test_setOffsetOutsideBounds/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_also_run_disabled_tests" "--gtest_filter=*/MediaPlayerTest.DISABLED_test_setOffsetOutsideBounds/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.test_setOffsetOutsideBounds/* PROPERTIES  DISABLED "TRUE")
add_test(*/MediaPlayerTest.test_setSourceResetsOffset/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_also_run_disabled_tests" "--gtest_filter=*/MediaPlayerTest.DISABLED_test_setSourceResetsOffset/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.test_setSourceResetsOffset/* PROPERTIES  DISABLED "TRUE")
add_test(*/MediaPlayerTest.testSlow_repeatAttachment/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_repeatAttachment/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_repeatAttachment/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_setVolumePlays/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_setVolumePlays/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_setVolumePlays/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_setMutePlays/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_setMutePlays/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_setMutePlays/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.test_getSpeakerSettings/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_getSpeakerSettings/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.testSlow_readTags/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_readTags/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_readTags/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.test_consecutiveSameApiCalls/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_consecutiveSameApiCalls/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.testSlow_immediatePause/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_immediatePause/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_immediatePause/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_multiplePlayAndSetSource/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_multiplePlayAndSetSource/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_multiplePlayAndSetSource/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.test_invalidSourceId/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_invalidSourceId/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.test_doublePause/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_doublePause/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.test_resumeWhenPlaying/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_resumeWhenPlaying/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.test_resumeWhenStopped/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_resumeWhenStopped/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.test_newSetSourceLeadsToStoppedCallback/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.test_newSetSourceLeadsToStoppedCallback/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(*/MediaPlayerTest.testSlow_resumeAfterPauseWithPendingPlay/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_resumeAfterPauseWithPendingPlay/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_resumeAfterPauseWithPendingPlay/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_PlayWithFadeIn/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_PlayWithFadeIn/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_PlayWithFadeIn/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_PlayWithFadeInMidVolume/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_PlayWithFadeInMidVolume/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_PlayWithFadeInMidVolume/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_PlayWithFadeInOutOfLimit/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_PlayWithFadeInOutOfLimit/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_PlayWithFadeInOutOfLimit/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_PlayWithFadeInStartGreater/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_PlayWithFadeInStartGreater/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_PlayWithFadeInStartGreater/* PROPERTIES  LABELS "slowtest")
add_test(*/MediaPlayerTest.testSlow_repeatPlayForUrl/* "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/MediaPlayerTest" "--gtest_filter=*/MediaPlayerTest.testSlow_repeatPlayForUrl/*" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
set_tests_properties(*/MediaPlayerTest.testSlow_repeatPlayForUrl/* PROPERTIES  LABELS "slowtest")
add_test(NormalizerTest.test_normalizeNullResult "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeNullResult" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_createSourceMinGreaterThanMax "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_createSourceMinGreaterThanMax" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_createSourceMinEqualToMax "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_createSourceMinEqualToMax" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_createNormalizeMinGreaterThanMax "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_createNormalizeMinGreaterThanMax" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeNormalizedMinEqualToMax "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeNormalizedMinEqualToMax" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeInputOutsideSourceBounds "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeInputOutsideSourceBounds" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeSameScale "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeSameScale" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeScaleDown "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeScaleDown" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeScaleUp "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeScaleUp" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeNegativeRange "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeNegativeRange" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_normalizeDifferentMinimums "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_normalizeDifferentMinimums" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")
add_test(NormalizerTest.test_nonInteger "/home/pi/mailbox/build/MediaPlayer/GStreamerMediaPlayer/test/NormalizerTest" "--gtest_filter=NormalizerTest.test_nonInteger" "/home/pi/mailbox/avs-device-sdk/MediaPlayer/GStreamerMediaPlayer/../inputs")