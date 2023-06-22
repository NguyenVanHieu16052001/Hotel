package com.xemphim.WebXemPhim.dto;

import com.xemphim.WebXemPhim.entity.Hotel;
import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

public class RoomDTO {
    private int id;

    private String hotel;


    private int number;

    private float area;

    private int bed_numb;

    private int people_numb;

    private String image;

    private int price;

    private boolean status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public int getBed_numb() {
        return bed_numb;
    }

    public void setBed_numb(int bed_numb) {
        this.bed_numb = bed_numb;
    }

    public int getPeople_numb() {
        return people_numb;
    }

    public void setPeople_numb(int people_numb) {
        this.people_numb = people_numb;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
