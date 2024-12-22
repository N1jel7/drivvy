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
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class DialogueService implements DialogueServiceInterface {

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

        return dialogues;
    }

    public Dialogue createDialogue(String currentUserUsername, String findingUsername) {
        log.info("Creating dialogue with users: {} and {}", currentUserUsername, findingUsername);
        User currentUserFromDb = userRepository.findByUsername(currentUserUsername);
        User userFromDb = userRepository.findByUsername(findingUsername);

        if (userFromDb != null) {
            List<User> users = new ArrayList<>();
            users.add(currentUserFromDb);
            users.add(userFromDb);
            log.info("Dialogue for users {} and {} successfully created", currentUserUsername, findingUsername);
            return dialogueRepository.save(
                    new Dialogue(userFromDb.getUsername(), users)
            );
        } else
            return null;
    }
}
