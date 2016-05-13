package com.solarpi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solarpi.model.User;

@Controller
public class MainController {
	
	
	@RequestMapping("/index.htm")
	public String index(Model model){
		model.addAttribute("user", new User()); 
		return "index";
	}
	

}
