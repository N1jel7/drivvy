package com.drivvy.service.api;

import com.drivvy.dto.request.CarRequestDto;
import com.drivvy.dto.response.CarResponseDto;
import com.drivvy.model.Car;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CarService {

    void createCar(CarRequestDto carRequestDto, List<MultipartFile> files, Long userId);

    List<CarResponseDto> getCars();

    List<CarResponseDto> getUserCars(Long userId);

    Car getCarById(Long id);
}
