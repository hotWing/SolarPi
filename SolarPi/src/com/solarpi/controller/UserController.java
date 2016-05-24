package com.solarpi.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solarpi.model.City;
import com.solarpi.model.User;
import com.solarpi.service.CityService;
import com.solarpi.service.CountryService;
import com.solarpi.service.UserService;
import com.solarpi.util.MD5Util;
import com.solarpi.util.Status;
import com.solarpi.util.StringUtil;
import com.solarpi.validator.First;
import com.solarpi.validator.Second;
import com.solarpi.validator.Third;
import com.solarpi.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserValidator userValidator;
	@Autowired
	private CountryService countryService;
	@Autowired
	private CityService cityService;
	@Autowired
	private UserService userService;
	
	public final static String SIGNIN_PAGE = "redirect:../index.htm";
	  
	@RequestMapping("/resetPassword")
	public String resetPassword(@Validated ({Third.class})User user, Errors errors, HttpServletRequest request,Model model) {
		userValidator.validate(user, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("user", user);
			return "resetPassword";
        }
		else {
			Status status = userService.resetPassword(user);
			if (status == Status.SUCCESS)
				model.addAttribute("msg","signin.resetPassword.done");
			else
				model.addAttribute("msg","signin.resetPassword.fail");
			return "register-info";
		}
	}
	
	
	@RequestMapping("/resetPasswordForm")
	public String resetPasswordForm(String email, String resetCode, HttpServletRequest request, Model model) {
		User user = new User();
		user.setEmail(email);
		user.setPasswordResetCode(resetCode);
		model.addAttribute("user",user);
		return "resetPassword";
	}
	
	@RequestMapping("/forgotPasswordForm")
	public String forgotPasswordForm() {
		return "forgotPassword";
	}
	
	@RequestMapping("/forgotPasswordEmail")
	@ResponseBody
	public String forgotPasswordEmail(String email) {
		return userService.forgotPasswordEmail(email);
	}
	
	@RequestMapping("/reSendEmail")
	@ResponseBody
	public String reSendEmail(String email) {
		return userService.reSendEmail(email);
	}
	
	@RequestMapping("/profile")
	public String profile(HttpServletRequest request, Model model){
		String email = (String) request.getSession().getAttribute("email");
		
		//»¹Î´µÇÂ¼
		if(StringUtil.isNullOrEmpty(email))
			return SIGNIN_PAGE;
		
		User user = userService.getUserInfo(email);
		setUserInfoForJsp(user, model, user.getCountry());
		model.addAttribute("activeTab","#tab-edit");
		return "profile-settings";
	}

	
	@RequestMapping("/passwordForm")
	public String passwordForm(HttpServletRequest request, Model model){
		String email = (String) request.getSession().getAttribute("email");
		
		//»¹Î´µÇÂ¼
		if(StringUtil.isNullOrEmpty(email))
			return SIGNIN_PAGE;
		
		model.addAttribute("user",new User());
		model.addAttribute("activeTab","#tab-editPassword");
		return "profile-password";
	}
	
	
	@RequestMapping("/regform")
	public String regform(Model model){
		model.addAttribute("user", new User()); 
		model.addAttribute("countries", countryService.getCountries());
		model.addAttribute("cities", cityService.getCities("Aruba"));
		return "register";
	}
	
	@RequestMapping("/signin")
	public String signin(@Validated ({First.class}) User user,  Errors errors, HttpServletRequest request, Model model) {
		if(errors.hasErrors()){
			model.addAttribute("user",user);
			return "signin";
		}
		
		Boolean isSignedin = userService.validate(user);
		if(!isSignedin) {
			model.addAttribute("errormsg","signin.errormsg");
			return "signin";
		}
	
		request.getSession().setAttribute("email", user.getEmail());
		return "redirect:../index.htm";

	}
	
	@RequestMapping("/editPassword")
	public String editPassword(@Validated ({Third.class})User user, Errors errors,String oldPassword, HttpServletRequest request,Model model) {
		String email = (String) request.getSession().getAttribute("email");
		
		if(StringUtil.isNullOrEmpty(email))
			return SIGNIN_PAGE;
		
		//¾ÉÃÜÂëÎª¿Õ
		if (StringUtil.isNullOrEmpty(oldPassword)) {
			model.addAttribute("invalidPassword","profile.oldPassword.NotNull");
			return "profile-password";
		}
		
		//¾ÉÃÜÂë´íÎó
		User userTemp = userService.getUserInfo(email);
		String passwordInput = MD5Util.toMD5(oldPassword);
		if(!userTemp.getPassword().equals(passwordInput)){
			model.addAttribute("invalidPassword","profile.oldPassword.invalidPassword");
			return "profile-password";
		}
			
		userValidator.validate(user, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("user", user);
        }
		else {
			userTemp.setPassword(MD5Util.toMD5(user.getPassword()));
			userService.updateUser(userTemp);
			model.addAttribute("msg","profile.saveSuccess");
		}
		return "profile-password";
	}
	
	@RequestMapping("/edit") 
	public String edit(User user, HttpServletRequest request, Model model) {
		String email = (String) request.getSession().getAttribute("email");
		
		if(StringUtil.isNullOrEmpty(email))
			return SIGNIN_PAGE;
		
		userService.edit(email, user.getCountry(), user.getCity());
		model.addAttribute("msg","profile.saveSuccess");
		return "redirect:profile";
	}
		
	
	
	@RequestMapping("/signout")
	public String signout(HttpServletRequest request,String page){
		request.getSession().removeAttribute("email");
		
		return "redirect:../" + page;
		
	}
	
	@RequestMapping("/signinform")
	public String signinform(Model model){
		model.addAttribute("user", new User()); 
		return "signin";
	}
	
	@RequestMapping("/signup")
	public String signup(@Validated ({Second.class}) User user, Errors errors, Model model){
		String countryName = user.getCountry();
		
		user.setCountry(countryName);
		user.setIsActived(0);
		
		Calendar cl = Calendar.getInstance();  
		user.setRegisterTime(cl.getTime());
		
		user.setValidateCode(MD5Util.toMD5(user.getEmail()+cl.getTime().toString()));
		
        cl.add(Calendar.DATE , 2); 
		user.setActiveTime(cl.getTime());
		
		userValidator.validate(user, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("user", user); 
			model.addAttribute("countries", countryService.getCountries());
			model.addAttribute("cities", cityService.getCities(countryName));
            return "register";
        }
		
		user.setPassword(MD5Util.toMD5(user.getPassword()));
		user.setConfirmPassword(MD5Util.toMD5(user.getConfirmPassword()));
		try{
			userService.addUser(user);
		}catch (DuplicateKeyException e) {
			model.addAttribute("emailDuplicated","emailDuplicated");
			setUserInfoForJsp(user, model, countryName);
			return "register";
		}
		
		userService.sendActivationEmail(user);
		model.addAttribute("msg","register.success");
		return "register-info";
	}
	
	@RequestMapping("/getCities/{country}")
	@ResponseBody
	public List<City> getCities(@PathVariable String country)
	{
		return cityService.getCities(country);
	}
	
	@RequestMapping("/active")
	public String active(String email, String validateCode, Model model) {
		String msg = userService.activeUser(email, validateCode);
		model.addAttribute("msg",msg);
		return "register-info";
	}
	
	private void setUserInfoForJsp(User user, Model model,String countryName) {
		user.setPassword("");
		user.setConfirmPassword("");
		model.addAttribute("user", user); 
		model.addAttribute("countries", countryService.getCountries());
		model.addAttribute("cities", cityService.getCities(countryName));
	}
}
