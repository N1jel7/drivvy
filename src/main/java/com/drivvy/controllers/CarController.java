package com.drivvy.controllers;

import com.drivvy.models.Car;
import com.drivvy.models.User;
import com.drivvy.repositories.CarRepository;
import com.drivvy.repositories.UserRepository;
import com.drivvy.services.CarService;
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
public class CarController  {

    private final CarService carService;
    private final UserRepository userRepository;
    private final CarRepository carRepository;

    @GetMapping("/cars")
    public String cars(User user, Model model) {

        User userFromDb = userRepository.findByUsername(user.getUsername());
        List<Car> cars = userFromDb.getCars();
        model.addAttribute("cars", cars);

        return "cars";
    }

    @GetMapping("/cars/{id}")
    public String car(@PathVariable int id, User user, Model model) {
        model.addAttribute("car", carRepository.findById(id));
        return "car";
    }

    @PostMapping("/cars/create")
    public String createCar(Car car, @RequestParam("files") List<MultipartFile> files, User user) throws IOException {
        Long userId = userRepository.findByUsername(user.getUsername()).getId();
        car.setUserId(userId);
        carService.createCar(car, files);

        return "redirect:/cars";
    }
}
