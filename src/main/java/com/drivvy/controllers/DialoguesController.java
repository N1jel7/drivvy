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
        Dialogue dialogue = dialogueService.getDialogueById(id);
        model.addAttribute("dialogue", dialogue);
        model.addAttribute("avatar", dialogue.getUsers().getLast().getDecodedAvatar());
        dialogueService.addMessage(message, id);

        return "dialogue";
    }

    @GetMapping("/dialogues")
    public String dialogues(User user, Model model) {

        List<Dialogue> dialogues = dialogueService.getUserDialogues(user.getUsername());
        model.addAttribute("dialogues", dialogues);

        return "dialogues";
    }

    @GetMapping("/dialogues/{id}")
    public String dialogue(@PathVariable Long id, Model model) {

        Dialogue dialogue = dialogueService.getDialogueById(id);
        model.addAttribute("dialogue", dialogue);
        model.addAttribute("avatar", dialogue.getUsers().getLast().getDecodedAvatar());

        return "dialogue";

    }

    @PostMapping("dialogues/create")
    public String createDialogue(@SessionAttribute User user, String findingUsername, Model model) {

        if (!findingUsername.equals(user.getUsername())) {
            Dialogue dialogue = dialogueService.createDialogue(user.getUsername(), findingUsername);
            if (dialogue != null) {
                model.addAttribute("avatar", dialogue.getUsers().getLast().getDecodedAvatar());
                model.addAttribute("dialogue", dialogue);

                return "dialogue";
            }

        }

        return "redirect:/dialogues";

    }
}
