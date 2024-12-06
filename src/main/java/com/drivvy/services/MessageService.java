package com.drivvy.services;

import com.drivvy.models.Message;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Getter
public class MessageService {

    private List<Message> messages = new ArrayList<>();

    {
        messages.add(new Message("Antonio","Hi!", new Date()));
        messages.add(new Message("Vano","Hello!", new Date()));
    }
    public void addMessage(Message message) {
        messages.add(message);
    }

    public void deleteMessage(int id) {
        messages.removeIf(message -> message.getId() == id);
    }
}
