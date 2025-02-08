package com.drivvy.repository;

import com.drivvy.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {
    List<Car> findAllByOwner_Id(Long ownerId);
    void deleteById(Long carId);
    Car findByOwner_id(Long ownerId);
}
