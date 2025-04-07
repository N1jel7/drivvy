package com.drivvy.service.impl;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CarRequestDto;
import com.drivvy.dto.response.CarResponseDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.exception.CarNotFoundException;
import com.drivvy.mapper.CarMapper;
import com.drivvy.model.Car;
import com.drivvy.model.Image;
import com.drivvy.model.Post;
import com.drivvy.model.User;
import com.drivvy.repository.CarRepository;
import com.drivvy.repository.PostRepository;
import com.drivvy.service.api.CarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
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
    private final PostRepository postRepository;

    public CarResponseDto mapToResponse(Car car) {

        List<Post> posts = postRepository.findAllByCar_Id(car.getId());

        return carMapper.mapToResponse(car, posts);

    }

    public List<CarResponseDto> mapToResponse(List<Car> cars) {
        return cars.stream()
                .map(this::mapToResponse)
                .toList();
    }

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
                images.add(imageService.convertMultipartFileToImage(files.get(iterator)));

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

        if (valid) {

            List<Image> images = imageService.convertMultipartFilesToImages(files);

            carRepository.save(Car.builder()
                    .make(carRequestDto.make())
                    .model(carRequestDto.model())
                    .year(carRequestDto.year())
                    .engineVolume(carRequestDto.engineVolume())
                    .engineType(carRequestDto.engineType())
                    .mileage(carRequestDto.mileage())
                    .description(carRequestDto.description())
                    .owner(userService.getUserById(userId))
                    .images(images)
                    .createdAt(LocalDateTime.now())
                    .build());
        }

        log.info("Car successfully created");
    }

    public void removeCar(Long carId) {
        carRepository.deleteById(carId);
        log.info("Car with id {} has been deleted", carId);
    }

    public List<CarResponseDto> getCars() {
        //TODO Пагинация (Pageable)
        return mapToResponse(carRepository.findAll());
    }

    public List<CarResponseDto> getUserCars(Long userId) {
        return mapToResponse(carRepository.findAllByOwner_Id(userId));
    }

    public CarResponseDto getUserLastCar(Long userId) {
        return mapToResponse(carRepository.findByOwner_id(userId));
    }

    public Car getCarById(Long id) {
        return carRepository.findById(id).orElseThrow(() -> new CarNotFoundException("Car with id " + id + " not found"));
    }

    public CarResponseDto getCarDtoById(Long id) {
        return carRepository.findById(id)
                .map(this::mapToResponse)
                .orElseThrow(() -> new CarNotFoundException("Car with id " + id + " not found"));
    }

    public boolean likeOrDislikeCar(Long userId, Long carId) {
        Car car = getCarById(carId);
        User user = userService.getUserById(userId);

        if (car.getUsersLikes().contains(user)) {
            car.getUsersLikes().remove(user);
            carRepository.save(car);
            return false;
        } else {
            car.getUsersLikes().add(user);
            carRepository.save(car);
            return true;
        }

    }

}
