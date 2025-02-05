package com.drivvy.dto.response;

public record MessageResponseDto(
        Long id,
        String author,
        String content,
        String createdAt
) {
}
