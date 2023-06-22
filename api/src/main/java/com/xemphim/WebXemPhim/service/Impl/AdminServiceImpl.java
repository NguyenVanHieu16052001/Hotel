package com.xemphim.WebXemPhim.service.Impl;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.xemphim.WebXemPhim.common.APIResponse;
import com.xemphim.WebXemPhim.dto.request.*;
import com.xemphim.WebXemPhim.entity.*;
import com.xemphim.WebXemPhim.repository.*;
import com.xemphim.WebXemPhim.service.AdminService;
import com.xemphim.WebXemPhim.service.FileService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class AdminServiceImpl implements AdminService {
    @Value("${project.video}")
    private String path;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private FileService fileService;

    @Autowired
    private HotelRepo hotelRepo;
    @Autowired
    private CityRepo cityRepo;

    @Autowired
    private RoomRepo roomRepo;

    @Override
    public void hideHotel(int id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Hotel hotel = hotelRepo.findById(id).get();
        int count = hotelRepo.getHotelUsing(id);
        if (count > 0) {
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(400);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        } else {
            hotel.setStatus(false);
            hotelRepo.save(hotel);
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(200);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        }
    }

    @Override
    public void hideRoom(int id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Room room = roomRepo.findById(id).get();
        int count = roomRepo.getRoomUsing(id);
        if (count > 0) {
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(400);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        } else {
            room.setStatus(false);
            roomRepo.save(room);
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(200);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        }
    }

    @Override
    public void updateHotel(CreHotel creHotel, int id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Hotel hotel = hotelRepo.findById(id).get();
        if (creHotel.getImage() != null) {
            String poster = fileService.uploadFile(path, creHotel.getImage());
            hotel.setImage(poster);
        }

        hotel.setPhone_number(creHotel.getPhoneNumber());
        hotel.setCity(cityRepo.findByName(creHotel.getCity()));
        hotel.setEmail(creHotel.getEmail());
        hotel.setAddress(creHotel.getAddress());
        hotel.setName(creHotel.getName());
        hotelRepo.save(hotel);
        APIResponse apiResponse = new APIResponse();
        apiResponse.setStatus(200);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);

    }

    @Override
    public void creHotel(CreHotel creHotel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Hotel hotel = new Hotel();
        String poster = fileService.uploadFile(path, creHotel.getImage());
        hotel.setImage(poster);
        hotel.setStatus(true);
        hotel.setPhone_number(creHotel.getPhoneNumber());
        hotel.setCity(cityRepo.findByName(creHotel.getCity()));
        hotel.setEmail(creHotel.getEmail());
        hotel.setAddress(creHotel.getAddress());
        hotel.setName(creHotel.getName());
        hotelRepo.save(hotel);
        APIResponse apiResponse = new APIResponse();
        apiResponse.setStatus(200);
        new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);

    }

    @Override
    public void creRoom(Integer id, CreRoom creRoom, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Hotel hotel = hotelRepo.findById(id).get();
        Room room = roomRepo.findByHotelAndNumberAndStatusTrue(hotel,creRoom.getNumber());
        if(room != null) {
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(400);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        }
        else {
            room = new Room();
            String poster = fileService.uploadFile(path, creRoom.getImage());
            room.setNumber(creRoom.getNumber());
            room.setImage(poster);
            room.setStatus(true);
            room.setHotel(hotel);
            room.setArea(creRoom.getArea());
            room.setBed_numb(creRoom.getBedNumb());
            room.setPeople_numb(creRoom.getPeopleNumb());
            room.setPrice(creRoom.getPrice());
            roomRepo.save(room);
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(200);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        }

    }
    @Override
    public void updateRoom(Integer id, CreRoom creRoom, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Room room = roomRepo.findById(id).get();
        if(room.getNumber() != creRoom.getNumber()){
            Room check = roomRepo.findByHotelAndNumberAndStatusTrue(room.getHotel(),creRoom.getNumber());
            if(check != null) {
                APIResponse apiResponse = new APIResponse();
                apiResponse.setStatus(400);
                new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
            }
            else {
                if(creRoom.getImage() != null){
                    String poster = fileService.uploadFile(path, creRoom.getImage());
                    room.setImage(poster);

                }
                room.setNumber(creRoom.getNumber());
                room.setArea(creRoom.getArea());
                room.setBed_numb(creRoom.getBedNumb());
                room.setPeople_numb(creRoom.getPeopleNumb());
                room.setPrice(creRoom.getPrice());
                roomRepo.save(room);
                APIResponse apiResponse = new APIResponse();
                apiResponse.setStatus(200);
                new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
            }
        }
        else {
            if(creRoom.getImage() != null){
                String poster = fileService.uploadFile(path, creRoom.getImage());
                room.setImage(poster);

            }
            room.setNumber(creRoom.getNumber());
            room.setArea(creRoom.getArea());
            room.setBed_numb(creRoom.getBedNumb());
            room.setPeople_numb(creRoom.getPeopleNumb());
            room.setPrice(creRoom.getPrice());
            roomRepo.save(room);
            APIResponse apiResponse = new APIResponse();
            apiResponse.setStatus(200);
            new ObjectMapper().writeValue(response.getOutputStream(), apiResponse);
        }

    }
}
