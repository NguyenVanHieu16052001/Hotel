package com.xemphim.WebXemPhim.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.xemphim.WebXemPhim.repository.HotelRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.xemphim.WebXemPhim.common.APIResponse;

import com.xemphim.WebXemPhim.repository.AccountRepository;
import com.xemphim.WebXemPhim.service.AuthenticationService;
import com.xemphim.WebXemPhim.service.ClientService;
import com.xemphim.WebXemPhim.service.JwtService;

@RestController
@RequestMapping("home")
public class HomeController {
    @Autowired
    private ClientService clientService;


    @Autowired
    private JwtService jwtService;

    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private HotelRepo hotelRepo;

    @GetMapping("hotel/{id}")
    private void getHotelById(@PathVariable(value="id") Integer id, HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.getHotelById(id, request, response);
    }
    @GetMapping("hotels/{city}/{name}")
    private void searchHotel(@PathVariable(value="name") String name,
                             @PathVariable(value="city") String city, HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.searchHotelById(name,city, request, response);
    }
    @GetMapping("rooms/{id}")
    private void getRoomDetail(@PathVariable(value="id") Integer id, HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.getRoomDetail(id, request, response);
    }
    @GetMapping("{id}/rooms")
    private void getRoomByHotel(@PathVariable(value="id") Integer id,HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.getRoomByHotel(id, request, response);
    }
    @GetMapping("city-using")
    private void getCityUsing( HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.getCityUsing( request, response);
    }

    @GetMapping("hotels")
    private void getHotels(HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.getHotels(request, response);
    }
}
