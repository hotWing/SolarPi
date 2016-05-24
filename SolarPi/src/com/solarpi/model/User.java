package com.solarpi.model;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.solarpi.validator.First;
import com.solarpi.validator.Second;
import com.solarpi.validator.Third;

public class User {
	
	@NotEmpty(groups = { First.class, Second.class })
	@Email(groups = { First.class, Second.class })
	@Size(max=100,groups = {Second.class })
	private String email;
	
	@NotEmpty(groups = {First.class})
    @Size(min=5, max=20,groups = {Second.class, Third.class})
	private String password;
	 
	@NotEmpty(groups = {Second.class, Third.class})
	private String confirmPassword;
	
	private String country;
	private String city;
	
	private int isActived;
	private Date registerTime;
	private Date activeTime;
	private String validateCode;
	private String passwordResetCode;
	private Date passwordResetTime;
	private int passwordReset;
	
	public int getPasswordReset() {
		return passwordReset;
	}
	public void setPasswordReset(int passwordReset) {
		this.passwordReset = passwordReset;
	}
	public Date getPasswordResetTime() {
		return passwordResetTime;
	}
	public void setPasswordResetTime(Date passwordResetTime) {
		this.passwordResetTime = passwordResetTime;
	}
	public String getPasswordResetCode() {
		return passwordResetCode;
	}
	public void setPasswordResetCode(String passwordResetCode) {
		this.passwordResetCode = passwordResetCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getIsActived() {
		return isActived;
	}
	public void setIsActived(int isActived) {
		this.isActived = isActived;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTimne) {
		this.registerTime = registerTimne;
	}
	public Date getActiveTime() {
		return activeTime;
	}
	public void setActiveTime(Date activeTime) {
		this.activeTime = activeTime;
	}
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
}
