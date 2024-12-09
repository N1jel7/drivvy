package com.drivvy.controllers;

import com.drivvy.models.Dialogue;
import com.drivvy.models.Message;
import com.drivvy.models.User;
import com.drivvy.services.DialogueService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("user")
public class DialoguesController {

    private final DialogueService dialogueService;

    @PostMapping("/dialogues/{id}")
    public String addMessage(Message message, @PathVariable Long id, Model model, User user) {
        message.setAuthor(user.getUsername());
        model.addAttribute("dialogue", dialogueService.getDialogueById(id));
        dialogueService.addMessage(message, id);
        return "dialogue";
    }

    @GetMapping("/dialogues")
    public String dialogues(User user, Model model) {
        List<Dialogue> dialogues = dialogueService.getUserDialogues(user.getUsername());

        for (Dialogue dial : dialogues) {
            for (User usr : dial.getUsers()) {
                if (!user.getUsername().equals(usr.getUsername())) {
                    dial.setTitle(usr.getUsername());
                }
            }
        }

        model.addAttribute("dialogues", dialogues);

        return "dialogues";
    }

    @GetMapping("/dialogues/{id}")
    public String dialogue(@PathVariable Long id, Model model) {
        model.addAttribute("dialogue", dialogueService.getDialogueById(id));
        return "dialogue";
    }

    @PostMapping("dialogues/create")
    public String createDialogue(@SessionAttribute User user, String username, Model model) {
        if (!username.equals(user.getUsername())) {
            Dialogue dialogue = dialogueService.createDialogue(user.getUsername(), username);
            if (dialogue != null) {
                model.addAttribute("dialogue", dialogue);
                return "dialogue";
            }

        }
        return "redirect:/dialogues";
    }
}
