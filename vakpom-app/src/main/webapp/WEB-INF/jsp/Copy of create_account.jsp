<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ourstyle.css" />
<title>Untitled Document</title>

<script type='text/javascript'>
	$(function() {

		urlHolder.add = '${addUrl}';
		loadTable();

		$('#newForm').submit(function() {
			event.preventDefault();
			submitNewRecord();
		});

		$('#closeNewForm').click(function() {
			toggleForms('hide');
			toggleCrudButtons('show');
		});
	});
</script>
</head>

<body> 
	<div id="wrapper">
		<div>
			<form>
				<br />
				<h3>Create your Vakpom profile</h3>
				<table>
				<tr>
						<td><label for='username'>User Name</label><input
							type='text' id='username' /><br /></td>
					</tr>
					<tr>
						<td><label for='newFirstName'>First Name</label><input
							type='text' id='newFirstName' /><br /></td>
					</tr>
					<tr>
						<td height="2px"></td>
					</tr>
					<tr>
						<td><label for='newLastName'>Last Name</label><input
							type='text' id='newLastName' /><br /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for='newEmail'>Email</label><input
							type='text' id='newEmail' /><br /></td>
					</tr>
					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for="password">Password</label> <input
							id="password" type="password" size="40" /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for="zip">Zip Code</label> <input id="zip"
							type="text" size="40" /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<tr>
						<td><label for="zip">Country</label> <input id="zip"
							type="text" size="40" /></td>
					</tr>

					<tr>
						<td height="2px"></td>
					</tr>

					<!-- <tr> -->
					<!-- <td> -->
					<!-- <label for="male">Male</label> -->

					<!-- <input id="male" type="checkbox" /> -->
					<!-- </td> -->
					<!-- <td> -->
					<!-- <label for="female">Female</label> -->

					<!-- <input id="female" type="checkbox" /> -->
					<!-- </td> -->
					<!-- </tr> -->
					<tr>
						<td height="10px"></td>
					</tr>
					<tr>
						</td>
						<td align="right"><input type="button" value="login"
							id="loginButton" /></td>

					</tr>
					</form>
				</table>
		</div>
	</div>
</body>
</html>