<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>SolarPi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Loading Flat UI -->
    <link href="css/flat-ui.css" rel="stylesheet">
	<link rel="shortcut icon" href="img/favicon.ico">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--     <![if lt IE 9]> -->
<!--       <script src="js/html5shiv.js"></script> -->
<!--       <script src="js/respond.min.js"></script> -->
<!--     <![endif]> -->
  </head>

  <body>
    <div class="container">
	    <span style="float: right">
		    <a href="?lang=en">English</a> 
		    | 
		    <a href="?lang=cn">中文</a>
		</span>
		<h3><spring:message code="username"/></h3>
		<h3><spring:message code="password"/></h3>  
    </div>

    <!-- jQuery (necessary for Flat UI's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <script src="js/flat-ui.js"></script>

	<script src="js/application.js"></script>
  </body>
</html>
