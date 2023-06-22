package com.xemphim.WebXemPhim.service;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface ClientService {
    void getRooms( HttpServletRequest request, HttpServletResponse response) throws IOException;
    void getHotels( HttpServletRequest request, HttpServletResponse response) throws IOException;

    void getHotelById(Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException;

    void searchHotelById(String id, String city, HttpServletRequest request, HttpServletResponse response) throws IOException;

    void getRoomDetail(Integer id,  HttpServletRequest request, HttpServletResponse response) throws IOException;

    void getRoomByHotel(Integer id,  HttpServletRequest request, HttpServletResponse response) throws IOException;

    void getCityUsing( HttpServletRequest request, HttpServletResponse response) throws IOException;
}
