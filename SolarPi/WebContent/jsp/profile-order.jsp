<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <jsp:include page="header.jsp"/>
</head>
<body style="background-color: #eceff1 ">
	<jsp:include page="profile-nav.jsp"/>
	
	<div class="col-sm-9 col-md-10 profile-content">
		<div id="account-info">
	  		<span>
	  			<label>${sessionScope.email}</label>
	  			|
	  			<a href="user/signout?page=index.htm"><spring:message code="signout"/></a>
	  		</span>
		</div>

		<c:forEach items="${orders}" var="order" varStatus="status">  
			<div class="row order-row">
				<div class="col-xs-1 text-center index">
					${(curPage -1) * pageSize + status.index + 1}
				</div>
				<div class="col-xs-11">
					<div class="col-md-2  text-left date">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${order.date}" />
					</div>
					<div class="col-md-6">
						<img src ="img/user.png">
						<img src ="img/user.png">
						<img src ="img/user.png">
					</div>
					<div class="col-md-4  text-right total">
						$${order.total}
					</div>
				</div>
			</div>
		</c:forEach> 
		<div class="text-right">
			<ul id="pagination"></ul>
		</div>
	</div>
		
	<script src="js/bootstrap-paginator.min.js"></script>
    <script type='text/javascript'>
	    $(document).ready(function(){
	    	var baseUrl = "${pageContext.request.contextPath}"
	        var options = null;
		           // pageUrl: function(type, page, current){
//	 	                return baseUrl+"/servicecenter/productcenter/search?key="+$("#key").val() + "&manufacturer=" + $("#manufacturer-selection").text() + "&page=" + page;
//	 	            }
	    	
	    	// media query event handler
	    	if (matchMedia) {
				var mq = window.matchMedia("(min-width: 500px)");
				mq.addListener(WidthChange);
				WidthChange(mq);
	    	}
   	    	// media query change
	    	function WidthChange(mq) {
	    	  if (mq.matches) {
	    	    // window width is at least 500px
	    	     options = {
	        		bootstrapMajorVersion:3,
	        		currentPage: "${curPage}",
		            totalPages: "${totalPage}",
		            shouldShowPage:function(type, page, current){
		                switch(type)
		                {
		                    default:
		                        return true;
		                }
	            	},
	            	pageUrl: function(type, page, current){
		                return "order/list/" + page;
		            }
	    	    }
	    	  } else {
	    	    // window width is less than 500px
		    	    options = {
		        		bootstrapMajorVersion:3,
		        		currentPage: "${curPage}",
			            totalPages: "${totalPage}",
			            shouldShowPage:function(type, page, current){
			                switch(type)
			                {
			                	case "page":
			                		return false;
		// 	                    case "first":
		// 	                    	return false;
		// 	                    case "last":
		// 	                        return false;
			                    default:
			                        return true;
			                }
		            	},
		            	pageUrl: function(type, page, current){
			                return "order/list/" + page;
			            }
	    	    	}
	    	  }
	    	  $('#pagination').bootstrapPaginator(options);
	    	}
	    })
	    </script>
	    
</body>
</html>