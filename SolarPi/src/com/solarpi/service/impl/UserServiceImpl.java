package com.solarpi.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
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

import com.solarpi.dao.UserDao;
import com.solarpi.model.User;
import com.solarpi.service.UserService;
import com.solarpi.util.MD5Util;
import com.solarpi.util.Status;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public void addUser(User user) {
		userDao.add(user);
	}

	@Override
	public void sendActivationEmail(User user) {
		// Recipient's email ID needs to be mentioned.
	      String to = user.getEmail();

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
	      try{
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));

	         // Set Subject: header field
	         //message.setSubject("太阳派");
	         message.setSubject("Solarpi");

	         // Create the message part 
	         BodyPart messageBodyPart = new MimeBodyPart();

	         ///邮件的内容  
	         //StringBuffer bodySb=new StringBuffer("点击下面链接激活账号，请于48小时之内激活！\n");  
	         StringBuffer bodySb=new StringBuffer("Click the link below to active your email. The link expires in 48 hours!\n");  
	         bodySb.append("http://192.168.12.244:8080/SolarPi/user/active?email=");   
	         bodySb.append(to);  
	         bodySb.append("&validateCode=");  
	         bodySb.append(user.getValidateCode());  
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
	         
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	}

	@Override
	public String activeUser(String email, String validateCode) {
		User user = userDao.getUser(email);
		if (user != null){
			if(user.getIsActived() == 0){
				Date currentTime = new Date();
				if(currentTime.before(user.getActiveTime())){
					if(validateCode.equals(user.getValidateCode())){
						user.setIsActived(1);
						userDao.update(user);
						return "activation.success"; //"您已成功激活账号"
					}
					else 
						return "activation.error.invalidCode"; //激活码不正确！
				}
				else
					return "activation.error.expired";//激活码已过期！
			}
			else 
				return "activation.error.alreadyActived";//该邮箱已经激活！
		}
		else 
			return "activation.error.invalidEmail";//该邮箱未注册！
	}

	@Override
	public Boolean validate(User user) {
		User userDB = userDao.getUser(user.getEmail());
		if (userDB == null)
			return false;

		String passwordInput = MD5Util.toMD5(user.getPassword());
		if(!userDB.getPassword().equals(passwordInput))
			return false;
		
		return true;
	}

	@Override
	public User getUserInfo(String email) {
		User user = userDao.getUser(email);
		return user;
	}

	@Override
	public void edit(String email, String country, String city) {
		User user = userDao.getUser(email);
		user.setCountry(country);
		user.setCity(city);
		userDao.update(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.update(user);
	}

	@Override
	public String reSendEmail(String email) {
		try {
			User user = userDao.getUser(email);
			
			if(user.getIsActived() == 1)//已经激活过了
				return "actived";
			
			Date currentTime = new Date();
			if(currentTime.before(user.getActiveTime()))//上次发送的激活码还没过期
				return "sent";
			
			Calendar cl = Calendar.getInstance();  
			user.setValidateCode(MD5Util.toMD5(user.getEmail()+cl.getTime().toString()));
			
	        cl.add(Calendar.DATE , 2); 
			user.setActiveTime(cl.getTime());
			
			userDao.update(user);
			sendActivationEmail(user);
			return "success";
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@Override
	public String forgotPasswordEmail(String email) {
		User user = userDao.getUser(email);
		if (user == null) 
			return "invalidEmail";
		
		// Recipient's email ID needs to be mentioned.
	      String to = user.getEmail();

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
	      try{
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));

	         // Set Subject: header field
	         //message.setSubject("太阳派");
	         message.setSubject("Solarpi");
	         
	         // Create the message part 
	         BodyPart messageBodyPart = new MimeBodyPart();

	         ///邮件的内容  
	         //StringBuffer bodySb=new StringBuffer("请点击下面的链接重设密码，48小时内有效！\n");  
	         StringBuffer bodySb=new StringBuffer("Click the link below to reset your password. The link expires in 48 hours!\n");  

	         bodySb.append("http://192.168.12.244:8080/SolarPi/user/resetPasswordForm?email=");   
	         bodySb.append(to);  
	         bodySb.append("&resetCode=");  
         	 Calendar cl = Calendar.getInstance();  
			 user.setPasswordResetCode(MD5Util.toMD5(user.getEmail()+cl.getTime().toString()));
			 cl.add(Calendar.DATE , 2); 
			 user.setPasswordResetTime(cl.getTime());
			 user.setPasswordReset(0);
	         userDao.update(user);
	         bodySb.append(user.getPasswordResetCode());  
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
	         
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
		return "success";
	}

	@Override
	public Status resetPassword(User tempUser) {
		User user = userDao.getUser(tempUser.getEmail());
		if (user == null)
			return Status.INVALID_EMAIL;
		if (user.getPasswordReset() == 1)
			return Status.EXPIRED;
		Date currentTime = new Date();
		if(currentTime.before(user.getPasswordResetTime())){
			if(tempUser.getPasswordResetCode().equals(user.getPasswordResetCode())){
				user.setPassword(MD5Util.toMD5(tempUser.getPassword()));
				user.setPasswordReset(1);
				userDao.update(user);
				return Status.SUCCESS;
			}
			else
				return Status.INVALID_CODE;
		}
		else 
			return Status.EXPIRED;
	}

	@Override
	public Boolean getIsActived(String email) {
		int i = userDao.getIsActived(email);
		return i == 1;
	}
}
