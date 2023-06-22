package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.City;
import com.xemphim.WebXemPhim.entity.Service;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceRepo extends JpaRepository<Service, Integer> {
}
