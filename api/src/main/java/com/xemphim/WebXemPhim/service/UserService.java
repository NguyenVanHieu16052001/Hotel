package com.xemphim.WebXemPhim.service;


import com.xemphim.WebXemPhim.entity.Customer;

public interface UserService {

    void saveUserVerificationToken(Customer theUser, String verificationToken);
}
