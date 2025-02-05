package com.drivvy.exception;

public class ConvertFileException extends RuntimeException {
    public ConvertFileException(String message) {
        super(message);
    }

    public ConvertFileException(String message, Throwable cause) {
        super(message, cause);
    }
}
