package com.xemphim.WebXemPhim.dto.mapper;

import com.xemphim.WebXemPhim.dto.AccountDTO;
import com.xemphim.WebXemPhim.entity.Account;

public class AccountMapper {
    private static AccountMapper INSTANCE;
    public static AccountMapper getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new AccountMapper();
        }
        return INSTANCE;
    }
    public AccountDTO toDTO(Account account) {
        AccountDTO dto = new AccountDTO();
        dto.setAccountName(account.getAccountName());
        dto.setUserName(account.getUser().getFullname());
        dto.setRole(account.getRole().getRoleName());
        dto.setEmail(account.getAccountName());
        dto.setSex(account.getUser().isSex());
        dto.setBirtdate(account.getUser().getBirthdate());
        return dto;
    }
}
