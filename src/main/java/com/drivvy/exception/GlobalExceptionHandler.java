package com.drivvy.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@Slf4j
@Configuration
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({
            RuntimeException.class,
            Exception.class,
            NoHandlerFoundException.class
    })
    public String handle(Exception exception, Model model){
        log.error(exception.getLocalizedMessage(), exception);
        model.addAttribute("error", exception.getLocalizedMessage());
        model.addAttribute("errorType", exception.getClass().getName());
        return "errors/main-page";
    }
}
