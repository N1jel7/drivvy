package com.drivvy.models;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Data
public class Dialogue {
    private long id;
    private String name;
    private String lastMessage;
    private byte[] avatar;
    private List<Message> messages;

    public Dialogue(String name, String lastMessage, byte[] avatar, List<Message> messages) {
        this.messages = messages;
        this.name = name;
        this.lastMessage = lastMessage;
        this.avatar = avatar;
    }
}
