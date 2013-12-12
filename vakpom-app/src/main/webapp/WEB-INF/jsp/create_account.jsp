<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:url value="/users/create" var="addUrl"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type='text/javascript' src='<c:url value="/resources/js/create_accountCustom.js"/>'></script>
<link rel="stylesheet" type='text/css' href='<c:url value="/resources/css/ourstyle.css"/>'/>
	
<title>Create User Account</title>

<script type='text/javascript'>
	$(document).ready(function() {
		urlHolder.add = '${addUrl}';

		$('#newUser').submit(function() {
			event.preventDefault();
			
			//For validation
			var username =$('#newUsername').val() ;
			var password = $('#newPassword').val() ;
			var first = $('#newFirstName').val();
			var last = $('#newLastName').val();
							
			if (username == "")
				{
				$('#newUsername').val('required');
				return false;
				}
			if (password == "")
			{
			$('#newPassword').val('required');
			return false;
			}
			
			if (first == "")
			{
			$('#newFirstName').val('required');
			return false;
			}
			
			if (last == "")
			{
			$('#newLastName').val('required');
			return false;
			}
			
			//End of form validation			
			submitNewRecord();
		});

		
	}); //end of document function
</script>
</head>

<body id="notsdi">
	<div id="wrapper">
		<div id='newUser'>
			<form>
				<br />
				<h3>Create your Vakpom profile</h3>
				<table>
					<tr>
						<td><label for='username'>User Name</label></td><td><input type='text'
							id='newUsername' /><br /></td>
					</tr>
					
					<tr>
						<td><label for="newPassword">Password</label></td><td> <input
							id="newPassword" type="password" /></td>
					</tr>
					<tr>
						<td><label for='newFirstName'>First Name</label></td><td><input
							type='text' id='newFirstName' /><br /></td>
					</tr>
					<tr>
						<td height="2px"></td>
					</tr>
					<tr>
						<td><label for='newLastName'>Last Name</label></td><td><input
							type='text' id='newLastName' /><br /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for='newEmail'>Email</label></td><td><input type='text'
							id='newEmail'  /><br /></td>
					</tr>
					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for="zip">Zip Code</label></td><td> <input id="zip"
							type="text" size="10" /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for="city">City</label></td><td> <input id="city"
							type="text"  /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for="country">Country</label></td><td> <input id="zip"
							type="text" /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td height="10px"></td>
					</tr>
					
					<tr>
						
						<td align="right"><input type='submit' value="Submit" /></td>
						<td align="right"><input type="button" value="Close"
							id="closeNewForm" /></td>
					</tr>
				</table>
			</form>		
		</div>
	</div>
</body>
</html>