import sys
sys.path.append("..")
import fake_rpi
from unittest.mock import MagicMock, Mock

sys.modules['RPi'] = fake_rpi.RPi  # Fake RPi
sys.modules['RPi.GPIO'] = fake_rpi.RPi.GPIO  # Fake GPIO
sys.modules['spidev'] = MagicMock()

# from travis_tests.aws_tst import default
# from raspberrypi_src.component_files.tst import default
from raspberrypi_src.main import default, createSPI

# def test_default():
#     a = 1
#     b = 2
#     assert a + b == 3, "test failed"


def test_default():
    assert default(1, 2) == 3, "test failed"


def test_createSPI():
    spi = createSPI(0, 0)
    check_max_speed = spi.max_speed_hz
    check_mode = spi.mode
    assert check_max_speed == 1000000, "test failed"
    assert check_mode == 0, "test failed"
