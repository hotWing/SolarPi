package com.solarpi.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solarpi.model.City;
import com.solarpi.model.User;
import com.solarpi.service.CityService;
import com.solarpi.service.CountryService;
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
	  
	@RequestMapping("/regform")
	public String regform(Model model){
		model.addAttribute("user", new User()); 
		model.addAttribute("countries", countryService.getCountries());
		model.addAttribute("cities", cityService.getCities("ABW"));
		return "register";
	}
	
	@RequestMapping("/signup")
	public String signup(@Valid User user, Errors errors){
		String countryNameWithCode = user.getCountry();
		String coutryName = countryNameWithCode.split(":")[1];
		user.setCountry(coutryName);
		
		userValidator.validate(user, errors);
		
		if (errors.hasErrors()) {
            return "register";
        }
		return "register";
	}
	
	@RequestMapping("/getCities/{code}")
	@ResponseBody
	public List<City> getCities(@PathVariable String code)
	{
		return cityService.getCities(code);
	}
}
