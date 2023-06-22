package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.Resevation;
import com.xemphim.WebXemPhim.entity.ResevationID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ResevationRepo extends JpaRepository<Resevation, ResevationID> {
}
