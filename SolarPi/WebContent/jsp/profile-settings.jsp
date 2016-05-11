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
<!-- 		<div class="col-sm-9"> -->
<%-- 			<h6><spring:message code="profile.edit"/></h6> --%>
<!-- 		</div> -->
		<div id="account-info">
	  		<span>
	  			<label>${sessionScope.email}</label>
	  			|
	  			<a href="user/signout?page=index.htm"><spring:message code="signout"/></a>
	  		</span>
		</div>
		<div>
	    	<c:if test="${not empty param.msg}">
	    		<div style="color:#1abc9c;font-size:30px">
		    		<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
		    		<spring:message code="${param.msg}"/>
	    		</div>
	    	</c:if>
			<form:form method="POST" commandName="user" action="user/edit">
	           	<div class="row">
		           	<div class="form-group col-sm-6">
		             	<label><spring:message code="register.country"/></label>
		             	<form:select id="select-country" data-toggle="select" class="form-control select select-default mrs mbm" path="country">
			         		<c:forEach items="${countries}" var="country" >  
								<option value="${country.name}">${country.name}</option>
							</c:forEach> 
			       		</form:select>
			       	</div>	 
		       		<div class="form-group col-sm-6">
			       		<label><spring:message code="register.city"/></label>
		             	<form:select id ="select-city" data-toggle="select" class="form-control select select-default mrs mbm" path="city">
			         		<c:forEach items="${cities}" var="city" >  
								<option value="${city.name}">${city.name}</option>
							</c:forEach> 
			       		</form:select>
	           		</div>
	           	</div>
	           	<button type="submit" class="btn btn-primary" style="width:100%"><spring:message code="save"/></button>
			</form:form>
		</div>
	</div>
	
  	<script src="js/register.js"></script>
    <script type="text/javascript">
	   	$(document).ready(function() {
	   	//用于解决手机上，下拉后弹出虚拟键盘
	   		$('.select2-container').each(function () {
	   			$(this).find('.select2-search, .select2-focusser').hide();
	   			});
	   	});
	    
		$("#select-country").select2().select2('val', "${user.country}");
		$("#select-city").select2().select2('val', "${user.city}");
    </script>
</body>
</html>