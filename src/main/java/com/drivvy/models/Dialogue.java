package com.drivvy.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private long id;
    @Column(name = "name")
    private String name;
    @OneToMany
    private List<Message> messages;
    @ManyToMany
    private List<User> users;

    public Dialogue(String name) {
        this.name = name;

    }
}
