<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="us">
<head>
<title>Vakpom</title>
 
<link href="resources/css/sunny/jquery-ui-1.10.3.custom.css" rel="stylesheet">
	
	<script src="resources/js/jquery-ui-1.10.3.custom.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<style>
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #FECA40; }
  #selectable .ui-selected { background: #F39814; color: white; }
  #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  </style>
  <script>
  
  var actionForm;
  $(function() {
    $( "#selectable" ).selectable();
    alert("You click me!");
  });
  
  //Will work on this part
  
 /* $("#businesses").click(function submitForm(elementId)
  {
	 
	  alert("You elementId me:" + elementId);
	  actionForm = '/' + elementId;
	  document.indexForm.action="/businesses";
     $("#indexForm").submit();
     return true;
  });*/
  
   
  </script>
</head>


<body>
	<h2>Vakpom, Businesses that matters!</h2>
	<form name="indexForm" method="POST"  id="indexForm">
	
	<p>This site is under construction but follow the links below for a
		preview
	<p>
	<ul id="selectable">
		<li  class="ui-widget-content" id="businesses" value="businesses"><a  href="<c:url value="/businesses"/>" >Create a
			Business</a></li>
		<li class="ui-widget-content" id="businesses"><a href="<c:url value="/businesses"/>">Search
			for Businesses</a></li>
		<li class="ui-widget-content" id="users"><a href="<c:url value="/users"/>">Create an User </a></li>
		<li class="ui-widget-content" id="users"><a href="<c:url value="/users"/>">View Users </a></li>
	</ul>
	</form>
</body>
</html>