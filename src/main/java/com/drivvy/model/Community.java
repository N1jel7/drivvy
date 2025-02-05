package com.drivvy.model;

import com.drivvy.dto.common.AccessModifier;
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
@Table(name = "communities")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Community {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @ManyToMany
    @JoinTable(
            name = "community_members",
            joinColumns = @JoinColumn(name = "member_id"),
            inverseJoinColumns = @JoinColumn(name = "community_id")
    )
    private List<User> members = new ArrayList<>();
    private String name;
    private String description;
    @OneToOne
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private Image avatar;
    private String country;
    private AccessModifier accessModifier;
    @CreationTimestamp
    private LocalDateTime createdAt;


}
