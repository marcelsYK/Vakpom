<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<c:url value="/businesses/records" var="recordsUrl"/>
<c:url value="/businesses/create" var="addUrl"/>
<c:url value="/businesses/update" var="editUrl"/>
<c:url value="/businesses/delete" var="deleteUrl"/>

<html>
<head>
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>'/>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/businessesCustom.js"/>'></script>

	<title>Business Records</title> 
	
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
			alert("INSIDE business jsp submit");
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
	});
	</script>
</head>

<body>
	<h1 id='banner'>Record System</h1>
	<hr/>
	
	<table id='tableBusinesses'>
		<caption></caption>
		<thead>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Type</th>
				<th>City</th>
				<th>Phone Number</th>
			</tr>
		</thead>
	</table>
	
	<div id='controlBar'>
		<input type='button' value='New' id='newBtn' />
		<input type='button' value='Delete' id='deleteBtn' />
		<input type='button' value='Edit' id='editBtn' />
		<input type='button' value='Reload' id='reloadBtn' />
	</div>
	
	<div id='newForm'>
		<form>
  			<fieldset>
				<legend>Create New Record</legend>
				<label for='newBusinessName'>Name</label><input type='text' id='newBusinessName'/><br/>
				<label for='newCity'>City</label><input type='text' id='newCity'/><br/>
				<label for='newPhone'>Phone</label><input type="tel" id='newPhone'/><br/>
							
				
				<label for='newType'>Type</label>
					<select id='newType'>
						<option value='1'>Automobile</option>
						<option value='2' selected='selected'>Hair Dresser</option>
					</select>
  			</fieldset>
			<input type='button' value='Close' id='closeNewForm' />
			<input type='submit' value='Submit'/>
		</form>
	</div>
	
	<div id='editForm'>
		<form>
  			<fieldset>
				<legend>Edit Record</legend>
				<input type='hidden' id='editBusinessname'/>
				<label for='editBusinessName'>Business Name</label><input type='text' id='editBusinessName'/><br/>
				<label for='editDesc'>Description</label><input type='text' id='editDesc'/><br/>
				<label for='editType'>Type</label>
					<select id='editType'>
						<option value='1'>Tailor</option>
						<option value='2' selected='selected'>Hair Dresser</option>
					</select>
			</fieldset>
			<input type='button' value='Close' id='closeEditForm' />
			<input type='submit' value='Submit'/>
		</form>
	</div>
	
</body>
</html>
