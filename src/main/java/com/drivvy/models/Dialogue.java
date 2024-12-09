package com.drivvy.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.DuplicateFormatFlagsException;
import java.util.List;

@Entity
@Table(name = "dialogues")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dialogue {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @OneToMany
    @JoinColumn(name = "dialogue_id")
    private List<Message> messages;
    @ManyToMany(cascade = CascadeType.ALL)
    private List<User> users;
    @Column
    private String title;

    public Dialogue(String title, Long id, List<Message> messages, List<User> users) {
        this.title = title;
        this.id = id;
        this.messages = messages;
        this.users = users;
    }

    public void addMessage(Message message) {
        messages.add(message);
    }

}
