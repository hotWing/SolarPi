package com.solarpi.service;

import com.solarpi.model.User;

public interface UserService {
	public void addUser(User user);
	public void sendActivationEmail(User user);
	public String activeUser(String email, String validateCode);
	public Boolean validate(User user);
	public User getUserInfo(String email);
	public void edit(String email, String country, String city);
	
}
