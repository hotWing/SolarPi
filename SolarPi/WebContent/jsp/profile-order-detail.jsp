<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <jsp:include page="header.jsp"/>
</head>
<body style="background-color: #eceff1">
		<jsp:include page="profile-nav.jsp"/>
		
		<div class="col-sm-9 col-md-10 profile-content">
			<div id="account-info">
		  		<span>
		  			<label>${sessionScope.email}</label>
		  			|
		  			<a href="user/signout?page=index.htm"><spring:message code="signout"/></a>
		  		</span>
			</div>
			<div>
		    	${order.id}<br>
		    	<img src = "${orderDetails[0].productImage}">
		    	
			</div>
		</div>
</body>
</html>