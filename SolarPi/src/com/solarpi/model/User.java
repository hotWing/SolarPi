package com.solarpi.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class User {
	
	@Email
	private String email;
	
	 @NotNull
    @Size(min=5, max=25)
	private String password;
//	private String country;
//	private int isActived;
//	private Date registerTimne;
//	private Date activeTime;
//	private String validateCode;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
//	public String getCountry() {
//		return country;
//	}
//	public void setCountry(String country) {
//		this.country = country;
//	}
//	public int getIsActived() {
//		return isActived;
//	}
//	public void setIsActived(int isActived) {
//		this.isActived = isActived;
//	}
//	public Date getRegisterTimne() {
//		return registerTimne;
//	}
//	public void setRegisterTimne(Date registerTimne) {
//		this.registerTimne = registerTimne;
//	}
//	public Date getActiveTime() {
//		return activeTime;
//	}
//	public void setActiveTime(Date activeTime) {
//		this.activeTime = activeTime;
//	}
//	public String getValidateCode() {
//		return validateCode;
//	}
//	public void setValidateCode(String validateCode) {
//		this.validateCode = validateCode;
//	}
}
