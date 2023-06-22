package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.ServiceDetail;
import com.xemphim.WebXemPhim.entity.ServiceDetailID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceDetailRepo extends JpaRepository<ServiceDetail, ServiceDetailID> {
}
