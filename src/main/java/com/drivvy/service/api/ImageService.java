package com.drivvy.service.api;

import com.drivvy.model.Image;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ImageService {

    Image convertFileToImage(MultipartFile file) throws IOException;

    Image convertArrayToImage(byte[] array);
}
