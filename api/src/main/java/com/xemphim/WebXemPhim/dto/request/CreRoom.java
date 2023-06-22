package com.xemphim.WebXemPhim.dto.request;

import org.springframework.web.multipart.MultipartFile;

public class CreRoom {

    private int number;

    private float area;
    private int bedNumb;
    private int peopleNumb;

    private MultipartFile image;

    private int price;

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

    public int getBedNumb() {
        return bedNumb;
    }

    public void setBedNumb(int bedNumb) {
        this.bedNumb = bedNumb;
    }

    public int getPeopleNumb() {
        return peopleNumb;
    }

    public void setPeopleNumb(int peopleNumb) {
        this.peopleNumb = peopleNumb;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
