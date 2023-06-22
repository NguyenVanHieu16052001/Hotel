package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.City;
import com.xemphim.WebXemPhim.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepo extends JpaRepository<Employee, Integer> {
}
