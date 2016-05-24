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
  				<h3><spring:message code="signin.forgotPassword"/></h3>
  			</div>
  			<div class="col-sm-6">
  				<div id="reg-form">
  					<form:form method="POST" commandName="user" action="user/resetPassword">
  						<form:input path="email"  type="text" class="form-control" style="display:none"/>
  						<form:input path="passwordResetCode"  type="text" class="form-control" style="display:none"/>
  						
			 			<div class="form-group">
			             	<label><spring:message code="profile.newPassword"/></label>
			    	 		<spring:message code="profile.newPassword" var="newPassword"/>
			             	<form:input path="password"  type="password" class="form-control" placeholder="${newPassword}"/>
							<form:errors class="error-msg" path="password" />
			           	</div>
						
			 			<div class="form-group">
			             	<label><spring:message code="profile.confirmNewPassword"/></label>
			    	 		<spring:message code="profile.confirmNewPassword" var="confirmNewPassword"/>
			             	<form:input path="confirmPassword" type="password" class="form-control" placeholder="${confirmNewPassword}"/>
							<form:errors class="error-msg" path="confirmPassword" />
			           	</div>
					
    					<button id="submit" class="btn btn-primary" style="width:100%"><spring:message code="save"/></button>
					</form:form>
					<div class="text-right">
							<a href="index.htm"><spring:message code="toIndex"/></a>
						</div>
  				</div>
  			</div>
		</div>
  	</div>
  </body>
</html>
