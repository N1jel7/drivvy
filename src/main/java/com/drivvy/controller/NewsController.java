package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.PostServiceImpl;
import com.drivvy.service.impl.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@RequiredArgsConstructor
@Controller
public class NewsController {

    private final UserServiceImpl userService;
    private final PostServiceImpl postService;

    @GetMapping("/start")
    public String newsPage() {
        return "news/user-news";
    }
}
