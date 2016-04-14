<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
  <head>
    <jsp:include page="header.jsp"/>
  </head>
  <body>
    <div class="container">
		<jsp:include page="i18n.jsp"/>
		<form:form method="POST" commandName="user" action="user/register">
 			<legend><spring:message code="register.title"/></legend>
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
				<form:errors path="password" />
           	</div>
           <button type="submit" class="btn btn-default">Submit</button>
		</form:form>
  	</div>
  </body>
</html>
