package com.xemphim.WebXemPhim.dto.mapper;

import com.xemphim.WebXemPhim.dto.RoomDTO;
import com.xemphim.WebXemPhim.entity.Room;

public class RoomMapper {
    private static RoomMapper INSTANCE;
    public static RoomMapper getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new RoomMapper();
        }
        return INSTANCE;
    }
    public RoomDTO toDTO(Room account) {
        RoomDTO dto = new RoomDTO();
        dto.setHotel(account.getHotel().getName());
        dto.setArea(account.getArea());
        dto.setId(account.getId());
        dto.setImage(account.getImage());
        dto.setPrice(account.getPrice());
        dto.setBed_numb(account.getBed_numb());
        dto.setPeople_numb(account.getPeople_numb());
        dto.setStatus(account.isStatus());
        dto.setNumber(account.getNumber());
        return dto;
    }
}
