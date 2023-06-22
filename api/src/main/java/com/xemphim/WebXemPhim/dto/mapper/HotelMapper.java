package com.xemphim.WebXemPhim.dto.mapper;

import com.xemphim.WebXemPhim.dto.HotelDTo;
import com.xemphim.WebXemPhim.entity.Hotel;

public class HotelMapper {
    private static HotelMapper INSTANCE;
    public static HotelMapper getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new HotelMapper();
        }
        return INSTANCE;
    }
    public HotelDTo toDTO(Hotel account) {
        HotelDTo dto = new HotelDTo();
        dto.setId(account.getId());
        dto.setImage(account.getImage());
        dto.setAddress(account.getAddress());
        dto.setEmail(account.getEmail());
        dto.setStatus(account.isStatus());
        dto.setCity(account.getCity().getName());
        dto.setName(account.getName());
        dto.setPhoneNumber(account.getPhone_number());

        return dto;
    }
}
