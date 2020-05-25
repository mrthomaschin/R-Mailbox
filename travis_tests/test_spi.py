import sys
import fake_rpi
import fake_rpi
from unittest.mock import Mock

sys.modules['RPi'] = fake_rpi.RPi  # Fake RPi
sys.modules['RPi.GPIO'] = fake_rpi.RPi.GPIO  # Fake GPIO
sys.modules['spidev'] = Mock()
sys.modules['flask_ask'] = Mock()

# from travis_tests.aws_tst import default
# from raspberrypi_src.component_files.tst import default
from raspberrypi_src.component_files.aws_spi_tst import default, createSPI

# def test_default():
#     a = 1
#     b = 2
#     assert a + b == 3, "test failed"


def test_default():
    assert default(1, 2) == 3, "test failed"


def test_createSPI():
    spi = createSPI(0, 0)
    print(spi)
    assert spi != "", "test failed"
