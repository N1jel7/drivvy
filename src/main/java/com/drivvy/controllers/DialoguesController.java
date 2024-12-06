package com.drivvy.controllers;

import com.drivvy.models.Message;
import com.drivvy.services.DialogueService;
import com.drivvy.services.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequiredArgsConstructor
public class DialoguesController {

    private final DialogueService dialogueService;

    @PostMapping("/dialogues/{id}")
    public String addMessage(Message message, @PathVariable Long id, Model model) {
        model.addAttribute("dialogue", dialogueService.getDialogueById(id));
        dialogueService.addMessageByDialogueId(id, message);
        return "dialogue";
    }

    @GetMapping("/dialogues")
    public String dialogues(Model model) {
        model.addAttribute("dialogues", dialogueService.getDialogues());
        return "dialogues";
    }

    @GetMapping("/dialogues/{id}")
    public String dialogue(@PathVariable Long id, Model model) {
        model.addAttribute("dialogue", dialogueService.getDialogueById(id));
        return "dialogue";
    }
}
