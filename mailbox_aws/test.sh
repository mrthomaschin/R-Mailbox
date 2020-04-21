  echo
  echo "==============> BUILDING Tests =============="
  echo
  mkdir -p "/home/pi/mailbox/avs-device-sdk/KWD/inputs/SensoryModels/"
  cp "/home/pi/mailbox/third-party/alexa-rpi/models/spot-alexa-rpi-31000.snsr" "/home/pi/mailbox/avs-device-sdk/KWD/inputs/SensoryModels/"
  cd /home/pi/mailbox/build
  make all test -j2
