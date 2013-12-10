<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Vakpom</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ourstyle.css" />
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="application/javascript">

$(document).ready(function() {
	$('#searchField').click(function(){
	$(this).val('');
})


	
	
    
});


  </script>



</head>


<body>
<div id="wrapper">
<div id="header">
<div id="menuCont">
<ul id="menu">
<li><a href="#">Home</a></li>
<li><a href="#">About Us</a></li>
<li><a href="#">Business</a></li>
<li><a href="">Your account</a></li>
</ul>
</div>

<div id="loginAndSearch">
<ul id="login">
<li><a href="<c:url value="/login"/>">Login</a></li>
<li><a href="<c:url value="/create_account"/>">Sign-Up</a></li>
</ul>

<form name="searchtab" action="#" method="post">
    <input type="text" value="Business search" id="searchField" />
    <input type="button" id="search" value="Go" />
</form>
</div>
<div id="title">
<h2>Vakpom, Businesses that matters!</h2>
</div>

	
    
</div> 
<div id="content"> 	
	<p>This site is under construction but follow the links below for a
		preview</p>
	
	<ul id="selectable">
		<li id="businesses" value="businesses"><a  href="<c:url value="/businesses"/>" >Create a
			Business</a></li>
		<li id="businesses"><a href="<c:url value="/businesses"/>">Search
			for Businesses</a></li>
		<li id="users"><a href="<c:url value="/users"/>">Create an User </a></li>
		<li id="users"><a href="<c:url value="/users"/>">View Users </a></li>
	</ul>
    </div>
	
  </div>
  
</body>
</html>