<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
  				<h3><spring:message code="register.title"/></h3>
  			</div>
  			<div class="col-sm-6">
  				<div id="reg-form">
					<label id="reg-result"><spring:message code="${msg}"/></label>
					<br>
					<div class="text-center">
						<a href="index.html" class="btn btn-primary"><spring:message code="toIndex"/></a>
					</div>
  				</div>
  			</div>
		</div>
  	</div>
</html>
