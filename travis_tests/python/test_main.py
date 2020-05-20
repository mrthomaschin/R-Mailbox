from travis_tests.main import sum


def test_default():
    x = 5
    y = 6
    assert x + 1 == y, "test failed"


def test_main_function():
    assert sum(1, 2) == 3, "test failed"
