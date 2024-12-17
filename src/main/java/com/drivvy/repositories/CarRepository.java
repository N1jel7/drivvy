package com.drivvy.repositories;

import com.drivvy.models.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Long> {
    Car findById(long id);
}
