package com.drivvy.repository;

import com.drivvy.model.Dialogue;
import com.drivvy.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DialogueRepository extends JpaRepository<Dialogue, Long> {
    List<Dialogue> findByUsersContains(User user);
}

