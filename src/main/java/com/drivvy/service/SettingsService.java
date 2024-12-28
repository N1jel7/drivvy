package com.drivvy.service;

import com.drivvy.model.User;
import org.springframework.web.multipart.MultipartFile;

public interface SettingsService {
    User updateAvatar(MultipartFile file, Long id);

    User getUserInfo(String username);
}
