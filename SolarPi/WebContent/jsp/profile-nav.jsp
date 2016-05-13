<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
  <div class="col-sm-3 col-md-2" style="padding-left:0px;padding-right:0px"> 
    <nav class="navbar navbar-inverse" role="navigation">
	  <!-- Brand and toggle get grouped for better mobile display -->
	  <div class="navbar-header">
	    <button type="button" class="navbar-toggle  pull-right" data-toggle="collapse" data-target=".navbar-ex1-collapse">
	      <span class="sr-only">Toggle navigation</span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	    <a class="navbar-brand"><spring:message code="profile.title"/></a>
	  </div>
	
	  <!-- Collect the nav links, forms, and other content for toggling -->
	  <div class="collapse navbar-collapse navbar-ex1-collapse">
	    <ul class="nav navbar-nav">
	      <li id = "tab-edit"><a href="user/profile"><spring:message code="profile.edit"/></a></li>
	      <li id = "tab-editPassword"><a href="user/passwordForm"><spring:message code="profile.editPassword"/></a></li>
	      <li id = "tab-order"><a href="order/list/1"><spring:message code="profile.orderList"/></a></li>
	      <li id = "tab-email"><a><spring:message code="profile.sendValidationEmail"/></a></li>
	    </ul>
	    
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="index.htm"><spring:message code="toIndex"/></a></li>
	    </ul>
	    
	  </div><!-- /.navbar-collapse -->
	</nav>
	
    <script type="text/javascript">
    	$("${activeTab}").addClass("active");
    	
    	$(document).ready(function(){
    		
    		$('#tab-email').on('click', function() {
    			

   				$('#emailModal').modal('show');

	   			  $.ajax({
	   			        url: "user/reSendEmail",
	   			        method: "POST",
	   			        data: { email: "${sessionScope.email}"},
	   			        success: function(msg){
	   			        			if(msg == "success")
	   			        				$('#emailModal .modal-body').html("<spring:message code='profile.sendValidationEmail.success'/> ");	
	   			        			else if (msg == "actived")
	   			        				$('#emailModal .modal-body').html("<spring:message code='profile.sendValidationEmail.actived'/> ");	
	   			        			else if (msg == "sent")
	   			        				$('#emailModal .modal-body').html("<spring:message code='profile.sendValidationEmail.sent'/> ");	
	   			        			else 
	   			        				$('#emailModal .modal-body').html("<spring:message code='profile.sendValidationEmail.fail'/> ");		
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
    
   </div>
   
<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body text-center">
        	<spring:message code="profile.sendValidationEmail.sending"/>
    
      </div>
      <div class="modal-footer" style = "display:none">
        <button type="button" class="btn btn-primary btn-xs" data-dismiss="modal"><spring:message code="close"/></button>
      </div>
    </div>
  </div>
</div>
