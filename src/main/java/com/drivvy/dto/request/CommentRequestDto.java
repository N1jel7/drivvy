package com.drivvy.dto.request;

public record CommentRequestDto(
        Long authorId,
        Long postId,
        String content
) {
}
