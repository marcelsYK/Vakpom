<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<c:url value="/users/create" var="addUrl" />
<c:url value="/users/update" var="editUrl" />
<c:url value="/users/delete" var="deleteUrl" />

<html>
<head>
<%-- 	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>'/> --%>
<%-- 	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.9.1.min.js"/>'></script> --%>

<script type='text/javascript'
	src='<c:url value="/resources/js/businessesCustom.js"/>'></script>
<link rel="stylesheet" type='text/css' href='<c:url value="/resources/css/ourstyle.css"/>'/>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>User Records</title>
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


<style>
.ui-autocomplete-loading {
	background: white url('images/ui-anim_basic_16x16.gif') right center
		no-repeat;
}

#city {
	width: 25em;
}
</style>
<script>
	$(function() {
		function log(message) {
			$("<div>").text(message).prependTo("#log");
			$("#log").scrollTop(0);
		}

		$("#city").autocomplete(
				{
					source : function(request, response) {
						$.ajax({
							url : "http://ws.geonames.org/searchJSON",
							dataType : "jsonp",
							data : {
								featureClass : "P",
								style : "full",
								maxRows : 12,
								name_startsWith : request.term
							},
							success : function(data) {
								response($.map(data.geonames, function(item) {
									return {
										label : item.name
												+ (item.adminName1 ? ", "
														+ item.adminName1 : "")
												+ ", " + item.countryName,
										value : item.name
									}
								}));
							}
						});
					},
					minLength : 2,
					select : function(event, ui) {
						log(ui.item ? "Selected: " + ui.item.label
								: "Nothing selected, input was " + this.value);
					},
					open : function() {
						$(this).removeClass("ui-corner-all").addClass(
								"ui-corner-top");
					},
					close : function() {
						$(this).removeClass("ui-corner-top").addClass(
								"ui-corner-all");
					}
				});
	});
</script>
</head>

<body id="notsdi">
	<h1 id='banner'>Record System</h1>
	<hr />
	<div id='newForm' class="ui-widget">
		<form>
			<fieldset>
				<legend>Create New Business</legend>
				<label for='newBusinessName'>Name</label><input type='text'
					id='newBusinessName' /><br /> <label for='newDescription'>Description</label><input
					type='text' id='newDescription' /><br /> <label for='newCity'>City</label><input
					type='text' id='city' /><br /> <label for='newCountry'>Country</label><input
					type='text' id='newCountry' /> <label for='newPhone'>Phone</label><input
					type='tel' id='newPhone' /><br /> <label for='newType'>Type</label>
				<select id='newType'>
					<option value='1'>Tailor</option>
					<option value='2' selected='selected'>Hair Dresser</option>
				</select>
			</fieldset>
			<input type='button' value='Close' id='closeNewForm' /> <input
				type='submit' value='Submit' />
		</form>
	</div>
</body>
</html>