package com.xemphim.WebXemPhim.entity;

import jakarta.persistence.*;
import org.hibernate.sql.results.graph.Fetch;

@Entity
@Table(name = "rooms")
public class Room {
    @Id
    @Column
    private int id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
    private Hotel hotel;

    @Column
    private int number;
    @Column
    private float area;
    @Column
    private int bed_numb;
    @Column
    private int people_numb;
    @Column
    private String image;
    @Column
    private int price;
    @Column
    private boolean status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
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
