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
import com.solarpi.validator.First;
import com.solarpi.validator.Second;
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
	  
	@RequestMapping("/regform")
	public String regform(Model model){
		model.addAttribute("user", new User()); 
		model.addAttribute("countries", countryService.getCountries());
		model.addAttribute("cities", cityService.getCities("ABW"));
		return "register";
	}
	
	@RequestMapping("/signin")
	public String signin(@Validated ({First.class}) User user, HttpServletRequest request, Errors errors, Model model) {
		if(errors.hasErrors()){
			model.addAttribute("user",user);
			return "signin";
		}
		
		Boolean isSignedin = userService.signin(user);
		if(!isSignedin) {
			model.addAttribute("errormsg","signin.errormsg");
			return "signin";
		}
	
		request.getSession().setAttribute("email", user.getEmail());
		return "redirect:../index.htm";
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
		String countryNameWithCode = user.getCountry();
		String[] countryNameWithCodeArray = countryNameWithCode.split(":");
		String countryName = countryNameWithCodeArray[1];
		String countryCode = countryNameWithCodeArray[0];
		user.setCountry(countryName);
		user.setIsActived(0);
		
		Calendar cl = Calendar.getInstance();  
		user.setRegisterTime(cl.getTime());
		
		user.setValidateCode(MD5Util.toMD5(user.getEmail()+cl.getTime().toString()));
		
        cl.add(Calendar.DATE , 2); 
		user.setActiveTime(cl.getTime());
		
		userValidator.validate(user, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("countrySelection",countryNameWithCode);
			user.setPassword("");
			user.setConfirmPassword("");
			model.addAttribute("user", user); 
			model.addAttribute("countries", countryService.getCountries());
			model.addAttribute("cities", cityService.getCities(countryCode));
			
            return "register";
        }
		
		user.setPassword(MD5Util.toMD5(user.getPassword()));
		user.setConfirmPassword(MD5Util.toMD5(user.getConfirmPassword()));
		try{
			userService.addUser(user);
		}catch (DuplicateKeyException e) {
			model.addAttribute("emailDuplicated","emailDuplicated");
			model.addAttribute("countrySelection",countryNameWithCode);
			model.addAttribute("user", user); 
			model.addAttribute("countries", countryService.getCountries());
			model.addAttribute("cities", cityService.getCities(countryCode));
			return "register";
		}
		
		userService.sendActivationEmail(user);
		model.addAttribute("msg","register.success");
		return "register-info";
	}
	
	@RequestMapping("/getCities/{code}")
	@ResponseBody
	public List<City> getCities(@PathVariable String code)
	{
		return cityService.getCities(code);
	}
	
	@RequestMapping("/active")
	public String active(String email, String validateCode, Model model) {
		String msg = userService.activeUser(email, validateCode);
		model.addAttribute("msg",msg);
		return "register-info";
	}
}
