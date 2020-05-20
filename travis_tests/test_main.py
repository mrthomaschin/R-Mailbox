from raspberrypi_src.component_files.aws_spi_tst import default


def test_default():
    assert sum(1, 2) == 3, "test failed"
