<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<c:url value="/businesses/records" var="recordsUrl"/>
<c:url value="/businesses/create" var="addUrl"/>
<c:url value="/businesses/update" var="editUrl"/>
<c:url value="/businesses/delete" var="deleteUrl"/>

<html>
<head>
    <title>Register a Business</title>
    
<!-- START CSS IMPORT FROM AXURE -->
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/js/jquery-ui-themes.css" type="text/css" rel="stylesheet">
    <link href="resources/js/axure_rp_page.css" type="text/css" rel="stylesheet">
    <link href="resources/js/axurerp_pagespecificstyles.css" type="text/css" rel="stylesheet">

    <script src="resources/js/sitemap.js"></script>
    <script src="resources/js/jquery-1.7.1.min.js"></script>
    <script src="resources/js/axutils.js"></script>
    <script src="resources/js/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/js/axurerp_beforepagescript.js"></script>
    <script src="resources/js/messagecenter.js"></script>
<script src='/resources/js/data.js'></script>

<!-- END CSS IMPORT FROM AXURE -->




	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>'/>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/businessesCustom.js"/>'></script>

	
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
	
	<!-- START CUSTOMIZATION -->
	
	
	
<div id="main_container">

<div id="u0" class="u0"  >
<div id="u0_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">Country</span></p></div>
</div>
<SELECT id="u1" class="u1"   >
<OPTION  value="China">China</OPTION>
<OPTION selected value="Cote D'Ivoire">Cote D'Ivoire</OPTION>
<OPTION  value="Togo">Togo</OPTION>
<OPTION  value="United States">United States</OPTION>
</SELECT>
<div id="u2" class="u2" >
<DIV id="u2_line" class="u2_line" ></DIV>
</div>
<div id="u3" class="u3"  >
<div id="u3_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:16px;font-weight:bold;font-style:normal;text-decoration:none;color:#6699FF;">Add a Bussiness</span></p></div>
</div>
<IFRAME id="u4" style="position:absolute; left:520px; top:77px; width:231px; height:232px; ; ; ;;" basesrc="https://maps.google.com/maps?q=africa+map&amp;ie=UTF8&amp;hq=&amp;hnear=Africa&amp;gl=us&amp;t=m&amp;ll=7.384258,-5.185547&amp;spn=6.533644,6.591797&amp;z=6&amp;output=embed" frameborder="1" scrolling="auto" ></IFRAME>



<div id="u5" class="u5"  >
<div id="u5_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">Bussiness Name </span></p></div>
</div>
<INPUT id="newBusinessname" type=text value="" class="u6"     >

<div id="u7" class="u7"  >
<div id="u7_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:8px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">e.g. Chris' Sushi Place </span></p></div>
</div>
<div id="u8" class="u8"  >
<div id="u8_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">Address</span></p></div>
</div>
<INPUT id="newStreetAddress" type=text value="" class="u9"     >

<div id="u10" class="u10"  >
<div id="u10_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:8px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">e.g. 123 Main Street</span></p></div>
</div>
	
	



<div id="u14" class="u14"  >
<div id="u14_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:8px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">e.g. Omaha, NE&nbsp; 68127</span></p></div>
</div>
<INPUT id="u15" type=text value="" class="u15"     >

<div id="u16" class="u16"  >
<div id="u16_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">Phone Number</span></p></div>
</div>
<div id="u17" class="u17"  >
<div id="u17_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:8px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">e.g. (402) 555-5555</span></p></div>
</div>
<INPUT id="newPhone" type=text value="" class="u18"     >

<div id="u19" class="u19"  >
<div id="u19_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">Website Address</span></p></div>
</div>
<div id="u20" class="u20"  >
<div id="u20_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:8px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">e.g. www.vakpom.com</span></p></div>
</div>
<div id="u21" class="u21"  >
<div id="u21_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">Categories</span></p></div>
</div>
<SELECT id="newType" class="u22"   >
<OPTION  value='1'>Food</OPTION>
<OPTION  value='2'>Beauty&amp;Spa</OPTION>
<OPTION  value='3'>Education</OPTION>
</SELECT>
</div>
<div class="preload"><img src="Register_files/u2_line.png" width="1" height="1"/></div>
	
	<!-- END CUSTOMIZATION -->
	
	
	<div id='newForm'>
		<form>
  			<fieldset>
				<legend>Create New Record</legend>
				<label for='newBusinessname'>BusinessName</label><input type='text' id='newBusinessname'/><br/>
				<label for='newDesc'>Description</label><input type='text' id='newDesc'/><br/>
				<label for='newPhone'>Phone</label><input type="tel" id='newPhone'/><br/>
				<label for='newStreetAddress'>Address</label><input type='text' id='newStreetAddress'/><br/>
								
				
				<label for='newType'>Type</label>
					<select id='newType'>
						<option value='1'>Automobile</option>
						<option value='2' selected='selected'>Tai</option>
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
				<label for='editFirstName'>First Name</label><input type='text' id='editFirstName'/><br/>
				<label for='editLastName'>Last Name</label><input type='text' id='editLastName'/><br/>
				<label for='editType'>Type</label>
					<select id='editType'>
						<option value='1'>Automobile</option>
						<option value='2' selected='selected'>Tai</option>
					</select>
			</fieldset>
			<input type='button' value='Close' id='closeEditForm' />
			<input type='submit' value='Submit'/>
		</form>
	</div>
	
</body>
<script src="/resources/js/axurerp_pagescript.js"></script>
<script src="/resources/js/axurerp_pagespecificscript.js" charset="utf-8"></script>
</html>