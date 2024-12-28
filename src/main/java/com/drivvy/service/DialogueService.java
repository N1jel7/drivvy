package com.drivvy.service;

import com.drivvy.dto.response.DialogueResponseDto;
import com.drivvy.dto.response.MessageResponseDto;
import com.drivvy.model.Dialogue;
import com.drivvy.model.Message;

import java.util.List;

public interface DialogueService {

    DialogueResponseDto addMessage(Message message, Long dialogueId);

    DialogueResponseDto getDialogueById(long id);

    List<DialogueResponseDto> getUserDialogues(String username);

    DialogueResponseDto createDialogue(String currentUsername, String UsernameToChat);

}
