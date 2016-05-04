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
	      <li><a href="#"><spring:message code="profile.orderList"/></a></li>
	    </ul>
	  </div><!-- /.navbar-collapse -->
	</nav>
	
    <script type="text/javascript">
    	$("${activeTab}").addClass("active");
    </script>
    
   </div>