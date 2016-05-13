package com.solarpi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
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
			return "redirect:../../index.htm";
		
		model.addAttribute("activeTab","#tab-order");
		List<Order> orders = orderService.getOrders(page, email);
		model.addAttribute("orders", orders);
		
		List<List<OrderDetail>> orderDetailsList = new ArrayList<List<OrderDetail>>();
		for (Order order : orders) {
			List<OrderDetail> od = orderService.getOrderDetail(order.getId());
			orderDetailsList .add(od);
		}
		
		model.addAttribute("orderDetailsList", orderDetailsList);
		
		int count = orderService.countOrders(email);
		double totalPage =  Math.ceil((float)count/PAGE_SIZE);
		model.addAttribute("curPage", page);
		model.addAttribute("pageSize", PAGE_SIZE);
		model.addAttribute("totalPage",totalPage==0 ? 1 : totalPage);
		
		return "profile-order";
	}
	
	@RequestMapping("/get/{orderId}")
	public String get(@PathVariable String orderId, HttpServletRequest request, Model model) {
		String email = (String) request.getSession().getAttribute("email");
		//»¹Î´µÇÂ¼
		if(StringUtil.isNullOrEmpty(email))
			return "redirect:../../index.htm";
		
		model.addAttribute("order",orderService.getOrder(orderId));
		model.addAttribute("orderDetails",orderService.getOrderDetail(orderId));
		return "profile-order-detail";
	}
	
}
