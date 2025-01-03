package com.drivvy.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Configuration
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({CarNotFoundException.class, CarValidationException.class})
    public String handle(Exception exception){
        log.error(exception.getLocalizedMessage(), exception);
        return "error";
    }
}
