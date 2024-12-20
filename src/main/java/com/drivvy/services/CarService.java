package com.drivvy.services;

import com.drivvy.models.Car;
import com.drivvy.models.Image;
import com.drivvy.models.User;
import com.drivvy.properties.ConfigProperties;
import com.drivvy.repositories.CarRepository;
import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CarService {

    private final CarRepository carRepository;
    private final UserRepository userRepository;

    public void createCar(Car car, List<MultipartFile> files) throws IOException {
        ConfigProperties configProperties = new ConfigProperties();
        log.info("Trying to create car");
        int counter = 0;
        if (files.getFirst().getName().isEmpty()) {
            car.addImageByPath(configProperties.getCarImagePath());
        } else {
            filesLoop:
            for (MultipartFile file : files) {
                counter++;
                Image image = convertFileToImage(file);
                if (files.getFirst().equals(file)) {
                    image.setPreview(true);
                }
                car.addImage(image);
                if (counter == 10) break filesLoop;
            }
        }
        log.info("Car successfully created, id: {}", car.getId());
        carRepository.save(car);
    }

    public Image convertFileToImage(MultipartFile file) throws IOException {
        log.info("Trying to convert file to image");
        Image image = new Image();
        image.setImage(file.getBytes());
        log.info("Converting ends successfully");
        return image;
    }

    public User getUserInfo(String username) {
        return userRepository.findByUsername(username);
    }

    public Car getCarById(int id) {
        return carRepository.findById(id);
    }
}
