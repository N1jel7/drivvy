package com.drivvy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class NewsController {

    @GetMapping("/start")
    public String newsPage() {
        return "news/user-news";
    }

}
