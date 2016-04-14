package com.solarpi.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solarpi.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(value="/register")
	public String register(@Valid User user, Errors errors){
		
		if (errors.hasErrors()) {
            return "register";
        }
		
		return "register";
	}
	
}
