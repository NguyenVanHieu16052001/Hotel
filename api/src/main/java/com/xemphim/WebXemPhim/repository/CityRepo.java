package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CityRepo extends JpaRepository<City, Integer> {
    City findByName(String cityName);
    @Query(value = "SELECT DISTINCT city.id, city.name FROM city INNER JOIN hotels ON city.id = hotels.city;",nativeQuery = true)
    List<City> getCityUsing();
}
