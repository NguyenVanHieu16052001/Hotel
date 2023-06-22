package com.xemphim.WebXemPhim.dto.request;

public class SignUpRequestDTO {
    private String name;
    private String email;
    private String password;

    public String getAccountName() {
        return name;
    }

    public void setAccountName(String accountName) {
        this.name = accountName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
