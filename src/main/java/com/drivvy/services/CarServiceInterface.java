package com.drivvy.services;

import com.drivvy.models.Car;
import com.drivvy.models.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface CarServiceInterface {

    boolean createCar(Car car, List<MultipartFile> files) throws IOException;

    User getUserInfo(String username);

    Car getCarById(int id);
}
