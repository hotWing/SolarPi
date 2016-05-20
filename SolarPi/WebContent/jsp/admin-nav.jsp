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
	    <a class="navbar-brand"><spring:message code="manage"/></a>
	  </div>
	
	  <!-- Collect the nav links, forms, and other content for toggling -->
	  <div class="collapse navbar-collapse navbar-ex1-collapse">
	    <ul class="nav navbar-nav">
	      <li id = "tab-editPassword"><a href="admin/passwordForm"><spring:message code="profile.editPassword"/></a></li>
	      <li id = "tab-salesStats"><a href="admin/salesStatsForm"><spring:message code="admin.salesStats"/></a></li>
	    </ul>
	    
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="index.htm"><spring:message code="toIndex"/></a></li>
	    </ul>
	    
	  </div><!-- /.navbar-collapse -->
	</nav>
   </div>
   
   <script type="text/javascript">
    	$("${activeTab}").addClass("active");
   	</script>
