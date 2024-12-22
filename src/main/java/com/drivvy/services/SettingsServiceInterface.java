package com.drivvy.services;

import com.drivvy.models.User;
import org.springframework.web.multipart.MultipartFile;

public interface SettingsServiceInterface {
    User updateAvatar(MultipartFile file, Long id);

    User getUserInfo(String username);
}
