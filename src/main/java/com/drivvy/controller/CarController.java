package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CarRequestDto;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.CarServiceImpl;
import com.drivvy.service.impl.PostServiceImpl;
import com.drivvy.util.CarUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequiredArgsConstructor
@Controller

public class CarController {

    private final CarServiceImpl carServiceImpl;
    private final PostServiceImpl postService;

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

        carServiceImpl.createCar(carRequestDto, images, userDto.getId());
        // TODO true/false alert of creation
        return "redirect:/cars";
    }


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

    @PostMapping("/car/{id}/post/create")
    public String createPost(
            @PathVariable Long id,
            PostRequestDto postRequestDto,
            List<MultipartFile> filesImages
    ) {
        postService.create(postRequestDto, filesImages, ObjectType.CAR, id);
        return "redirect:/profile/{id}";
    }
}
