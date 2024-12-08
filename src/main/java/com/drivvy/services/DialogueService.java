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

import java.util.Collections;
import java.util.List;
@Slf4j
@RequiredArgsConstructor
@Service
public class DialogueService {

    private final DialogueRepository dialogueRepository;
    private final MessageRepository messageRepository;
    private final UserRepository userRepository;

    public List<Dialogue> getDialogues() {
        return dialogueRepository.findAll();
    }

    public void addMessage(Message message) {
        log.info("Saving message {}", message);
        messageRepository.save(message);
    }

    public void addDialogue(Dialogue dialogue) {
        log.info("Saving dialogue {}", dialogue);
        dialogueRepository.save(dialogue);
    }

    public Dialogue getDialogueById(long id) {
        log.info("Getting dialogue with id");
        return dialogueRepository.findById(id).orElse(null);
    }

    public void deleteDialogue(Long id) {
        log.info("Deleting dialogue with id {}", id);
        dialogueRepository.deleteById(id);
    }

    public void getUserDialogues(String username) {
        dialogueRepository
    }

    public List<Message> getMessages(Long id) {
        return dialogueRepository.getMessagesByDialogueId(id);
    }

    public Dialogue createDialogue(String username) {
        User user = userRepository.findByUsername(username);
        if(user != null) {
            return new Dialogue(user.getUsername());
        } else
            return null;
    }
}
