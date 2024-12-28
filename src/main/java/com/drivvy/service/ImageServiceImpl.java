package com.drivvy.service;

import com.drivvy.model.Car;
import com.drivvy.model.Image;
import com.drivvy.model.User;
import com.drivvy.properties.ConfigProperties;
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
public class ImageServiceImpl implements ImageService {

    private final ConfigProperties configProperties;

    public Image convertFileToImage(MultipartFile file) {
        log.info("Trying to convert file to image");
        Image image = new Image();

        try {

            image.setImage(file.getBytes());
        } catch (IOException e) {
            // FileConvertingException
            log.warn("Error while converting file to image", e);
        }

        log.info("Converting ends successfully");
        return image;

    }

    public Car setImagesToCar(Car car, List<MultipartFile> files) {

        log.info("Trying to set images from uploaded files");

        List<Image> imagesFromFiles = new ArrayList<>();

        for (MultipartFile file : files) {
            Image image = convertFileToImage(file);
            if (files.getFirst().equals(file)) {
                image.setPreview(true);
            }
            imagesFromFiles.add(image);
        }
        car.setImages(imagesFromFiles);

        log.info("Setting images of car {} {} {} successfully ended", car.getMake(), car.getModel(), car.getYear());

        return car;
    }

    public Image convertArrayToImage(byte[] array) {
        Image image = new Image();
        image.setImage(array);
        return image;
    }

    public User setDefaultUserImage(User user) {
        try {
            user.setAvatar(Files.readAllBytes(new File(configProperties.getUserImagePath()).toPath()));
            return user;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

}
