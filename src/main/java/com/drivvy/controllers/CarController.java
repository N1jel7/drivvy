package com.drivvy.controllers;

import com.drivvy.models.Car;
import com.drivvy.models.User;
import com.drivvy.repositories.CarRepository;
import com.drivvy.repositories.UserRepository;
import com.drivvy.services.CarService;
import com.drivvy.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@SessionAttributes("user")
@RequiredArgsConstructor
@Controller
public class CarController {

    private final CarService carService;
    private final UserRepository userRepository;
    private final UserService userService;

    @GetMapping("/cars")
    public String cars(User user, Model model) {

        User userFromDb = carService.getUserInfo(user.getUsername());
        model.addAttribute("cars", userFromDb.getCars());

        return "cars";
    }

    @GetMapping("/cars/{id}")
    public String car(@PathVariable int id, Model model) {
        model.addAttribute("car", carService.getCarById(id));
        return "car";
    }

    @PostMapping("/cars/create")
    public String createCar(Car car, @RequestParam("files") List<MultipartFile> files, User user) throws IOException {
        Long userId = userService.getUserId(user.getUsername());
        car.setUserId(userId);
        carService.createCar(car, files);

        return "redirect:/cars";
    }
}
