package com.xemphim.WebXemPhim.repository;

import com.xemphim.WebXemPhim.entity.Hotel;
import com.xemphim.WebXemPhim.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RoomRepo extends JpaRepository<Room, Integer> {
    List<Room> findByStatusTrue();

    List<Room> findByHotelAndStatusTrue(Hotel hotel);

    @Query(value = "SELECT Count(*) FROM reservation WHERE room_id = :id AND status >= 1;",nativeQuery = true)
    int getRoomUsing(@Param("id") int id);

    Room findByHotelAndNumberAndStatusTrue(Hotel hotel, int number);
}
