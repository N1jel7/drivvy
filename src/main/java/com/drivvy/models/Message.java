package com.drivvy.models;

import lombok.Data;

import java.util.Date;

@Data
public class Message {

    private Long id;
    private String author;
    private String content;
    private Date date;

    public Message(String author, String content, Date date) {
        this.author = author;
        this.content = content;
        this.date = date;
    }

}
