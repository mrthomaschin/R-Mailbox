import sys
sys.path.append("..")
import fake_rpi
import unittest
from unittest.mock import Mock, MagicMock, patch

sys.modules['RPi'] = fake_rpi.RPi  # Fake RPi
sys.modules['RPi.GPIO'] = fake_rpi.RPi.GPIO  # Fake GPIO
sys.modules['spidev'] = MagicMock()

# from travis_tests.aws_tst import default
# from raspberrypi_src.component_files.tst import default
from raspberrypi_src.component_files.aws_spi_tst import default, app, isMail

# def test_default():
#     a = 1
#     b = 2
#     assert a + b == 3, "test failed" s


def test_default():
    assert default(1, 2) == 3, "test failed"


# Raspberry Pi sends a statement to Alexa
def test_aws():
    statement_mock = isMail()
    phrase = statement_mock._response['outputSpeech']['text']
    assert phrase == "There is currently no mail", "test failed"
