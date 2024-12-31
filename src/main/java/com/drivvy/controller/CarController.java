package com.drivvy.controller;

import com.drivvy.model.Car;
import com.drivvy.service.CarServiceImpl;
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

    @GetMapping("/{userId}/cars")
    public String userCars(@PathVariable Long userId, Model model) {

        model.addAttribute("cars", carServiceImpl.getUserCars(userId));

        return "userCars";
    }

    @GetMapping("/cars")
    public String cars(Model model) {
        model.addAttribute("cars", carServiceImpl.getCars());

        return "usersCars";
    }

    @GetMapping("{userId}/cars/{carId}")
    public String cars(@PathVariable Long userId, @PathVariable Long carId, Model model) {
        model.addAttribute("car", carServiceImpl.getCarById(carId));
        return "ownCarViewer";
    }

    @PostMapping("/{userId}/cars/create")
    public String createCar(@PathVariable Long userId, Car car, @RequestParam("files") List<MultipartFile> files) {
        carServiceImpl.createCar(car, files, userId);
        // TODO true/false alert of creation
        return "redirect:/{userId}/cars";
    }
}
