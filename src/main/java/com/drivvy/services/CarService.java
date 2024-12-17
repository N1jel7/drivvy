package com.drivvy.services;

import com.drivvy.models.Car;
import com.drivvy.models.Image;
import com.drivvy.repositories.CarRepository;
import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CarService {

    private final CarRepository carRepository;
    private final UserRepository userRepository;

    public void createCar(Car car, List<MultipartFile> files) throws IOException {
        int counter = 0;
        if(files.getFirst().getName().isEmpty()) {
            // TODO заменить путь на значение из проперти (Value/ConfigurationProperties)
            car.addImageByPath("E:\\Dev\\drivvy\\src\\main\\resources\\images\\default_car.png");
        } else {
            filesLoop:
            for(MultipartFile file : files) {
                counter++;
                Image image = convertFileToImage(file);
                if(files.getFirst().equals(file)) {
                    image.setPreview(true);
                }
                car.addImage(image);
                if(counter == 10) break filesLoop;
            }
        }
        carRepository.save(car);
    }

    public Image convertFileToImage(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setImage(file.getBytes());
        return image;
    }

}
