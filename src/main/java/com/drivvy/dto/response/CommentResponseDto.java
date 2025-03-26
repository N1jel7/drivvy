package com.drivvy.dto.response;

import java.time.LocalDateTime;

public record CommentResponseDto(
        UserResponseDto author,
        LocalDateTime createdAt,
        String content
) {
}
