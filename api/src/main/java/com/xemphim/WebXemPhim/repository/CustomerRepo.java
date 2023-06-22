package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.City;
import com.xemphim.WebXemPhim.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
}
