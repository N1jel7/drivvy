package com.drivvy.util;

import java.util.ArrayList;
import java.util.List;

public final class CarUtils {

    public static List<String> getEngineVolumeList() {
        List<String> volumes = new ArrayList<>();
        float iterator = 0.1F;
        while(iterator <= 12.1) {
            volumes.add(String.format("%.1f",iterator));
            iterator += 0.1F;
        }
        return volumes;
    }

    public static List<Integer> getCarYearsList() {
        List<Integer> years = new ArrayList<>();
        int iterator = 1940;

        while (iterator <= 2025) {
            years.add(iterator);
            iterator++;
        }
        return years.reversed();
    }
}
