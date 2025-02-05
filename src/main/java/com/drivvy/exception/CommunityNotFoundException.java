package com.drivvy.exception;

public class CommunityNotFoundException extends RuntimeException {
    public CommunityNotFoundException(String message) {
        super(message);
    }

    public CommunityNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
