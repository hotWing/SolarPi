$(document).ready(function(){

	$('#tab-email').on('click', function() {
		  $.ajax({
		        url: "user/reSendEmail",
		        method: "POST",
		        data: { email: "${sessionScope.email}"},
		        success: function(msg){
		        			alert(msg);
			        	},
	        	error: function(XMLHttpRequest, error, errorThrown){  
		        		  alert(error);  
		        		  alert(errorThrown);  
	        			},  
		  });
	});
});
