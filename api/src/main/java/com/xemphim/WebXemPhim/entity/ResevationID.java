package com.xemphim.WebXemPhim.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Embeddable
public class ResevationID implements Serializable {
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "room_id")
    private Room room;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_name")
    private Account account;
    @Column
    private Date time;
}
