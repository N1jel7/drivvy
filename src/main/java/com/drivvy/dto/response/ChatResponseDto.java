package com.drivvy.dto.response;

import com.drivvy.model.Message;

import java.util.List;

public record ChatResponseDto(
        Long id,
        UserResponseDto companion,
        List<MessageResponseDto> messages,
        Message lastMessage
) {
}
