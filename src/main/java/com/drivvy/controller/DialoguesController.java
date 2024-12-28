package com.drivvy.controller;

import com.drivvy.dto.response.DialogueResponseDto;
import com.drivvy.model.Message;
import com.drivvy.model.User;
import com.drivvy.service.DialogueServiceImpl;
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

    private final DialogueServiceImpl dialogueService;

    @PostMapping("/dialogues/{id}")
    public String addMessage(Message message, @PathVariable Long id, Model model) {

        DialogueResponseDto dialogue = dialogueService.addMessage(message, id);
        model.addAttribute("dialogue", dialogue);

        return "dialogue";
    }

    @GetMapping("/dialogues")
    public String dialogues(User user, Model model) {

        List<DialogueResponseDto> dialogues = dialogueService.getUserDialogues(user.getUsername());
        model.addAttribute("dialogues", dialogues);

        return "dialogues";
    }

    @GetMapping("/dialogues/{id}")
    public String dialogue(@PathVariable Long id, Model model) {
        DialogueResponseDto dialogue = dialogueService.getDialogueById(id);
        model.addAttribute("dialogue", dialogue);

        return "dialogue";
    }

    @PostMapping("dialogues/create")
    public String createDialogue(@SessionAttribute User user, String findingUsername, Model model) {

        DialogueResponseDto dialogue = dialogueService.createDialogue(user.getUsername(), findingUsername);

        if(dialogue == null){
            return "redirect:/dialogues";
        }

        model.addAttribute("dialogue", dialogue);
        return "dialogue";
    }
}
