package com.solarpi.service;

import java.util.List;

import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;

public interface OrderService {
	public List<Order> getOrders(int page, String email);
	public int countOrders(String email);
	public Order getOrder(String orderId);
	public List<OrderDetail> getOrderDetail(String orderId);
	public void addOrder(Order order);
	public void addOrderDetail(OrderDetail orderDetial);
}
