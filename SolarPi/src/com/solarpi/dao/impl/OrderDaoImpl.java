package com.solarpi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpi.model.CountryStats;
import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
import com.solarpi.model.ProductStats;

@Repository
public class OrderDaoImpl implements com.solarpi.dao.OrderDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Order> getOrders(int startRow, int pageSize, String email) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);
		params.put("email", email);
		
		List<Order> orders = sqlSession.selectList("com.solarpi.mapper.OrderMapper.getOrders", params);
		return orders;
	}

	@Override
	public int countOrders(String email) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		
		return sqlSession.selectOne("com.solarpi.mapper.OrderMapper.countOrders",params);
	}

	@Override
	public Order getOrder(String orderId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		return sqlSession.selectOne("com.solarpi.mapper.OrderMapper.getOrder",params);
	}

	@Override
	public List<OrderDetail> getOrderDetail(String orderId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		return sqlSession.selectList("com.solarpi.mapper.OrderMapper.getOrderDetail",params);
	}

	@Override
	public void add(Order order) {
		sqlSession.insert("com.solarpi.mapper.OrderMapper.add", order);
	}

	@Override
	public void addOrderDetail(OrderDetail orderDetial) {
		sqlSession.insert("com.solarpi.mapper.OrderMapper.addOrderDetail", orderDetial);
	}

	@Override
	public List<CountryStats> getTopSalesCountry(String productName, int topNum) {
		Map<String, Object> params = new HashMap<String, Object>();
		if (!productName.equals("all"))
			params.put("productName", productName);
		params.put("topNum", topNum);
		
		List<CountryStats> res = sqlSession.selectList("com.solarpi.mapper.OrderMapper.getTopSalesCountry", params);
		return res;
	}

	@Override
	public List<ProductStats> getProductSales() {
		List<ProductStats> res = sqlSession.selectList("com.solarpi.mapper.OrderMapper.getProductSales");
		return res;
	}

}
