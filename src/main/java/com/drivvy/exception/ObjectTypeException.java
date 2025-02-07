package com.drivvy.exception;

public class ObjectTypeException extends RuntimeException {
    public ObjectTypeException(String message) {
        super(message);
    }

    public ObjectTypeException(String message, Throwable cause) {
        super(message, cause);
    }
}
