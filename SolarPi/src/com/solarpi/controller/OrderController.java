package com.solarpi.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
import com.solarpi.service.OrderService;
import com.solarpi.service.UserService;
import com.solarpi.util.StringUtil;
import com.solarpi.util.UniqueID;

@Controller
@RequestMapping("/order")
public class OrderController {
	public static final int PAGE_SIZE = 5;
	public static final float C10_PRICE = 99f;
	public static final float C50_PRICE = 999f;
	public static final float C100_PRICE = 1999f;

	@Autowired
	OrderService orderService;
	
	@Autowired
	UserService userService;
	
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
	
	@RequestMapping("/buy")
	@ResponseBody
	public String buy(int c10quantity, int c50quantity, int c100quantity,
			String consignee, String tel, String address, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		//»¹Î´µÇÂ¼
		if(StringUtil.isNullOrEmpty(email))
			return "signin";
		
		if (!userService.getIsActived(email)) 
			return "notActived";
		
		String orderId = String.valueOf(UniqueID.getId());
		Order order = new Order();
		order.setId(orderId);
		order.setDate(new Date());
		order.setAddress(address);
		order.setTel(tel);
		
		float price = c10quantity * C10_PRICE + c50quantity * C50_PRICE + c100quantity * C100_PRICE;
		
		order.setTotal((float)Math.round(price*100)/100);
		order.setEmail(email);
		order.setConsignee(consignee);
		
		orderService.addOrder(order);
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		if(c10quantity>0)
		{
			OrderDetail orderDetial = new OrderDetail();
			orderDetial.setOrderId(orderId);
			orderDetial.setProductName("c10");
			orderDetial.setProductImage("img/product/c10s.png");
			orderDetial.setQuantity(c10quantity);
			price = c10quantity * C10_PRICE;
			orderDetial.setPrice((float)Math.round(price*100)/100);
			orderService.addOrderDetail(orderDetial);
			orderDetails.add(orderDetial);
		}
		
		if(c50quantity>0)
		{
			OrderDetail orderDetial = new OrderDetail();
			orderDetial.setOrderId(orderId);
			orderDetial.setProductName("c50");
			orderDetial.setProductImage("img/product/c50s.png");
			orderDetial.setQuantity(c50quantity);
			price = c50quantity * C50_PRICE;
			orderDetial.setPrice((float)Math.round(price*100)/100);
			orderService.addOrderDetail(orderDetial);
			orderDetails.add(orderDetial);
		}
		
		if(c100quantity>0)
		{
			OrderDetail orderDetial = new OrderDetail();
			orderDetial.setOrderId(orderId);
			orderDetial.setProductName("c100");
			orderDetial.setProductImage("img/product/c100s.png");
			orderDetial.setQuantity(c100quantity);
			price = c100quantity * C100_PRICE;
			orderDetial.setPrice((float)Math.round(price*100)/100);
			orderService.addOrderDetail(orderDetial);
			orderDetails.add(orderDetial);
		}
		
		orderService.emailOrderToAdmin(order, orderDetails);
		
		return "success";
	}
	
	
	
	
	
	
}
