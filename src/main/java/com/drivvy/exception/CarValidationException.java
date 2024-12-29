package com.drivvy.exception;

public class CarValidationException extends RuntimeException {
    public CarValidationException(String message) {
        super(message);
    }

    public CarValidationException(String message, Throwable cause) {
        super(message, cause);
    }
}
