<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Vakpom</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ourstyle.css" />
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  
<style>
  .ui-autocomplete-category {
    font-weight: bold;
    padding: .2em .4em;
    margin: .8em 0 .2em;
    line-height: 1.5;
  }
  </style>

<script type="application/javascript">

$(document).ready(function() {
	$('#searchField').click(function(){
	$(this).val('');
})
 
});
</script>

  <script>
  $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _renderMenu: function( ul, items ) {
      var that = this,
        currentCategory = "";
      $.each( items, function( index, item ) {
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        that._renderItemData( ul, item );
      });
    }
  });
  </script>
  <script>
  $(function() {
    var data = [
      { label: "Uno", category: "School" },
      { label: "Unl", category: "School" },
      { label: "Hokuto", category: "School" },
      { label: "Esgis", category: "School" },
      { label: "alocodrome", category: "Restaurant" }
    ];
 
    $( "#search" ).catcomplete({
      delay: 0,
      source: data
    });
  });
  </script>

</head>


<body>
<div id="wrapper">
<div id="header">
<div id="menuCont">
<ul id="menu">
<li><a href="<c:url value="/"/>">Home</a></li>
<li><a href="#">About Us</a></li>
<li><a href="<c:url value="/businesses"/>">Business</a></li>
<li><a href="">Your account</a></li>
</ul>
</div>

<div id="loginAndSearch">
<ul id="login">
<li><a href="<c:url value="/login"/>">Login</a></li>
<li><a href="<c:url value="/create_account"/>">Sign-Up</a></li>
</ul>

<form name="searchtab" action="#" method="post">
<label for="search">Search: </label>
<input id="search">

    <input type="button" id="searchButton" value="Go" />
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