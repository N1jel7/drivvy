package com.drivvy.services;

import com.drivvy.models.Dialogue;
import com.drivvy.models.Message;

import java.util.List;

public interface DialogueServiceInterface {

    void addMessage(Message message, Long dialogueId);

    Dialogue getDialogueById(long id);

    List<Dialogue> getUserDialogues(String username);

    Dialogue createDialogue(String currentUserUsername, String findingUsername);
}
