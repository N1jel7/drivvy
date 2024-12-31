package com.drivvy.service;

import com.drivvy.model.Car;
import com.drivvy.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface CarService {

    void createCar(Car car, List<MultipartFile> files, Long userId);

    List<Car> getCars();

    List<Car> getUserCars(Long userId);

    Car getCarById(Long id);
}
