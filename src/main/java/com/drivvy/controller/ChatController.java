package com.drivvy.controller;

import com.drivvy.dto.request.MessageRequestDto;
import com.drivvy.dto.response.ChatResponseDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.ChatServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor

public class ChatController {

    private final ChatServiceImpl chatService;

    @PostMapping("/chats/{chatId}")
    public String sendMessage(MessageRequestDto messageRequestDto, @PathVariable Long chatId, Model model, @SessionAttribute UserDto userDto) {

        model.addAttribute("chat", chatService.sendMessage(
                new MessageRequestDto(userDto.getUsername(), messageRequestDto.content()),
                chatId));

        return "redirect:/chats";
    }

    @GetMapping("/chats")
    public String chats(@SessionAttribute UserDto userDto, Model model) {
        List<ChatResponseDto> chats = chatService.getUserChats(userDto.getId());
        model.addAttribute("chats", chats);
        return "messages/chat";
    }

    @PostMapping("chats/create")
    public String createChat(String findingUsername, Model model, @SessionAttribute UserDto userDto) {

        ChatResponseDto chat = chatService.create(List.of(userDto.getUsername(), findingUsername));

        if(chat == null) {
            log.warn("Chat is not created");
            //TODO warning "Chat is not created, user not found"
            return "redirect:/chats";
        }

        model.addAttribute("chat", chat);
        return "redirect:/chats";
    }
}
