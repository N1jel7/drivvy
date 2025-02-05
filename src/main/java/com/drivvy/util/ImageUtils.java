package com.drivvy.util;

import java.util.Base64;
import java.util.Collection;
import java.util.List;

public final class ImageUtils {

    public static String encode(byte[] image) {
        return Base64.getEncoder().encodeToString(image);
    }

    public static List<String> encode(Collection<byte[]> images) {
        return images.stream()
                .map(ImageUtils::encode)
                .toList();
    }
}
