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
  			<div class="col-sm-3 text-center col-sm-offset-1">
  				<img id="reg-img" src="img/user.png">
  				<h3><spring:message code="signin.title"/></h3>
  			</div>
  			<div class="col-sm-6">
  				<div id="reg-form">
  					<form:form method="POST" commandName="user" action="user/signin">
 						<c:if test="${not empty errormsg}">
		             		<label class="error-msg"><spring:message code="${errormsg}"/></label>
	             		</c:if>
			 			<div class="form-group">
			             	<label><spring:message code="register.email"/></label>
			    	 		<spring:message code="register.email" var="email"/>
			             	<form:input path="email"  class="form-control" placeholder="${email}"/>
							<form:errors class="error-msg" path="email" />
			           	</div>
						
			 			<div class="form-group">
			             	<label><spring:message code="register.password"/></label>
			    	 		<spring:message code="register.password" var="password"/>
			             	<form:input path="password" type="password" class="form-control" placeholder="${password}"/>
							<form:errors path="password" class="error-msg"/>
			           	</div>
			           	<button type="submit" class="btn btn-primary" style="width:100%"><spring:message code="register.submit"/></button>
					</form:form>
					<div class="text-right">
						<a href="user/forgotPasswordForm"><spring:message code="signin.forgotPassword"/></a>
						|
						<a href="index.htm"><spring:message code="toIndex"/></a>
					</div>
  				</div>
  			</div>
		</div>
  	</div>
  </body>
</html>
