package com.drivvy.controller;

import com.drivvy.dto.request.CarRequestDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.CarServiceImpl;
import com.drivvy.util.CarUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequiredArgsConstructor
@Controller

public class CarController {

    private final CarServiceImpl carServiceImpl;

<<<<<<< Updated upstream
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
=======
    @GetMapping("/")
    public String redirect() {
        return "redirect:/sign-up";
    }

    @GetMapping("/cars")
    public String userCarList(Model model, @SessionAttribute UserDto userDto) {
        model.addAttribute("cars", carServiceImpl.getUserCars(userDto.getId()));
        return "car/user-car-list";
    }

    @GetMapping("/cars/global")
    public String globalCarList(Model model) {
        model.addAttribute("cars", carServiceImpl.getCars());
        return "car/global-car-list";
    }

    @GetMapping("/car/{carId}")
    public String viewCar(@PathVariable Long carId, Model model) {
        model.addAttribute("car", carServiceImpl.getCarDtoById(carId));
        return "car/car-detail-view";
    }

    @PostMapping("/car/create")
    public String createCar(
            CarRequestDto carRequestDto,
            @RequestParam("images") List<MultipartFile> images,
            @SessionAttribute UserDto userDto) {
>>>>>>> Stashed changes

        carServiceImpl.createCar(carRequestDto, images, userDto.getId());
        // TODO true/false alert of creation
        return "redirect:/cars";
    }
<<<<<<< Updated upstream
=======

    @GetMapping("/car/create")
    public String createCar(Model model) {
        model.addAttribute("years", CarUtils.getCarYearsList());
        model.addAttribute("volumes", CarUtils.getEngineVolumeList());
        return "car/car-create-menu";
    }

    @GetMapping("/car/{carId}/edit")
    public String updateCar(@PathVariable Long carId, Model model) {
        model.addAttribute("years", CarUtils.getCarYearsList());
        model.addAttribute("volumes", CarUtils.getEngineVolumeList());
        model.addAttribute("car", carServiceImpl.getCarDtoById(carId));
        return "car/car-edit-menu";
    }

    @PostMapping("/car/{carId}/edit")
    public String updateCar(@RequestParam List<MultipartFile> files, CarRequestDto carRequestDto, @PathVariable Long carId) {
        carServiceImpl.updateCarInfo(carRequestDto, files, carId);
        return "redirect:/cars";
    }

    @GetMapping("/car/{carId}/remove")
    public String removeCar(@PathVariable Long carId) {
        carServiceImpl.removeCar(carId);
        return "redirect:/cars";
    }
>>>>>>> Stashed changes
}
