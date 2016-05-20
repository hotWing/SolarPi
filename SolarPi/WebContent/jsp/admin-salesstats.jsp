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
		<jsp:include page="admin-nav.jsp"/>
		
		<div class="col-sm-9 col-md-10 profile-content">
			<div id="account-info">
		  		<span>
		  			<label>${sessionScope.email}</label>
		  			|
		  			<a href="user/signout?page=index.htm"><spring:message code="signout"/></a>
		  		</span>
			</div>
			<div class="profile-wrapper">
			
				<div>
			    	<c:if test="${not empty msg}">
			    		<div style="color:#1abc9c;font-size:30px">
				    		<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
				    		<spring:message code="${msg}"/>
			    		</div>
			    	</c:if>
			    	<div class = "row">
			    		<div class="col-sm-12 col-md-6">
			    			<canvas id="pie-chart" height="250px"></canvas>
			    		</div>
			    		<div class="col-sm-12 col-md-6 text-center" >
			    			<canvas id="bar-chart" height="250px"></canvas>
			    			<button id="reset-btn" type="button" class="btn btn-primary"><spring:message code="reset"/></button>
			    		</div>
			    		
					</div>
				</div>
			</div>
		</div>
<!-- 	</div> -->
</body>
<script src="js/Chart.js"></script>
<script src="js/salesStats.js"></script>
</html>