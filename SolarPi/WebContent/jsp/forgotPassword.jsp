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
		 			<div class="form-group">
		             	<label><spring:message code="register.email"/></label>
		    	 		<spring:message code="register.email" var="email"/>
		             	<input id="email"  class="form-control" placeholder="${email}"/>
		           	</div>
					
		           	<button id="submit" class="btn btn-primary" style="width:100%"><spring:message code="register.submit"/></button>
					<div class="text-right">
						<a href="index.htm"><spring:message code="toIndex"/></a>
					</div>
  				</div>
  			</div>
		</div>
  	</div>
  	
  	<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body text-center">
        	<spring:message code="signin.forgotPasswordEmail.sending"/>
      </div>
      <div class="modal-footer" style = "display:none">
        <button type="button" class="btn btn-primary btn-xs" data-dismiss="modal"><spring:message code="close"/></button>
      </div>
    </div>
  </div>
</div>


  </body>
  
      <script type="text/javascript">
    	$(document).ready(function(){
    		$('#submit').on('click', function() {

   				$('#emailModal').modal('show');

	   			  $.ajax({
	   			        url: "user/forgotPasswordEmail",
	   			        method: "POST",
	   			        data: { email: $('#email').val()},
	   			        success: function(msg){
	   			        			if(msg == "invalidEmail")
	   			        				$('#emailModal .modal-body').html("<spring:message code='signin.forgotPassword.invalidEmail'/> ");	
	   			        			else 
	   			        				$('#emailModal .modal-body').html("<spring:message code='signin.forgotPasswordEmail.sent'/> ");	
	   			        			$('#emailModal .modal-footer').show();
	   				        	},
	   		        	error: function(XMLHttpRequest, error, errorThrown){  
	   			        		  alert(error);  
	   			        		  alert(errorThrown);  
	   		        			},  
	   			  });
    		});
    	});
    	
    </script>
    
</html>
