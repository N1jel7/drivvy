package com.drivvy.service;

import com.drivvy.exception.CarNotFoundException;
import com.drivvy.exception.CarValidationException;
import com.drivvy.model.Car;
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

    public void editCarInfo(Car car, List<MultipartFile> files, Long carId) {
        log.info("Editing car with id: {}", carId);

        Car carFromDb = getCarById(carId);
        validateImages(files);

        carFromDb = carEditProcess(carFromDb, car, files);

        carRepository.save(carFromDb);
        log.info("Car successfully edited");
    }

    private Car carEditProcess(Car carFromDb, Car carFromRequest, List<MultipartFile> files) {
        carFromDb.setMake(carFromRequest.getMake().isEmpty() ? carFromDb.getMake() : carFromRequest.getMake());
        carFromDb.setDescription(carFromRequest.getDescription().isEmpty() ? carFromDb.getDescription() : carFromRequest.getDescription());
        carFromDb.setEngineType(carFromRequest.getEngineType().isEmpty() ? carFromDb.getEngineType() : carFromRequest.getEngineType());
        carFromDb.setEngineVolume(carFromRequest.getEngineVolume().isEmpty() ? carFromDb.getEngineVolume() : carFromRequest.getEngineVolume());
        carFromDb.setModel(carFromRequest.getModel().isEmpty() ? carFromDb.getModel() : carFromRequest.getModel());
        carFromDb.setYear(carFromRequest.getYear().isEmpty() ? carFromDb.getYear() : carFromRequest.getYear());
        carFromDb = setCarImages(carFromDb, files);
        return carFromDb;
    }

    public void createCar(Car car, List<MultipartFile> files, Long userId) {
        validateImages(files);
        log.info("Trying to create car");
        Car carWithImages;

        carWithImages = setCarImages(car, files);

        car.setUserId(userId);
        carRepository.save(carWithImages);
        log.info("Car successfully created");
    }

    private Car setCarImages(Car car, List<MultipartFile> files) {
        if(files.getFirst().getOriginalFilename().isEmpty() && car.getImages().isEmpty()) {
            car = imageService.setDefaultCarImage(car);
        } else {
            car = imageService.setImagesToCar(car, files);
        }
        return car;
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
