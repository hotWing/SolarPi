<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
	<head>
	    <jsp:include page="header.jsp"/>
	</head>
	<body id="index">
	  <div id="intro">
	  	<div id="account-info">
		  	<c:choose>
			  	<c:when test="${not empty sessionScope.email}">
			  		<span>
			  			<label>${sessionScope.email}</label>
			  			|
			  			<c:choose>
				  			<c:when test="${sessionScope.email=='admin@solarpi'}">
				  				<a href="admin/passwordForm"><spring:message code="manage"/></a>
				  			</c:when>
				  			<c:otherwise>
				  				<a href="user/profile"><spring:message code="setting"/></a>
				  			</c:otherwise>
			  			</c:choose>
			  			|
			  			<a href="user/signout?page=index.htm"><spring:message code="signout"/></a>
			  		</span>
			  	</c:when>
			  	<c:otherwise>
				    <span>
				  		<a href="user/regform"><spring:message code="signup"/></a>
				  		|
				  		<a href="user/signinform"><spring:message code="signin"/></a>
				  	</span>
			  	</c:otherwise>
			</c:choose>
	  	</div>
		<div id="top-info" class="row">
			<div class="col-sm-6 text-center col-no-padding">
				<img src="img/c100da.png" width="100%" style="max-width:561px">
			</div>
			<div class="col-sm-6 info">
				<img src="img/text-logo.png">
				<h3><spring:message code="index.slogn"/></h3>
				<p><spring:message code="index.intro"/></p>
				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#buyModal">
					<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
					<spring:message code="index.buy"/>
				</button>
			</div>
		</div>
	  </div>
	  <div id = "product-warpper">
	  	<p class="section-title text-center"><spring:message code="index.productIntro"/></p>
	  	<div class="product-info row">
	  		<div class="col-sm-12 col-md-6">
	  			<img src="img/product/c10.png">
	  		</div>
	  		<div class="col-sm-12 col-md-6 info-warpper">
  				<p class="name"><spring:message code="index.product.c10"/></p>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.Capacity"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.Capacity.c10"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.OutputVoltage"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.OutputVoltage.c10"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.Accessories"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.Accessories.c10.1"/></p>
						<p class="info"><spring:message code="index.Accessories.c10.2"/></p>
						<p class="info"><spring:message code="index.Accessories.c10.3"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-xs-4 col-md-3">
						<p class="price text-center">
							<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
							99
						</p>
			  		</div>
					<div class="col-xs-8 col-md-9 text-right">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#c10Modal">
							<spring:message code="index.more"/>
						</button>
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#buyModal">
							<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
							<spring:message code="index.buy"/>
						</button>
			  		</div>
				</div>
	  		</div>
	  	</div>
	  	
	  	
	  	<div class="product-info row">
	  		<div class="col-sm-12 col-md-6">
	  			<img src="img/product/c50.png">
	  		</div>
	  		<div class="col-sm-12 col-md-6 info-warpper">
  				<p class="name"><spring:message code="index.product.c50"/></p>
				<div class="row">
					<div class="col-sm-4 col-md-3 ">
						<p class="info"><spring:message code="index.Capacity"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.Capacity.c50"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.OutputVoltage"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.OutputVoltage.c50"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.Accessories"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.Accessories.c50.1"/></p>
						<p class="info"><spring:message code="index.Accessories.c50.2"/></p>
						<p class="info"><spring:message code="index.Accessories.c50.3"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-xs-4 col-md-3">
						<p class="price text-center">
							<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
							999
						</p>
			  		</div>
					<div class="col-xs-8 col-md-9 text-right">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#c50Modal">
							<spring:message code="index.more"/>
						</button>
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#buyModal">
							<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
							<spring:message code="index.buy"/>
						</button>
			  		</div>
				</div>
	  		</div>
	  	</div>
	  	<div class="product-info row">
	  		<div class="col-sm-12 col-md-6">
	  			<img src="img/product/c100.png">
	  		</div>
	  		<div class="col-sm-12 col-md-6 info-warpper">
  				  				<p class="name"><spring:message code="index.product.c100"/></p>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.Capacity"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.Capacity.c100"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.OutputVoltage"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.OutputVoltage.c100"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-3">
						<p class="info"><spring:message code="index.Accessories"/></p>
			  		</div>
					<div class="col-sm-8 col-md-9">
						<p class="info"><spring:message code="index.Accessories.c100.1"/></p>
						<p class="info"><spring:message code="index.Accessories.c100.2"/></p>
						<p class="info"><spring:message code="index.Accessories.c100.3"/></p>
			  		</div>
				</div>
				<div class="row">
					<div class="col-xs-4 col-md-3">
						<p class="price text-center">
							<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
							1999
						</p>
			  		</div>
					<div class="col-xs-8 col-md-9 text-right">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#c100Modal">
							<spring:message code="index.more"/>
						</button>
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#buyModal">
							<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
							<spring:message code="index.buy"/>
						</button>
			  		</div>
				</div>
	  		</div>
	  	</div>
	  </div>
	  <div id = "company-info">
	  	<p class="title"><spring:message code="index.company.title"/></p>
	  	<p class="intro"><spring:message code="index.company.intro"/></p>
	  </div>
	  
  	  <div id = "instruction">
	  	<p class="title"><spring:message code="index.instruction.title"/></p>
	  	<p class="intro"><spring:message code="index.instruction.intro"/></p>
	  </div>
	  
	  
	  <div id = "bottom" class="text-center">
	  	<img src="img/text-logo.png">
	  	<p style="text-align:center">LIGHT UP THE WORLD</p>
	  </div>
	</body>
	
	<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
		<spring:message code="index.pay.paying"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="confirm"/></button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="c10Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
  	  <div class="modal-header">
  	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title"><spring:message code="index.product.c10"/></h6>
      </div>
      <div class="modal-body">
          	<p class="title"><spring:message code="index.Usage.C10"/></p>
          	<img src="img/c10-more.png" width=100%;>
        </div>
      </div>
    </div>
 </div>
 
 <div class="modal fade" id="c50Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
  	  <div class="modal-header">
  	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title"><spring:message code="index.product.c50"/></h6>
      </div>
      <div class="modal-body">
          	<p class="title"><spring:message code="index.Indicator"/></p>
          	<p><spring:message code="index.Indicator.Content"/></p>
          	<p class="title"><spring:message code="index.Usage.C50"/></p>
          	<img src="img/c50-more.png" width=100%;>
        </div>
      </div>
    </div>
 </div>
 
 <div class="modal fade" id="c100Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
  	  <div class="modal-header">
  	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title"><spring:message code="index.product.c100"/></h6>
      </div>
      <div class="modal-body">
          	<p class="title"><spring:message code="index.Indicator"/></p>
          	<p><spring:message code="index.Indicator.Content"/></p>
          	<p class="title"><spring:message code="index.Usage.C100"/></p>
          	<img src="img/c100-more.png" width=100%;>
        </div>
      </div>
    </div>
 </div>
	
<div class="modal fade" data-backdrop="static" id="buyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h6 class="modal-title"><spring:message code="index.basket"/></h6>
      </div>
      <div class="modal-body">
      	<div id="pay-warning" style="display:none"><label class="error-msg"><spring:message code="index.pay.warning"/></label></div>
  		<table class="table" >
  			<thead>
  				<tr>
  					<th><spring:message code="index.basket.name"/></th>
  					<th><spring:message code="index.basket.quantity"/></th>
  					<th><spring:message code="index.basket.price"/></th>
  				</tr>
  			</thead>
			<tr>
				<td>C10</td>
				<td>
					<span id= "c10-minus" class="glyphicon glyphicon-minus quantity-control" aria-hidden="true"></span>
					&nbsp
					<span id="c10-quantity">0</span>
					&nbsp
					<span id= "c10-plus" class="glyphicon glyphicon-plus quantity-control" aria-hidden="true"></span>
				</td>
				<td class="text-right" id ="c10-subtotal">0.00</td>
			</tr>
			<tr>
				<td>C50</td>
				<td>
					<span id= "c50-minus" class="glyphicon glyphicon-minus quantity-control" aria-hidden="true"></span>
					&nbsp
					<span id="c50-quantity">0</span>
					&nbsp
					<span id= "c50-plus" class="glyphicon glyphicon-plus quantity-control" aria-hidden="true"></span>
				</td>
				<td class="text-right" id ="c50-subtotal">0.00</td>
			</tr>
			<tr>
				<td>C100</td>
				<td>
					<span id= "c100-minus" class="glyphicon glyphicon-minus quantity-control" aria-hidden="true"></span>
					&nbsp
					<span id="c100-quantity">0</span>
					&nbsp
					<span id= "c100-plus" class="glyphicon glyphicon-plus quantity-control" aria-hidden="true"></span>
				</td>
				<td class="text-right" id ="c100-subtotal">0.00</td>
			</tr>
			<tr>
				<td></td>
				<td class="text-right">
					<span class="text-primary"><spring:message code="orderDetail.total"/></span>
				</td>
				<td class="text-right" id ="total">0.00</td>
			</tr>
		</table>
       	<div class="form-group">
       		<input id="consignee"  class="form-control" placeholder="<spring:message code="orderDetail.consignee"/>"/>
       		<label id ="consignee-error" class="error-msg"><spring:message code="NotEmpty.consignee"/></label>
   		</div>
		<div class="form-group">
       		<input id="tel"  class="form-control" placeholder="<spring:message code="orderDetail.tel"/>"/>	
       		<label id ="tel-error" class="error-msg"><spring:message code="NotEmpty.tel"/></label>
   		</div>
		<div class="form-group">
       		<input id="address"  class="form-control" placeholder="<spring:message code="orderDetail.address"/>"/>
       		<label id ="address-error" class="error-msg"><spring:message code="NotEmpty.address"/></label>
   		</div>
      </div>
      <div class="modal-footer">
        <button id="confirm-buy" type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="confirm"/></button>
         <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="cancel"/></button>
      </div>
    </div>
  </div> 
</div>
<script src="js/index.js"></script>
<script>
$('#confirm-buy').on('click', function() {
	
	refreshForm();
	var curQuantity10 = parseInt($('#c10-quantity').text());
	var curQuantity50 = parseInt( $('#c50-quantity').text());
	var curQuantity100 = parseInt( $('#c100-quantity').text());
	
	if (curQuantity10 + curQuantity50 + curQuantity100 <= 0)
	{
		$('#pay-warning').show();
		return false;
	}
	
	if ($('#consignee').val()=="" || $('#consignee').val()==null) {
		$('#consignee-error').show();
		return false;
	}
	
	if ($('#tel').val()=="" || $('#tel').val()==null) {
		$('#tel-error').show();
		return false;
	}
	
	if ($('#address').val()=="" || $('#address').val()==null) {
		$('#address-error').show();
		return false;
	}
	
	$('#buyModal').modal('hide');
	$('#payModal .modal-footer').hide();
	$('#payModal').modal('show');
	  $.ajax({
	        url: "order/buy",
	        method: "POST",
	        data: {
	        		c10quantity: curQuantity10,
	        		c50quantity: curQuantity50,
	        		c100quantity: curQuantity100,
	        		consignee: $('#consignee').val(),
	        		tel: $('#tel').val(),
	        		address: $('#address').val()
	        	  },
	        success: function(msg){
		        			if(msg == "signin")
		        				window.location.href = "user/signinform";
		        			else if (msg == "notActived")
		        				$('#payModal .modal-body').html("<spring:message code='index.pay.notActived'/>");	
		        			else if (msg == "success")
		        				$('#payModal .modal-body').html("<spring:message code='index.pay.complete'/>");	
//		        			else if (msg == "sent")
//		        				$('#emailModal .modal-body').html("<spring:message code='profile.sendValidationEmail.sent'/> ");	
//		        			else 
//		        				$('#emailModal .modal-body').html("<spring:message code='profile.sendValidationEmail.fail'/> ");		
		        			$('#payModal .modal-footer').show();
		        	},
       	error: function(XMLHttpRequest, error, errorThrown){  
	        		  alert(error);  
	        		  alert(errorThrown);  
       			},  
	  });
});

function refreshForm()  {
	$('#pay-warning').hide();
	$('#consignee-error').hide();
	$('#tel-error').hide();
	$('#address-error').hide();
}

</script>
</html>
