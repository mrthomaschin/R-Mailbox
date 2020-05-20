import pytest
from raspberrypi_src.component_files.aws_spi_tst import 


def test_default():
    x = 5
    y = 6
    assert x + 1 == y, "test failed"
