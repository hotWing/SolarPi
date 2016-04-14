<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${requestScope['javax.servlet.forward.request_uri']}" />
	
	    <span style="float: right">
		    <a href="${baseURL}?lang=en">English</a> 
		    | 
		    <a href="${baseURL}?lang=cn">中文</a>
		</span>