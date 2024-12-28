package com.drivvy.dto.response;

import java.util.List;

public record DialogueResponseDto(
        Long id,
        String title,
        String avatar,
        List<MessageResponseDto> messages
) {
}
