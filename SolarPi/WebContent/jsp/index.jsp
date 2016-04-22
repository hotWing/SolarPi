<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
	<head>
	    <jsp:include page="header.jsp"/>
	</head>
	<body>
	  <div class="container">
	  	<h1>这是首页</h1>
	  	<c:choose>
		  	<c:when test="${not empty sessionScope.email}">
		  		<span>
		  			<label>${sessionScope.email}</label>
		  			|
		  			<a href="user/signout?page=index.htm">退出</a>
		  		</span>
		     		
		  	</c:when>
		  	<c:otherwise>
			    <span>
			  		<a href="user/regform">注册</a>
			  		|
			  		<a href="user/signinform">登录</a>
			  	</span>
		  	</c:otherwise>
		</c:choose>


	 
<%-- 		             		<label class="error-msg"><spring:message code="${errormsg}"/></label> --%>
	  	
	  </div>
	</body>
</html>
