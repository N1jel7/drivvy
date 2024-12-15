package com.drivvy.services;

import com.drivvy.models.Dialogue;
import com.drivvy.models.Message;
import com.drivvy.models.User;
import com.drivvy.repositories.DialogueRepository;
import com.drivvy.repositories.MessageRepository;
import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class DialogueService {

    private final DialogueRepository dialogueRepository;
    private final MessageRepository messageRepository;
    private final UserRepository userRepository;

    public void addMessage(Message message, Long dialogueId) {
        log.info("Saving message {}", message);
        message.setDialogueId(dialogueId);
        message.setId(null);
        messageRepository.save(message);
    }

    public Dialogue getDialogueById(long id) {
        log.info("Getting dialogue with id");
        return dialogueRepository.findById(id).orElse(null);
    }


    public List<Dialogue> getUserDialogues(String username) {
        User user = userRepository.findByUsername(username);
        return dialogueRepository.findByUsersContains(user);
    }

    // TO DO REFACTORING
    public Dialogue createDialogue(String currentUserUsername, String username) {
        User currentUser = userRepository.findByUsername(currentUserUsername);
        User user = userRepository.findByUsername(username);
        if (user != null) {
            List<User> users = new ArrayList<>();
            users.add(currentUser);
            users.add(user);
            return dialogueRepository.save(
                    new Dialogue(user.getUsername() ,null, new ArrayList<>(), users)
            );
        } else
            return null;
    }

}
