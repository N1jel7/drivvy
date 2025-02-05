package com.drivvy.dto.response;

import com.drivvy.model.Message;

import java.util.List;

public record GroupChatResponseDto(
        Long id,
        String title,
        String avatar,
        List<MessageResponseDto> messages,
        Message lastMessage
) {
}
