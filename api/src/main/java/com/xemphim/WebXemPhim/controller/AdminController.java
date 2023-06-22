package com.xemphim.WebXemPhim.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xemphim.WebXemPhim.dto.request.*;
import com.xemphim.WebXemPhim.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.xemphim.WebXemPhim.common.APIResponse;
import com.xemphim.WebXemPhim.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private ClientService clientService;

    @GetMapping("hotels")
    private void getHotels( HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        clientService.getHotels( request, response);
    }
    @PostMapping("hotels/update/{id}")
    private void updateHotel(@ModelAttribute CreHotel creHotel,
                             @PathVariable(value="id") Integer id,
                             HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        adminService.updateHotel(creHotel,id, request, response);
    }
    @PostMapping("hotels/add")
    private void creHotel(@ModelAttribute CreHotel creHotel,
                             HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        adminService.creHotel(creHotel, request, response);
    }
    @PostMapping("hotels/hide/{id}")
    private void hideHotel(@PathVariable(value="id") Integer id, HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        adminService.hideHotel(id, request, response);
    }
    @PostMapping("rooms/hide/{id}")
    private void hideRoom(
                          @PathVariable(value="id") Integer id,
                          HttpServletRequest request,
                          HttpServletResponse response
    ) throws IOException {
        adminService.hideRoom(id, request, response);
    }
    @PostMapping("{id}/rooms/add")
    private void addRoom( @PathVariable(value="id") Integer id,
                          @ModelAttribute CreRoom creRoom,
                         HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        adminService.creRoom(id,creRoom, request, response);
    }
    @PostMapping("rooms/update/{id}")
    private void updateRoom( @PathVariable(value="id") Integer id,
                          @ModelAttribute CreRoom creRoom,
                          HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        adminService.updateRoom(id,creRoom, request, response);
    }
}
