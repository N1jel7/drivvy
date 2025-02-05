package com.drivvy.service.api;

import com.drivvy.dto.request.MessageRequestDto;
import com.drivvy.dto.response.ChatResponseDto;

import java.util.List;

public interface ChatService {

    ChatResponseDto sendMessage(MessageRequestDto messageRequestDto, Long GroupChatId);

    ChatResponseDto getChatById(Long id);

    List<ChatResponseDto> getUserChats(Long id);

    ChatResponseDto create(List<String> users);

}
