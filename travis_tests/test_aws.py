import sys
sys.path.append("..")
import fake_rpi
from unittest import mock
from unittest.mock import MagicMock, patch, Mock

sys.modules['RPi'] = fake_rpi.RPi  # Fake RPi
sys.modules['RPi.GPIO'] = fake_rpi.RPi.GPIO  # Fake GPIO
sys.modules['spidev'] = MagicMock()

# from travis_tests.aws_tst import default
# from raspberrypi_src.component_files.tst import default
from raspberrypi_src.main import default, isMail, createSPI

# def test_default():
#     a = 1
#     b = 2
#     assert a + b == 3, "test failed"


def test_default():
    assert default(1, 2) == 3, "test failed"


class atmegaSPIMock:
    def xfer(self, x):
        return

    def readbytes(self, y):
        return 1


# Raspberry Pi does not detect package, sends a statement to Alexa
@patch('spidev.atmegaSPI', atmegaSPIMock)
def test_aws_command_no():
    statement_mock = isMail()
    phrase = statement_mock._response['outputSpeech']['text']
    assert phrase == "There is currently no mail", "test failed"


# # Raspberry Pi detects package, sends a statement to Alexa
# def test_aws_command_yes():
#     sys.modules['spidev'].SpiDev.readbytes.return_value = 1

#     statement_mock = isMail()
#     phrase = statement_mock._response['outputSpeech']['text']
#     print("........")
#     print(phrase)
#     assert phrase == "There is currently no mail", "test failed"
