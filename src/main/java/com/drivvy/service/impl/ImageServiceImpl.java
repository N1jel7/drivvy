package com.drivvy.service.impl;

import com.drivvy.exception.ConvertFileException;
import com.drivvy.exception.ImageNotFoundException;
import com.drivvy.exception.ImageValidationException;
import com.drivvy.mapper.ImageMapper;
import com.drivvy.model.*;
import com.drivvy.properties.ConfigProperties;
import com.drivvy.repository.ImageRepository;
import com.drivvy.service.api.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {

    private final ImageMapper imageMapper;
    private final ConfigProperties configProperties;
    private final ImageRepository imageRepository;

    public boolean validateFilesOnCreate(List<MultipartFile> files) {
        if(files != null && files.size() > 10) {
            throw new ImageValidationException("Incorrect numbers of images (>10)");
        }

        if(files == null) {
            log.info("There are no images");
            return false;
        }

        log.info("Files successfully passed validation");
        return true;
    }

    public boolean validateFilesOnUpdate(List<MultipartFile> files){
        if(files.size() > 10) {
            throw new ImageValidationException("Incorrect numbers of images (>10)");
        }
        return true;
    };

    public Image convertFileToImage(MultipartFile file) {
        log.info("Trying to convert file to image");
        Image image = new Image();

        try {
            image.setImage(file.getBytes());
            image.setCreatedAt(LocalDateTime.now());
        } catch (IOException e) {
            throw new ConvertFileException("Can't convert file to image");
        }

        return image;
    }

    public List<Image> filesToImages(List<MultipartFile> files) {

        log.info("Trying to set images from uploaded files");
        List<Image> imagesFromFiles = new ArrayList<>();

        for (MultipartFile file : files) {
            Image image = convertFileToImage(file);
            if (files.getFirst().equals(file) && imagesFromFiles.isEmpty()) {
                image.setPreview(true);
            }
            imagesFromFiles.add(image);
        }

        return imagesFromFiles;
    }

    public Image convertArrayToImage(byte[] array) {
        Image image = new Image();
        image.setImage(array);
        return image;
    }

    public byte[] convertFileToArray(MultipartFile file) {
        try {
            return file.getBytes();
        } catch (IOException e) {
            throw new ConvertFileException("Can't convert multipart file to bytes");
        }
    }


    public Image setDefaultCommunityImage() {
        try {
            Image image = new Image();
            image.setImage(Files.readAllBytes(new File(configProperties.getCommunityImagePath()).toPath()));
            return image;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    public Image setDefaultUserImage() {
        Image image = new Image();
        try {
            image.setImage(Files.readAllBytes(new File(configProperties.getUserImagePath()).toPath()));
            return image;
        } catch (IOException e) {
            throw new ImageNotFoundException("Image not found");
        }
    }
}
