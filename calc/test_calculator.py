import pytest
import calculator

def test_add_positive():
    assert calculator.add(2, 3) == 5

def test_add_negative():
    assert calculator.add(-2, -3) == -5

def test_subtract_positive():
    assert calculator.subtract(5, 3) == 2

def test_subtract_negative():
    assert calculator.subtract(-5, -3) == -2

def test_multiply_positive():
    assert calculator.multiply(2, 4) == 8

def test_multiply_negative():
    assert calculator.multiply(-2, 4) == -8

def test_divide_positive():
    assert calculator.divide(10, 2) == 5

def test_divide_negative():
    assert calculator.divide(-10, 2) == -5

def test_divide_fraction():
    assert calculator.divide(5, 2) == 2.5

def test_divide_zero():
    with pytest.raises(ValueError):
        calculator.divide(10, 0)
