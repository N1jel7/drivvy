package com.drivvy.services;

import com.drivvy.models.Dialogue;
import com.drivvy.models.Message;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Getter
public class DialogueService {

    private List<Dialogue> dialogues = new ArrayList<>();
    private List<Message> messages = new ArrayList<>();

    {
        messages.add(new Message("Antonio", "Hi nigger", new Date()));
        messages.add(new Message("Vano", "Hi man", new Date()));
        messages.add(new Message("Antonio", "Welcome", new Date()));
        dialogues.add(new Dialogue("Antonio", "Hello!", new byte[4], messages));
        dialogues.add(new Dialogue("Vano", "Hi!", new byte[4], messages));
    }

    public void addMessageByDialogueId(Long id,Message message) {
        Dialogue dialogue = getDialogueById(id);
        dialogue.getMessages().add(message);
    }

    public Dialogue getDialogueById(long id) {
        return dialogues.stream().filter(d -> d.getId() == id).findFirst().orElse(null);
    }

    public void deleteDialogue(Long id) {
        dialogues.removeIf(d -> d.getId() == id);
    }
}
