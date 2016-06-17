package com.solarpi.service.impl;

import java.io.FileInputStream;
import java.util.List;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import com.solarpi.controller.OrderController;
import com.solarpi.dao.OrderDao;
import com.solarpi.model.CountryStats;
import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
import com.solarpi.model.ProductStats;
import com.solarpi.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private WebApplicationContext webApplicationContext;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<Order> getOrders(int page, String email) {
		int startRow = (page - 1 ) * OrderController.PAGE_SIZE;
		return orderDao.getOrders(startRow, OrderController.PAGE_SIZE, email);
	}

	@Override
	public int countOrders(String email) {
		return orderDao.countOrders(email);
	}

	@Override
	public Order getOrder(String orderId) {
		return orderDao.getOrder(orderId);
	}

	@Override
	public List<OrderDetail> getOrderDetail(String orderId) {
		return orderDao.getOrderDetail(orderId);
	}

	@Override
	public void addOrder(Order order) {
		orderDao.add(order);
	}

	@Override
	public void addOrderDetail(OrderDetail orderDetial) {
		orderDao.addOrderDetail(orderDetial);
		
	}

	@Override
	public List<CountryStats> getTopSalesCountry(String productName, int topNum) {
		return orderDao.getTopSalesCountry(productName, topNum) ;
	}

	@Override
	public List<ProductStats> getProductSales() {
		return orderDao.getProductSales();
	}

	@Override
	public void emailOrderToAdmin(Order order, List<OrderDetail> orderDetails) {
		String configPath = webApplicationContext.getServletContext().getRealPath("/WEB-INF/config.properties");
		try {
			FileInputStream fileIn = new FileInputStream(configPath);
			Properties prop = new Properties();
			prop.load(fileIn);
			fileIn.close();
			
			String to  = prop.getProperty("adminEmail");
			// Sender's email ID needs to be mentioned
			String from = "service@vbuilding.net";
			String UserPassword = "19860922qQ";
			
			// Assuming you are sending email from localhost
			String host = "smtp.exmail.qq.com";
			
			// Get system properties
			Properties properties = System.getProperties();
			
			// Setup mail server
			properties.setProperty("mail.smtp.host", host);
			  
			properties.setProperty("mail.smtp.auth", "true");
			  
			Session session = Session.getInstance(properties,
				         new javax.mail.Authenticator() {
				            protected PasswordAuthentication getPasswordAuthentication() {
				               return new PasswordAuthentication(
				            		   from, UserPassword);
				            }
				         });
		      
			// Create a default MimeMessage object.
		    MimeMessage message = new MimeMessage(session);

	        // Set From: header field of the header.
	        message.setFrom(new InternetAddress(from));

	        // Set To: header field of the header.
	        message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));

	        // Set Subject: header field
	        message.setSubject("太阳派订单");

	        // Create the message part 
	        BodyPart messageBodyPart = new MimeBodyPart();

	        //邮件的内容  
	        StringBuffer bodySb=new StringBuffer("收到新订单：\n");  
	        bodySb.append("订单号：").append(order.getId()).append("\n");   
	        bodySb.append("下单日期：").append(order.getDate()).append("\n"); 
	        bodySb.append("收货人：").append(order.getConsignee()).append("\n"); 
	        bodySb.append("联系电话：").append(order.getTel()).append("\n");
	        bodySb.append("联系邮件：").append(order.getEmail()).append("\n");
	        bodySb.append("收货地址：").append(order.getAddress()).append("\n");
	        bodySb.append("订单详情：").append("\n");
	        for (OrderDetail orderDetail : orderDetails){
	        	bodySb.append("　　").append(orderDetail.getProductName()).append("　　X").append(orderDetail.getQuantity()).append("\n");
	        }
	        bodySb.append("总计：").append(order.getTotal());
	        
	        // Fill the message
	        messageBodyPart.setText(bodySb.toString());
	         
	         // Create a multipar message
	         Multipart multipart = new MimeMultipart();

	         // Set text message part
	         multipart.addBodyPart(messageBodyPart);

	         // Send the complete message parts
	         message.setContent(multipart);
	         // Send message
	      
	         Transport.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
