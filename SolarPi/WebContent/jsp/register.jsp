<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <jsp:include page="header.jsp"/>
  </head>
  <body class="green-bg">
    <div class="container">
<%-- 		<jsp:include page="i18n.jsp"/> --%>
		
		<div id="register"  class="row">
  			<div class="col-sm-3 text-center">
  				<img id="reg-img" src="img/user.png">
  				<h3><spring:message code="register.title"/></h3>
  			</div>
  			<div class="col-sm-8">
  				<div id="reg-form">
  					<form:form method="POST" commandName="user" action="user/signup">
			 			<div class="form-group">
			             	<label><spring:message code="register.email"/></label>
			    	 		<spring:message code="register.email" var="email"/>
			             	<form:input path="email"  class="form-control" placeholder="${email}"/>
							<form:errors path="email" />
			           	</div>
						
			 			<div class="form-group">
			             	<label><spring:message code="register.password"/></label>
			    	 		<spring:message code="register.password" var="password"/>
			             	<form:input path="password"  class="form-control" placeholder="${password}"/>
							<form:errors path="password"/>
			           	</div>
			           	
			           	<div class="form-group">
			             	<label><spring:message code="register.confirmPassword"/></label>
			    	 		<spring:message code="register.confirmPassword" var="confirmPassword"/>
			             	<form:input path="confirmPassword"  class="form-control" placeholder="${confirmPassword}"/>
							<form:errors path="confirmPassword"/>
			           	</div>
			           	<div class="row">
				           	<div class="form-group col-sm-6">
				             	<label><spring:message code="register.country"/></label>
				             	<form:select id="select-country" data-toggle="select" class="form-control select select-default mrs mbm" path="country">
					         		<c:forEach items="${countries}" var="country" >  
										<option value="${country.code}:${country.name}">${country.name}</option>
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
			           	
			           	<button type="submit" class="btn btn-primary"><spring:message code="register.submit"/></button>
					</form:form>
  				</div>
				
  			</div>
		</div>
  	</div>
  	
    <script src="js/register.js"></script>
  	    
  </body>
</html>
