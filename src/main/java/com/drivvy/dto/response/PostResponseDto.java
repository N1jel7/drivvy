package com.drivvy.dto.response;

import java.time.LocalDateTime;
import java.util.List;

public record PostResponseDto(
        Long id,
        String description,
        String title,
        List<UserResponseDto> usersLiked,
        Integer likesAmount,
        Integer commentsAmount,
        LocalDateTime createdAt,
        String preview,
        List<ImageResponseDto> images,
        List<CommentResponseDto> comments
) {
}
