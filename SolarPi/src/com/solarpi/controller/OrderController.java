package com.solarpi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solarpi.service.OrderService;
import com.solarpi.util.StringUtil;

@Controller
@RequestMapping("/order")
public class OrderController {
	public static final int PAGE_SIZE = 5;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/list/{page}")
	public String list(@PathVariable int page, HttpServletRequest request, Model model){
		String email = (String) request.getSession().getAttribute("email");
		
		//»¹Î´µÇÂ¼
		if(StringUtil.isNullOrEmpty(email))
			return UserController.SIGNIN_PAGE;
		
		model.addAttribute("activeTab","#tab-order");
		model.addAttribute("orders", orderService.getOrders(page)); 
		int count = orderService.countOrders();
		double totalPage =  Math.ceil((float)count/PAGE_SIZE);
		model.addAttribute("curPage", page);
		model.addAttribute("pageSize", PAGE_SIZE);
		model.addAttribute("totalPage",totalPage==0 ? 1 : totalPage);
		
		return "profile-order";
	}
	
}
