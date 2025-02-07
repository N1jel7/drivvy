package com.drivvy.service.impl;

import com.drivvy.dto.request.CarRequestDto;
import com.drivvy.dto.response.CarResponseDto;
import com.drivvy.exception.CarNotFoundException;
import com.drivvy.mapper.CarMapper;
import com.drivvy.model.Car;
import com.drivvy.model.Image;
import com.drivvy.repository.CarRepository;
import com.drivvy.service.api.CarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class CarServiceImpl implements CarService {

    private final CarRepository carRepository;
    private final CarMapper carMapper;
    private final ImageServiceImpl imageService;
    private final UserServiceImpl userService;

    public void updateCarInfo(CarRequestDto carRequestDto, List<MultipartFile> files, Long carId) {
        log.info("Updating car(id={}) info", carId);
        boolean valid = imageService.validateFilesOnUpdate(files);

        Car carFromDb = carUpdateProcess(getCarById(carId), carRequestDto, files, valid);

        carRepository.save(carFromDb);
        log.info("Car(id={}) updated", carId);
    }

    private Car carUpdateProcess(Car carFromDb, CarRequestDto carRequestDto, List<MultipartFile> files, boolean valid) {
        List<Image> images = carFromDb.getImages();

        if (valid) {

            int iterator = 0;

            while (images.size() <= 10 && !files.isEmpty()) {
                images.add(imageService.convertFileToImage(files.get(iterator)));

                files.removeFirst();
                iterator++;
            }

            if (images.size() == 1) {
                images.getFirst().setPreview(true);
            }
        }

        carFromDb.setMake(Objects.equals(carRequestDto.make(), "") ? carFromDb.getMake() : carRequestDto.make());
        carFromDb.setDescription(Objects.equals(carRequestDto.description(), "") ? carFromDb.getDescription() : carRequestDto.description());
        carFromDb.setEngineType(Objects.equals(carRequestDto.engineType(), "") ? carFromDb.getEngineType() : carRequestDto.engineType());
        carFromDb.setEngineVolume(Objects.isNull(carRequestDto.engineVolume()) ? carFromDb.getEngineVolume() : carRequestDto.engineVolume());
        carFromDb.setModel(Objects.equals(carRequestDto.model(), "") ? carFromDb.getModel() : carRequestDto.model());
        carFromDb.setYear(Objects.isNull(carRequestDto.year()) ? carFromDb.getYear() : carRequestDto.year());
        carFromDb.setImages(images);
        return carFromDb;
    }

    public void createCar(CarRequestDto carRequestDto, List<MultipartFile> files, Long userId) {
        log.info("Trying to create car");
        boolean valid = imageService.validateFilesOnCreate(files);

        if(valid) {

            List<Image> images = imageService.filesToImages(files);

            carRepository.save(new Car(
                    null,
                    carRequestDto.make(),
                    carRequestDto.model(),
                    carRequestDto.year(),
                    carRequestDto.engineVolume(),
                    carRequestDto.engineType(),
                    carRequestDto.mileage(),
                    carRequestDto.description(),
                    userService.getUserById(userId),
                    images
            ));
        }

        log.info("Car successfully created");
    }

    public void removeCar(Long carId) {
        carRepository.deleteById(carId);
        log.info("Car with id {} has been deleted", carId);
    }

    public List<CarResponseDto> getCars() {
        //TODO Пагинация (Pageable)
        return carMapper.mapToResponse(carRepository.findAll());
    }

    public List<CarResponseDto> getUserCars(Long userId) {
        return carMapper.mapToResponse(carRepository.findAllByOwner_Id(userId));
    }

    public Car getCarById(Long id) {
        return carRepository.findById(id).orElseThrow(() -> new CarNotFoundException("Car with id " + id + " not found"));
    }

    public CarResponseDto getCarDtoById(Long id) {
        return carRepository.findById(id)
                .map(carMapper::mapToResponse)
                .orElseThrow(() -> new CarNotFoundException("Car with id " + id + " not found"));
    }


}
