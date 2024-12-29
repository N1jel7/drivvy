package com.drivvy.dto.request;

public record LoginRequestDto(
        String username,
        String password
) {
}
