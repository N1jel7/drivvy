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
    public String userCarList(@PathVariable Long userId, Model model) {
        model.addAttribute("cars", carServiceImpl.getUserCars(userId));
        return "userCarList";
    }

    @GetMapping("/cars")
    public String globalCarList(Model model) {
        model.addAttribute("cars", carServiceImpl.getCars());

        return "globalCarList";
    }

    @GetMapping("/cars/{carId}")
    public String viewUserCar(@PathVariable Long carId, Model model) {
        model.addAttribute("car", carServiceImpl.getCarById(carId));
        return "globalCarViewer";
    }

    @GetMapping("{userId}/cars/{carId}")
    public String viewOwnCar(@PathVariable Long userId, @PathVariable Long carId, Model model) {
        model.addAttribute("car", carServiceImpl.getCarById(carId));
        return "userCarViewer";
    }

    @PostMapping("/{userId}/cars/create")
    public String createCar(@PathVariable Long userId, Car car, @RequestParam("files") List<MultipartFile> files) {
        carServiceImpl.createCar(car, files, userId);
        // TODO true/false alert of creation
        return "redirect:/{userId}/cars";
    }

    @GetMapping("/{userId}/cars/{carId}/edit")
    public String editCar(@PathVariable Long userId, @PathVariable Long carId, Model model) {
        model.addAttribute("car", carServiceImpl.getCarById(carId));
        return "userCarInfoEditor";
    }

    @PostMapping("/{userId}/cars/{carId}/edit")
    public String updateCar(@RequestParam List<MultipartFile> files, Car car, @PathVariable Long carId) {
        carServiceImpl.editCarInfo(car, files, carId);
        return "redirect:/{userId}/cars";
    }
}
