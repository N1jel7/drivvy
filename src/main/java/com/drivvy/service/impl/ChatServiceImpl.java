package com.drivvy.service.impl;

import com.drivvy.auth.AuthUtil;
import com.drivvy.dto.request.MessageRequestDto;
import com.drivvy.dto.response.ChatResponseDto;
import com.drivvy.dto.response.MessageResponseDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.exception.ChatNotFoundException;
import com.drivvy.mapper.ChatMapper;
import com.drivvy.mapper.MessageMapper;
import com.drivvy.model.Chat;
import com.drivvy.model.Message;
import com.drivvy.model.User;
import com.drivvy.repository.ChatRepository;
import com.drivvy.repository.MessageRepository;
import com.drivvy.service.api.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mapstruct.factory.Mappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

    private final ChatRepository chatRepository;
    private final MessageRepository messageRepository;
    private final UserServiceImpl userService;
    private final ChatMapper chatMapper;

    public ChatResponseDto sendMessage(MessageRequestDto messageRequestDto, Long dialogueId) {
        messageRepository.save(
                Message.builder()
                        .sender(userService.getUserByUsername(messageRequestDto.author()))
                        .content(messageRequestDto.content())
                        .chat(findChatById(dialogueId))
                        .build()
        );
        return getChatById(dialogueId);
    }


    @Override
    public ChatResponseDto getChatById(Long id) {
        log.info("Getting chat with id");
        return chatMapper.mapToResponse(findChatById(id));
    }

    private Chat findChatById(Long id) {
        return chatRepository.findById(id).orElseThrow(() -> new ChatNotFoundException("Chat not found"));
    }

    public List<ChatResponseDto> getUserChats(Long userId) {
        User user = userService.getUserById(userId);
        return chatMapper.mapToResponse(chatRepository.findByUsersContains(user));
    }

    public ChatResponseDto create(List<String> users) {
        List<User> chatMembers = users.stream()
                .map(userService::getUserByUsername)
                .toList();

        Chat chat = Chat.builder()
                .type(Chat.Type.PRIVATE)
                .users(chatMembers)
                .build();

        return chatMapper.mapToResponse(chatRepository.saveAndFlush(chat));
    }
}
