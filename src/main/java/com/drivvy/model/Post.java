package com.drivvy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "post")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    private String description;
    @ManyToMany(cascade = CascadeType.PERSIST)
    private List<Image> images = new ArrayList<>();


    @ManyToMany
    List<User> usersLikes;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @ManyToOne
    private User owner;

    @ManyToOne
    private Community community;

    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    @OneToMany
    private List<Comment> comments;

    @ManyToOne
    private Car car;


}
