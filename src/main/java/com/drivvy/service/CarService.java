package com.drivvy.service;

import com.drivvy.model.Car;
import com.drivvy.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface CarService {

    //todo Убрать проброс эксепшнов в метод
    boolean createCar(Car car, List<MultipartFile> files);

    List<Car> getUserCars(String username);

    Car getCarById(int id);
}
