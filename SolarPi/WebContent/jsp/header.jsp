    <%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="req" value="${pageContext.request}" />
	<c:set var="url">${req.requestURL}</c:set>
	<c:set var="uri" value="${req.requestURI}" />

    <meta charset="utf-8">
    <title>SolarPi</title>
   	<base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Loading Flat UI -->
    <link href="css/flat-ui.css" rel="stylesheet">
	<link rel="shortcut icon" href="img/favicon.ico">
	
    <script src="js/jquery.min.js"></script>
    <script src="js/flat-ui.js"></script>
	<script src="js/application.js"></script>

	
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <![if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]>
 