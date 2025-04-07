package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CarRequestDto;
import com.drivvy.dto.request.CommentRequestDto;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.CarServiceImpl;
import com.drivvy.service.impl.PostServiceImpl;
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

    private final CarServiceImpl carService;
    private final PostServiceImpl postService;

    @GetMapping("/")
    public String redirect() {
        return "redirect:/sign-up";
    }

    @GetMapping("/cars")
    public String userCarList(Model model, @SessionAttribute UserDto userDto) {
        model.addAttribute("cars", carService.getUserCars(userDto.getId()));
        return "car/user-car-list";
    }

    @GetMapping("/cars/global")
    public String globalCarList(Model model) {
        model.addAttribute("cars", carService.getCars());
        return "car/global-car-list";
    }

    @GetMapping("/car/{carId}")
    public String viewCar(@PathVariable Long carId, Model model) {
        model.addAttribute("car", carService.getCarDtoById(carId));
        return "car/detail";
    }

    @PostMapping("/car/create")
    public String createCar(
            CarRequestDto carRequestDto,
            @RequestParam("images") List<MultipartFile> images,
            @SessionAttribute UserDto userDto) {

        carService.createCar(carRequestDto, images, userDto.getId());
        // TODO true/false alert of creation
        return "redirect:/cars";
    }


    @GetMapping("/car/create")
    public String createCar(Model model) {
        model.addAttribute("years", CarUtils.getCarYearsList());
        model.addAttribute("volumes", CarUtils.getEngineVolumeList());
        return "car/create-menu";
    }

    @GetMapping("/car/{carId}/edit")
    public String updateCar(@PathVariable Long carId, Model model) {
        model.addAttribute("years", CarUtils.getCarYearsList());
        model.addAttribute("volumes", CarUtils.getEngineVolumeList());
        model.addAttribute("car", carService.getCarDtoById(carId));
        return "car/edit-menu";
    }

    @PostMapping("/car/{carId}/edit")
    public String updateCar(@RequestParam List<MultipartFile> files, CarRequestDto carRequestDto, @PathVariable Long carId) {
        carService.updateCarInfo(carRequestDto, files, carId);
        return "redirect:/cars";
    }

    @GetMapping("/car/{carId}/remove")
    public String removeCar(@PathVariable Long carId) {
        carService.removeCar(carId);
        return "redirect:/cars";
    }

    @GetMapping("/car/{carId}/post/{postId}/like")
    public String likePost(@PathVariable Long postId, @PathVariable Long carId, @SessionAttribute UserDto userDto) {
        postService.likeOrDislikePost(userDto.getId(), postId);
        return "redirect:/car/{carId}";
    }

    @PostMapping("/car/{carId}/post/{postId}/comment")
    public String leaveComment(
            @PathVariable Long carId,
            @PathVariable Long postId,
            String content,
            @SessionAttribute UserDto userDto) {
        postService.addCommentToPost(new CommentRequestDto(userDto.getId(), postId, content));
        return "redirect:/car/{carId}/post/{postId}";
    }

    @PostMapping("/car/{carId}/post/{postId}/edit")
    public String editPost(@PathVariable Long carId ,
                           @PathVariable Long postId,
                           PostRequestDto postRequestDto) {
        postService.editPost(postRequestDto, postId);
        return "redirect:/car/{carId}";
    }

    @GetMapping("/car/{carId}/post/{postId}/delete")
    public String deletePost(@PathVariable Long carId ,@PathVariable Long postId) {
        postService.deletePost(postId);
        return "redirect:/car/{carId}";
    }

    @PostMapping("/car/{carId}/post/create")
    public String createPost(
            @PathVariable Long carId,
            PostRequestDto postRequestDto
    ) {
        postService.create(postRequestDto, ObjectType.CAR, carId);
        return "redirect:/car/{carId}";
    }

    @GetMapping("/car/{carId}/post/create")
    public String postCreationMenu(@PathVariable Long carId,
                                   Model model,
                                   @SessionAttribute UserDto userDto
    ) {
        model.addAttribute("car", carService.getCarById(carId));

        return "car/post-creation";
    }

    @GetMapping("/car/{carId}/post/{postId}")
    public String viewCarPost(@PathVariable Long carId,
                              @PathVariable Long postId,
                              Model model) {
        model.addAttribute("post", postService.getPostDtoById(postId));
        model.addAttribute("car", carService.getCarDtoById(carId));

        return "car/detail-post";
    }

}
