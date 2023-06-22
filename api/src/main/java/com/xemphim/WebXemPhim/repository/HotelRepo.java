package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.City;
import com.xemphim.WebXemPhim.entity.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface HotelRepo extends JpaRepository<Hotel, Integer> {
    List<Hotel> findByStatusTrue();
    @Query(value = "SELECT COUNT(*) FROM rooms INNER JOIN reservation ON rooms.id = reservation.room_id WHERE rooms.hotel_id = :id AND reservation.status = 1;",
    nativeQuery = true)
    int getHotelUsing(@Param("id") int id);

    List<Hotel> findByCityAndNameContainingAndStatusTrue(City city, String name);
}
