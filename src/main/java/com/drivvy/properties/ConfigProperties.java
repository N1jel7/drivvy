package com.drivvy.properties;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@ConfigurationProperties(prefix = "default")
public class ConfigProperties {
    private String userImagePath;
    private String communityImagePath;
    private String postImagePath;
}
