package com.xemphim.WebXemPhim.entity;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table
public class Resevation {
    @EmbeddedId
    private ResevationID id;

    public ResevationID getId() {
        return id;
    }

    public void setId(ResevationID id) {
        this.id = id;
    }
}
