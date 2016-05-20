package com.solarpi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solarpi.model.CountryStats;
import com.solarpi.model.ProductStats;
import com.solarpi.model.StatsJSON;
import com.solarpi.model.User;
import com.solarpi.service.OrderService;
import com.solarpi.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/passwordForm")
	public String passwordForm(HttpServletRequest request, Model model){
		
		if(notSignedin(request))
		{
			model.addAttribute("msg","admin.permissionDenied");
			return "register-info";
		}
		model.addAttribute("activeTab","#tab-editPassword");
		model.addAttribute("user",new User());
		return "admin-password";
	}
	
	@RequestMapping("/salesStatsForm")
	public String salesStatsForm(HttpServletRequest request, Model model){
		
		if(notSignedin(request))
		{
			model.addAttribute("msg","admin.permissionDenied");
			return "register-info";
		}
		
		model.addAttribute("activeTab","#tab-salesStats");
		return "admin-salesstats";
	}
	
	private Boolean notSignedin(HttpServletRequest request) 
	{
		String email = (String) request.getSession().getAttribute("email");
		return StringUtil.isNullOrEmpty(email) || !email.equals("admin@solarpi");
	}
	
	@RequestMapping("/topCountry")
	@ResponseBody
	public StatsJSON topCountry(String productName, int topNum) {
		List<CountryStats> countryStats = orderService.getTopSalesCountry(productName,topNum);
		
		StatsJSON stats = new StatsJSON();
		String label = productName + "销售量";
		if(productName.equals("all"))
			label = "总销售量";
			
		stats.setLabel(label);
		stats.setStats(countryStats);
		return stats;
	}
	
	@RequestMapping("/productSales")
	@ResponseBody
	public StatsJSON productSales() {
		List<ProductStats> productStats = orderService.getProductSales();
		StatsJSON stats = new StatsJSON();
		stats.setStats(productStats);
		return stats;
	}
	
}
