package com.xemphim.WebXemPhim.event;

import com.xemphim.WebXemPhim.entity.Customer;
import org.springframework.context.ApplicationEvent;



public class RegistrationCompleteEvent extends ApplicationEvent {
    private Customer user;
    private String applicationUrl;

    public RegistrationCompleteEvent(Customer user, String applicationUrl) {
        super(user);
        this.user = user;
        this.applicationUrl = applicationUrl;
    }

	public Customer getUser() {
		return user;
	}

	public void setUser(Customer user) {
		this.user = user;
	}

	public String getApplicationUrl() {
		return applicationUrl;
	}

	public void setApplicationUrl(String applicationUrl) {
		this.applicationUrl = applicationUrl;
	}
    
}
