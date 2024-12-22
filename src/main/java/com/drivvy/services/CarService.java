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

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CarService implements CarServiceInterface {

    private final CarRepository carRepository;
    private final UserRepository userRepository;
    private final ConfigProperties configProperties;
    private final ImageService imageService;
    private final List<Image> imagesFromFiles = new ArrayList<>();

    public boolean createCar(Car car, List<MultipartFile> files) throws IOException {
        log.info("Trying to create car");
        if (!files.isEmpty() && files.size() <= 10) {
            if (files.getFirst().getOriginalFilename().isBlank()) {
                imagesFromFiles.add(imageService.convertArrayToImage(Files.readAllBytes(new File(configProperties.getCarImagePath()).toPath())));
                car.setImages(imagesFromFiles);
            } else {
                for (MultipartFile file : files) {
                    Image image = imageService.convertFileToImage(file);
                    if (files.getFirst().equals(file)) {
                        image.setPreview(true);
                    }
                    imagesFromFiles.add(image);
                }
                car.setImages(imagesFromFiles);
            }
            carRepository.save(car);
git             log.info("Car successfully created, id: {}", car.getId());
            return true;
        } else {
            log.info("Car is not created");
            return false;
        }
    }

    public User getUserInfo(String username) {
        return userRepository.findByUsername(username);
    }

    public Car getCarById(int id) {
        return carRepository.findById(id);
    }
}
