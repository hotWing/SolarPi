package com.solarpi.dao;

import java.util.List;

import com.solarpi.model.CountryStats;
import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
import com.solarpi.model.ProductStats;

public interface OrderDao {
	public List<Order> getOrders(int startRow, int pAGE_SIZE, String email);

	public int countOrders(String email);

	public Order getOrder(String orderId);

	public List<OrderDetail> getOrderDetail(String orderId);

	public void add(Order order);

	public void addOrderDetail(OrderDetail orderDetial);

	public List<CountryStats> getTopSalesCountry(String productName, int topNum);
	
	public List<ProductStats> getProductSales();
}
