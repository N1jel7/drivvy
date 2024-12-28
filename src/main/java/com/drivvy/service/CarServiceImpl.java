package com.drivvy.service;

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

    public boolean createCar(Car car, List<MultipartFile> files) {
        validateImages(files);
        log.info("Trying to create car");
        Car carWithImages = imageService.setImagesToCar(car, files);
        carRepository.save(carWithImages);
        log.info("Car successfully created");
        return false;

    }

    private static void validateImages(List<MultipartFile> files) {
        if (files.isEmpty() || files.size() > 10) {
            //todo CarValidationException <- RuntimeException // Неверное количество изображений
            throw new IllegalStateException();
        }
    }

    public List<Car> getUserCars(String username) {
        return userRepository.findByUsername(username).getCars();
    }

    public Car getCarById(int id) {
        //TODO /CarNotFoundException*/
        return carRepository.findById(id);
    }
}
