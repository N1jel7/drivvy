package com.drivvy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
public class StartController {
    @GetMapping("/")
    public String start() {
        return "drivvy";
    }

    @GetMapping("/start")
    public String menu() {
        return "start";
    }

}
