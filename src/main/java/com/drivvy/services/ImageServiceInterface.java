package com.drivvy.services;

import com.drivvy.models.Image;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ImageServiceInterface {

    Image convertFileToImage(MultipartFile file) throws IOException;

    Image convertArrayToImage(byte[] array);
}
