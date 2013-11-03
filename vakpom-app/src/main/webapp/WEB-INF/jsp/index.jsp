<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="us">
<head>
<title>Vakpom</title>
 
<link href="resources/css/sunny/jquery-ui-1.10.3.custom.css" rel="stylesheet">
	<script src="resources/js/jquery-1.9.1.js"></script>
	<script src="resources/js/jquery-ui-1.10.3.custom.js"></script>


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
  
  function submitForm(elementId)
  {
	  alert("You are here!");
	  alert("You elementId me:" + elementId);
	  actionForm = '/' + elementId;
	  document.indexForm.action="/businesses";
     $("#indexForm").submit();
     return true;
  }
  </script>
</head>


<body>
	<h2>Vakpom, Businesses that matters!</h2>
	<form name="indexForm" method="POST"  id="indexForm">
	
	<p>This site is under construction but follow the links below for a
		preview
	<p>
	<ol id="selectable">
		<li class="ui-widget-content" id="businesses" value="businesses" onClick='submitForm(this.value)'><a  href="<c:url value="/businesses"/>"></a>Create a
			Business</li>
		<li class="ui-widget-content" id="businesses"><a href="<c:url value="/businesses"/>"></a>Search
			for Businesses</li>
		<li class="ui-widget-content" id="users"><a href="<c:url value="/users"/>"> </a>Create an User</li>
		<li class="ui-widget-content" id="users"><a href="<c:url value="/users"/>"> </a>View Users</li>
	</ol>
	</form>
</body>
</html>