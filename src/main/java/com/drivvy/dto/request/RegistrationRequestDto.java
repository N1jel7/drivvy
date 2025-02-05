package com.drivvy.dto.request;

public record RegistrationRequestDto(
        String username,
        String password,
        String email
) {
}
