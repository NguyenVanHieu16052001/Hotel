package com.xemphim.WebXemPhim.entity;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "service_detail")
public class ServiceDetail {
    @EmbeddedId
    private ServiceDetailID id;

    public ServiceDetailID getId() {
        return id;
    }

    public void setId(ServiceDetailID id) {
        this.id = id;
    }
}
