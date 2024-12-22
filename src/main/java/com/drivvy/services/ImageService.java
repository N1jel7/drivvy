package com.drivvy.services;

import com.drivvy.models.Image;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@Service
public class ImageService implements ImageServiceInterface {

    public Image convertFileToImage(MultipartFile file) throws IOException {
        log.info("Trying to convert file to image");
        Image image = new Image();
        image.setImage(file.getBytes());
        log.info("Converting ends successfully");
        return image;
    }

    public Image convertArrayToImage(byte[] array) {
        Image image = new Image();
        image.setImage(array);
        return image;
    }
}
