<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="profile-wrapper" style="background-color:white">
				<div class="row">
					<div class="col-lg-offset-1 col-lg-1  col-sm-2 col-xs-5">
						<p class="text-primary"><spring:message code="orderDetail.id"/></p>
					</div>
					<div class="col-xs-7 col-sm-10 text-left">
						<p>${order.id}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-offset-1 col-lg-1  col-sm-2 col-xs-5">
						<p class="text-primary"><spring:message code="orderDetail.date"/></p>
					</div>
					<div class="col-xs-7 col-sm-10 text-left">
						<p><fmt:formatDate pattern="yyyy-MM-dd" value="${order.date}"/></p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-offset-1 col-lg-1  col-sm-2 col-xs-5">
						<p class="text-primary"><spring:message code="orderDetail.consignee"/></p>
					</div>
					<div class="col-xs-7 col-sm-10 text-left">
						<p>${order.consignee}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-offset-1 col-lg-1  col-sm-2 col-xs-5">
						<p class="text-primary"><spring:message code="orderDetail.tel"/></p>
					</div>
					<div class="col-xs-7 col-sm-10 text-left">
						<p>${order.tel}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-offset-1 col-lg-1  col-sm-2">
						<p class="text-primary"><spring:message code="orderDetail.address"/></p>
					</div>
					<div class="col-sm-10 text-left">
						<p>${order.address}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-offset-1 col-lg-1  col-sm-2">
						<p class="text-primary"><spring:message code="orderDetail.detail"/></p>
					</div>
					<div class="col-sm-10">
						<c:forEach items="${orderDetails}" var="orderDetail">  
							<div class="row">
								<div class="col-xs-12 col-md-7">
									<div class="row">
										<div class="col-xs-4 col-md-3">
											<img src ="${orderDetail.productImage}">
										</div>
										<div class="col-xs-8 c1ol-md-9">
											<p>${orderDetail.productName}</p>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-md-5">
									<div class="row">
										<div class="col-xs-offset-4 col-xs-4  col-md-offset-0 col-md-4 text-right">
											<p>X ${orderDetail.quantity}</p>
										</div>
										<div class="col-xs-4 col-md-offset-2 col-md-3 text-right">
											<p>${orderDetail.price}</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach> 
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="row">
							<div class="col-sm-12 col-md-offset-7 col-md-5">
								<div class="row">
									<div class="col-xs-7 col-md-6 text-right">
										<p class="text-primary"><spring:message code="orderDetail.total"/></p>
									</div>
									<div class="col-xs-5 col-md-3 text-right">
										<p>${order.total}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>