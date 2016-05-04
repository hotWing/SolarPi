<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <jsp:include page="header.jsp"/>
</head>
<body style="background-color: #eceff1">
<!-- 	<div class="row"> -->
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
		    	<c:if test="${not empty msg}">
		    		<div style="color:#1abc9c;font-size:30px">
			    		<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
			    		<spring:message code="${msg}"/>
		    		</div>
		    	</c:if>
		    	<div id="edit-form">
  					<form:form method="POST" commandName="user" action="user/editPassword">
	  					<div class="form-group">
			             	<label><spring:message code="profile.oldPassword"/></label>
			    	 		<spring:message code="profile.oldPassword" var="oldPassword"/>
			             	<input name="oldPassword" type="password" class="form-control" placeholder="${oldPassword}"/>
	           				<c:if test="${not empty invalidPassword}">
			             		<label class="error-msg"><spring:message code="${invalidPassword}"/></label>
		             		</c:if>
			           	</div>
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
			           	<button type="submit" class="btn btn-primary" style="width:100%"><spring:message code="save"/></button>
					</form:form>
				</div>
			</div>
		</div>
<!-- 	</div> -->
</body>
</html>