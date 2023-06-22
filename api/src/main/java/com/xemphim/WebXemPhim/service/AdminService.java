package com.xemphim.WebXemPhim.service;


import com.xemphim.WebXemPhim.dto.request.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public interface AdminService {
    void hideHotel(int id, HttpServletRequest request, HttpServletResponse response) throws IOException;

    void hideRoom( int id, HttpServletRequest request, HttpServletResponse response)throws IOException;
    public void creHotel(CreHotel creHotel, HttpServletRequest request, HttpServletResponse response) throws IOException;
    void updateHotel(CreHotel creHotel,int id, HttpServletRequest request, HttpServletResponse response)throws IOException;
    public void updateRoom(Integer id, CreRoom creRoom, HttpServletRequest request, HttpServletResponse response) throws IOException;
    void creRoom(Integer id, CreRoom creRoom, HttpServletRequest request, HttpServletResponse response) throws IOException;
}
