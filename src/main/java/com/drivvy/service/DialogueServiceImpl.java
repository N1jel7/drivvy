package com.drivvy.service;

import com.drivvy.dto.response.DialogueResponseDto;
import com.drivvy.dto.response.MessageResponseDto;
import com.drivvy.model.Dialogue;
import com.drivvy.model.Message;
import com.drivvy.model.User;
import com.drivvy.repository.DialogueRepository;
import com.drivvy.repository.MessageRepository;
import com.drivvy.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class DialogueServiceImpl implements DialogueService {

    private final DialogueRepository dialogueRepository;
    private final MessageRepository messageRepository;
    private final UserRepository userRepository;

    public DialogueResponseDto addMessage(Message message, Long dialogueId) {
        log.info("Saving message {}", message);
        message.setDialogueId(dialogueId);
        message.setId(null);
        messageRepository.save(message);
        Dialogue dialogue = dialogueRepository.findById(dialogueId).orElse(null);
        return mapDialogueToResponse(dialogue);
    }

    public DialogueResponseDto getDialogueById(long id) {
        log.info("Getting dialogue with id");
        Dialogue dialogue = dialogueRepository.findById(id).orElse(null);
        return mapDialogueToResponse(dialogue);
    }


    public List<DialogueResponseDto> getUserDialogues(String username) {
        log.info("Getting dialogues of user: {}", username);
        User user = userRepository.findByUsername(username);
        List<Dialogue> dialogues = dialogueRepository.findByUsersContains(user);

        for (Dialogue dial : dialogues) {
            for (User usr : dial.getUsers()) {
                if (!user.getUsername().equals(usr.getUsername())) {
                    dial.setTitle(usr.getUsername());
                    dial.setDecodedAvatar(usr.getDecodedAvatar());
                }
            }
        }


        return mapDialoguesToResponse(dialogues);
    }

    public DialogueResponseDto createDialogue(String currentUsername, String usernameToChat) {
        log.info("Creating dialogue with users: {} and {}", currentUsername, usernameToChat);
        User currentUser = userRepository.findByUsername(currentUsername);
        User userToChat = userRepository.findByUsername(usernameToChat);

        if (userToChat == null) {
            return null;
        }

        List<User> users = List.of(currentUser, userToChat);
        Dialogue dialogue = dialogueRepository.save(new Dialogue(userToChat.getUsername(), users));

        log.info("Dialogue for users {} and {} successfully created", currentUsername, usernameToChat);
        return mapDialogueToResponse(dialogue);
    }

    private List<DialogueResponseDto> mapDialoguesToResponse(List<Dialogue> dialogues) {
        List<DialogueResponseDto> dialogueResponseDtos = new ArrayList<>();
        for(Dialogue dialogue : dialogues) {
            dialogueResponseDtos.add(new DialogueResponseDto(
                    dialogue.getId(),
                    dialogue.getTitle(),
                    dialogue.getUsers().getLast().getDecodedAvatar(),
                    mapToMessageResponseList(dialogue.getMessages())
            ));
        }
        return dialogueResponseDtos;
    }

    private DialogueResponseDto mapDialogueToResponse(Dialogue dialogue) {
        return new DialogueResponseDto(
                dialogue.getId(),
                dialogue.getTitle(),
                dialogue.getUsers().getLast().getDecodedAvatar(),
                mapToMessageResponseList(dialogue.getMessages())
        );
    }

    private List<MessageResponseDto> mapToMessageResponseList(List<Message> messages) {
        if (messages == null) {
            return Collections.emptyList();
        }
        List<MessageResponseDto> responseMessages = new ArrayList<>();
        for (Message message : messages) {
            responseMessages.add(new MessageResponseDto(message.getAuthor(), message.getContent()));
        }
        return responseMessages;
    }
}
