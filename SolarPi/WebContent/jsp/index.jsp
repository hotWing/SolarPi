<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="${baseURL}css/bootstrap.min.css" %>
<html>
  

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
    <script src="../js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <script src="../js/flat-ui.js"></script>

	<script src="../js/application.js"></script>
  </body>
</html>
