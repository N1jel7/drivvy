package com.drivvy;

import com.drivvy.properties.ConfigProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import java.io.IOException;

@SpringBootApplication
@Slf4j
@EnableConfigurationProperties(ConfigProperties.class)
public class DrivvyApplication {

    public static void main(String[] args) {
        SpringApplication.run(DrivvyApplication.class, args);
    }

}
