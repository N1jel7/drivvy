package com.drivvy.controller;

import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.Car;
import com.drivvy.model.User;
import com.drivvy.service.CarServiceImpl;
import com.drivvy.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@SessionAttributes("user")
@RequiredArgsConstructor
@Controller
public class CarController {

    private final CarServiceImpl carServiceImpl;

    @GetMapping("/cars")
    public String cars(User user, Model model) {

        model.addAttribute("cars", carServiceImpl.getUserCars(user.getUsername()));

        return "cars";
    }

    @GetMapping("/cars/{id}")
    public String car(@PathVariable int id, Model model) {
        model.addAttribute("car", carServiceImpl.getCarById(id));
        return "car";
    }

    @PostMapping("/cars/create")
    public String createCar(User user, Car car, @RequestParam("files") List<MultipartFile> files) {
        carServiceImpl.createCar(car, files, user.getId());
        // TODO true/false alert of creation
        return "redirect:/cars";
    }
}
