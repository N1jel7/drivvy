package com.drivvy.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.GetMapping;

public class MyErrorController implements ErrorController {

    @GetMapping("/error")
    public String errorPage() {
        return "errors/main-page";
    }

}
