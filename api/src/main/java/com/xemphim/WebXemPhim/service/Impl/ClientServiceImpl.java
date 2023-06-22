package com.xemphim.WebXemPhim.service.Impl;

import java.io.IOException;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xemphim.WebXemPhim.common.APIResponse;
import com.xemphim.WebXemPhim.dto.HotelDTo;
import com.xemphim.WebXemPhim.dto.RoomDTO;
import com.xemphim.WebXemPhim.dto.mapper.HotelMapper;
import com.xemphim.WebXemPhim.dto.mapper.RoomMapper;
import com.xemphim.WebXemPhim.entity.*;
import com.xemphim.WebXemPhim.repository.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import com.xemphim.WebXemPhim.service.ClientService;
import com.xemphim.WebXemPhim.service.JwtService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private HotelRepo hotelRepo;

    @Autowired
    private RoomRepo roomRepo;
    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private CityRepo cityRepo;


    @Override
    public void getHotels( HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Hotel> hotels = hotelRepo.findByStatusTrue();
        List<HotelDTo> hotelDTOS = new ArrayList<>();
        for (Hotel r: hotels) {
            hotelDTOS.add(HotelMapper.getInstance().toDTO(r));
        }
        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(hotelDTOS);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }

    @Override
    public void getRooms( HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Room> hotels = roomRepo.findByStatusTrue();
        List<RoomDTO> roomDTOS = new ArrayList<>();
        for (Room r: hotels) {
            roomDTOS.add(RoomMapper.getInstance().toDTO(r));
        }
        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(roomDTOS);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }

    @Override
    public void getHotelById(Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Hotel hotel = hotelRepo.findById(id).get();
        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(HotelMapper.getInstance().toDTO(hotel));
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }

    @Override
    public void searchHotelById(String name, String cityName, HttpServletRequest request, HttpServletResponse response) throws IOException {
        City city = cityRepo.findByName(cityName);
        List<Hotel> hotels = hotelRepo.findByCityAndNameContainingAndStatusTrue(city,name);
        List<HotelDTo> hotelDTOS = new ArrayList<>();
        for (Hotel r: hotels) {
            hotelDTOS.add(HotelMapper.getInstance().toDTO(r));
        }
        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(hotelDTOS);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }

    @Override
    public void getRoomDetail(Integer id,  HttpServletRequest request, HttpServletResponse response) throws IOException {
        Room room = roomRepo.findById(id).get();
        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(RoomMapper.getInstance().toDTO(room));
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }

    @Override
    public void getRoomByHotel(Integer id , HttpServletRequest request, HttpServletResponse response) throws IOException {
        Hotel hotel = hotelRepo.findById(id).get();
        List<Room> rooms = roomRepo.findByHotelAndStatusTrue(hotel);
        List<RoomDTO> roomDTOS = new ArrayList<>();
        for (Room r: rooms) {
            roomDTOS.add(RoomMapper.getInstance().toDTO(r));
        }

        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(roomDTOS);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }

    @Override
    public void getCityUsing( HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<City> cities = cityRepo.getCityUsing();
        APIResponse apiResponse = new APIResponse();
        apiResponse.setData(cities);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
    }
}
