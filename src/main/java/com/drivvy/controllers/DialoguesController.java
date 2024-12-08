package com.drivvy.controllers;

import com.drivvy.models.Dialogue;
import com.drivvy.models.Message;
import com.drivvy.services.DialogueService;
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
        dialogueService.addMessage(message);
        return "dialogue";
    }

    @GetMapping("/dialogues")
    public String dialogues(Model model) {
        String username = (String) model.getAttribute("username");
        model.addAttribute("dialogues", dialogueService.getUserDialogues(username));
        model.addAttribute("messages", dialogueService.getMessages());
        return "dialogues";
    }

    @GetMapping("/dialogues/{id}")
    public String dialogue(@PathVariable Long id, Model model) {
        model.addAttribute("dialogue", dialogueService.getDialogueById(id));
        return "dialogue";
    }

    @PostMapping("dialogues/create")
    public String createDialogue(String username, Model model) {
        Dialogue dialogue = dialogueService.createDialogue(username);
        if(dialogue != null) {
            model.addAttribute("dialogue", dialogue);
            return "dialogue";
        } else {
            return "redirect:dialogues";
        }
    }
}
