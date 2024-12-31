package com.drivvy.service;

import com.drivvy.exception.CarNotFoundException;
import com.drivvy.exception.CarValidationException;
import com.drivvy.model.Car;
import com.drivvy.model.User;
import com.drivvy.repository.CarRepository;
import com.drivvy.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CarServiceImpl implements CarService {

    private final CarRepository carRepository;
    private final UserRepository userRepository;
    private final ImageServiceImpl imageService;

    public void createCar(Car car, List<MultipartFile> files, Long userId) {
        validateImages(files);
        log.info("Trying to create car");
        Car carWithImages;

        if(files.getFirst().getOriginalFilename().isEmpty()) {
            carWithImages = imageService.setDefaultCarImage(car);
        } else {
            carWithImages = imageService.setImagesToCar(car, files);
        }

        car.setUserId(userId);
        carRepository.save(carWithImages);
        log.info("Car successfully created");
    }

    private static void validateImages(List<MultipartFile> files) {
        if (files.size() > 10) {
            throw new CarValidationException("Incorrect number of images");
        }
    }

    public List<Car> getCars() {
        return carRepository.findAll();
    }

    public List<Car> getUserCars(Long userId) {
        return userRepository.findById(userId).get().getCars();
    }



    public Car getCarById(Long id) {
        try {
            return carRepository.findById((long) id);
        } catch (RuntimeException e) {
            throw new CarNotFoundException("Car with id " + id + " not found");
        }

    }
}
