<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<c:url value="/businesses/create" var="addUrl"/>
<c:url value="/businesses/update" var="editUrl"/>
<c:url value="/businesses/delete" var="deleteUrl"/>
<c:url value="/businesses/records" var="recordsUrl"/>


<html>
<head>
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>'/>
<%-- 	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.9.1.min.js"/>'></script> --%>
	
	<script type='text/javascript' src='<c:url value="/resources/js/businessesCustom.js"/>'></script>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" type='text/css' href='<c:url value="/resources/css/ourstyle.css"/>'/>
	<title>Business</title>
	<script type='text/javascript'>
		
	$(function() {
               // init
               urlHolder.records = '${recordsUrl}';
               urlHolder.add = '${addUrl}';
               urlHolder.edit = '${editUrl}';
               urlHolder.del = '${deleteUrl}';
               loadTable();
               
               $('#newBtn').click(function() { 
                       toggleForms('new');
                       toggleCrudButtons('hide');
               });
               
               $('#editBtn').click(function() { 
                       if (hasSelected()) {
                               toggleForms('edit');
                               toggleCrudButtons('hide');
                               fillEditForm();
                       }
                       });
               
               $('#viewBtn').click(function() { 
                   if (hasSelected()) {
                       toggleForms('view');
                       fillViewForm();
               }
               });
               $('#reloadBtn').click(function() { 
                       loadTable();
               });
               $('#deleteBtn').click(function() {
                       if (hasSelected()) { 
                               submitDeleteRecord();
                       }
               });
               
               $('#newForm').submit(function() {
                       event.preventDefault();
                       submitNewRecord();
               });
               
               $('#editForm').submit(function() {
                       event.preventDefault();
                       submitUpdateRecord();
               });

               $('#closeNewForm').click(function() { 
                       toggleForms('hide'); 
                       toggleCrudButtons('show');
               });
               
               $('#closeEditForm').click(function() { 
                       toggleForms('hide'); 
                       toggleCrudButtons('show');
               });
               
               $('#closeViewForm').click(function() { 
                   toggleForms('hide'); 
                   toggleCrudButtons('show');
           });
       });
       </script>
	
	
  
</head>

<body id="notsdi">

<div id="menuCont">
<ul id="menu">
<li><a href="<c:url value="/"/>">Home</a></li>
<li><a href="#">About Us</a></li>
<li><a href="#">Business</a></li>
<li><a href="">Your account</a></li>
</ul>
</div>

<hr>
	<h1 id='banner'>Business Listings</h1>
	<hr/>
	
	<table id='tableBusinesses' >
               <caption></caption>
               <thead>
                       <tr >
                               <th></th>
                               <th>Name</th>
                               <th>Type</th>
                               <th>Address</th>
                               <th>City</th>
                                <th>Country</th>
                               <th>Phone Number</th>
                              
                               
                       </tr>
               </thead>
       </table>
	<div id='controlBar'>
               <input type='button' value='New' id='newBtn' />
               <input type='button' value='Delete' id='deleteBtn' />
               <input type='button' value='Edit' id='editBtn' />
               <input type='button' value='Reload' id='reloadBtn' />
                 <input type='button' value='View' id='viewBtn' />
       </div>
 
	<div id='newForm' >
		<form>
			<fieldset>
				<legend>Create New Business</legend>
				<label for='newBusinessName'>Name:</label><input type='text' id='newBusinessName'/><br />
				<label for='newDescription'>Description:</label><input type='text' id='newDescription'/><br />
				<label for='newCity'>City</label><input	type='text' id='newCity' size="20"/><br />
				<label for='newCountry'>Country</label><input type='text' id='newCountry'/><br/>
				<label for='newPhone'>Phone</label><input type='tel' id='newPhone' /><br /> 
				<label for='newType'>Type</label><input type='text' id='newType'/><br/>
				<label for='newStreetAddress'>Address</label><input type='text' id='newStreetAddress'/>
				
					
			</fieldset>
			<input type='button' value='Close' id='closeNewForm' /> <input
				type='submit' value='Submit' />
		</form>
	</div>
	
	 <div id='editForm'>
               <form>
                         <fieldset>
                               <legend>Edit Record</legend>
                           
                               <label for='editBusinessName'>Name</label><input type='text' class='editBusinessName'/><br/>
                               <label for='editDesc'>Description</label><input type='text' class='editDesc'/><br/>
                               <label for='editType'>Type</label><input type='text' class='editType'/><br/>
                               <label for='editPhone'>Type</label><input type='text' class='editPhone'/><br/>
                               <label for='editCity'>Type</label><input type='text' class='editCity'/><br/>
                               <label for='editCountry'>Type</label><input type='text' class='editCountry'/><br/>
                               <label for='editStreetAddress'>Type</label><input type='text' class='editStreetAddress'/><br/>      
                       </fieldset>
                       <input type='button' value='Close' id='closeEditForm' />
                       <input type='submit' value='Submit'/>
               </form>
       </div>
       
        <div id='viewForm'>    
               <form style="width: 100%">
                         <fieldset>
                               <legend>View Business</legend>
                               <img style="float: right; border-radius:3px;" class='imagelink' src="" width="150" height="150"/>
                               <h3 class='editBusinessName'></h3><br/>
                               <span><b>Category: </b></span> <span class='editType'></span><br/><br/>
                                 <span class='editStreetAddress'></span><span class='editCity'></span> <span class='editCountry'></span><br/><br/>
                               <p class='editDesc'></p><br/>
                              <span><b>Contact</b></span><span class='editPhone'></span><br/>
                             <br/>
                                                                                              
                       </fieldset>
                      <input type='button' value='Close' id='closeViewForm' /> 	
               </form>
       </div>
	
</body>
</html>