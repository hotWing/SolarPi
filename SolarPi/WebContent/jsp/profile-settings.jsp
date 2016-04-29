<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <jsp:include page="header.jsp"/>
</head>
<body style="background-color: #eceff1">
	<div class="row">
		<div class="col-sm-3 col-md-2">
		    <jsp:include page="profile-nav.jsp"/>
		</div>
		<div class="col-sm-9 col-md-10 profile-content">
			<div id="account-info">
		  		<span>
		  			<label>${sessionScope.email}</label>
		  			|
		  			<a href="user/signout?page=index.htm"><spring:message code="signout"/></a>
		  		</span>
			</div>
			<div >
				<!-- Nav tabs -->
		       	<ul class="nav nav-tabs" role="tablist"> 
				    <li role="presentation" class="active"><a href="#edit" aria-controls="home" role="tab" data-toggle="tab"><spring:message code="profile.settings.edit"/></a></li>
				    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><spring:message code="profile.settings.editPassword"/></a></li>
			  	</ul>
		       	<!-- Tab panes -->
			  	<div class="tab-content">
<!-- 			  		个人信息tab -->
				    <div role="tabpanel" class="tab-pane active" id="edit">
				    	<c:if test="${not empty param.msg}">
				    		<div style="color:#1abc9c;font-size:30px">
					    		<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					    		<spring:message code="${param.msg}"/>
				    		</div>
				    	</c:if>
<%-- 	    				<form:form method="POST" commandName="user" action="user/edit"> --%>
<!-- 				           	<div class="row"> -->
<!-- 					           	<div class="form-group col-sm-6"> -->
<%-- 					             	<label><spring:message code="register.country"/></label> --%>
<%-- 					             	<form:select id="select-country" data-toggle="select" class="form-control select select-default mrs mbm" path="country"> --%>
<%-- 						         		<c:forEach items="${countries}" var="country" >   --%>
<%-- 											<option value="${country.name}">${country.name}</option> --%>
<%-- 										</c:forEach>  --%>
<%-- 						       		</form:select> --%>
<!-- 						       	</div>	  -->
								  	
<!-- 					       		<div class="form-group col-sm-6"> -->
<%-- 						       		<label><spring:message code="register.city"/></label> --%>
<%-- 					             	<form:select id ="select-city" data-toggle="select" class="form-control select select-default mrs mbm" path="city"> --%>
<%-- 						         		<c:forEach items="${cities}" var="city" >   --%>
<%-- 											<option value="${city.name}">${city.name}</option> --%>
<%-- 										</c:forEach>  --%>
<%-- 						       		</form:select> --%>
<!-- 				           		</div> -->
<!-- 				           	</div> -->
<%-- 				           	<button type="submit" class="btn btn-primary" style="width:100%"><spring:message code="save"/></button> --%>
<%-- 						</form:form> --%>
					</div>
<!-- 					密码tab -->
				    <div role="tabpanel" class="tab-pane" id="profile">
				    
<!--    				    		<div class="form-group"> -->
<%-- 				             	<label><spring:message code="profile.oldPassword"/></label> --%>
<%-- 				    	 		<spring:message code="profile.oldPassword" var="oldPassword"/> --%>
<%-- 				             	<input name="oldPassword" type="password" class="form-control" placeholder="${oldPassword}"/> --%>
<!-- 				           	</div> -->
				           	
	  					<form:form method="POST" commandName="user" action="user/signin">
 						
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
					</div>
			  	</div>
			</div>
		</div>
	</div>
	
  	<script src="js/register.js"></script>
    <script type="text/javascript">
    	var country = "${countrySelection}"
    	if (country)
   		{
			$("#select-country").select2().select2('val', country);
			$("#select-city").select2().select2('val', "${user.city}");
   		}
    </script>
    
    
</body>
</html>