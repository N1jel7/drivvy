package com.drivvy.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
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
    @ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private List<User> users;
    @Column
    private String title;
    private byte[] avatar;
    @Transient
    private String decodedAvatar;

    public Dialogue(String title, List<User> users) {
        this.title = title;
        this.users = users;
    }

    @PostLoad
    private void postLoad() {
        decodedAvatar = users.getLast().getDecodedAvatar();
    }
}
