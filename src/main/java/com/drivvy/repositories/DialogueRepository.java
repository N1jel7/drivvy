package com.drivvy.repositories;

import com.drivvy.models.Dialogue;
import com.drivvy.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DialogueRepository extends JpaRepository<Dialogue, Long> {
    List<Dialogue> findByUsersContains(User user);
}

