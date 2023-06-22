package com.xemphim.WebXemPhim.service.Impl;

import com.xemphim.WebXemPhim.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xemphim.WebXemPhim.entity.Account;
import com.xemphim.WebXemPhim.entity.Token;
import com.xemphim.WebXemPhim.repository.AccountRepository;
import com.xemphim.WebXemPhim.repository.TokenRepository;
import com.xemphim.WebXemPhim.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private TokenRepository tokenRepository;
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public void saveUserVerificationToken(Customer theUser, String verificationToken) {
        Token tk = new Token();
        tk.setToken(verificationToken);
        Account acc = accountRepository.findOneByUser(theUser).get();
        tk.setAccount(acc);
        tokenRepository.save(tk);
    }
}
