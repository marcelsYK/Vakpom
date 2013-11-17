/**
 * Contains custom JavaScript code
 */
var urlHolder = new Object();

function loadTable() {
	$.get(urlHolder.records, function(response) {
		
 		$('#tableBusinesses').find('tbody').remove();
 		
 		for (var i=0; i<response.businesses.length; i++) {
			var row = '<tr>';
			row += '<td><input type="radio" name="index" id="index" value="'+i+'"></td>';
			row += '<td>' + response.businesses[i].businessName + '</td>';
			row += '<td>' + response.businesses[i].type + '</td>';
			row += '<td>' + response.businesses[i].city + '</td>';
			row += '<td>' + response.businesses[i].phone + '</td>';
			row += '</tr>';
	 		$('#tableBusinesses').append(row);
 		}
 		
 		$('#tableBusinesses').data('model', response.businesses);
		toggleForms('hide'); 
 	});
}

function submitNewRecord() {
	alert("BusinessCustom: " + $('#newBusinessName').val()),
	$.post(urlHolder.add, {
		businessName: $('#newBusinessName').val(),
		type: $('#newType').val(),
		phone: $('#newPhone').val(),
		city: $('#newCity').val()
	
			
		}, 
		function(response) {
			alert('response');
			if (response != null) {
				loadTable();
				toggleForms('hide'); 
				toggleCrudButtons('show');
				alert('Success! A new Business has been added.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);	
}

function submitDeleteRecord() {
	var selected = $('input:radio[name=index]:checked').val();
	
	$.post(urlHolder.del, {
			businessName: $('#tableBusinesses').data('model')[selected].businessName
		}, 
		function(response) {
			if (response == true) {
				loadTable(urlHolder.records);
				alert('Success! Record has been deleted.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
}

function submitUpdateRecord() {
	$.post(urlHolder.edit, {
			businessName: $('#editBusinessname').val(),
			type: $('#editType').val(),
			city: $('#editCity').val(),
			phone: $('#editPhone').val()
		}, 
		function(response) {
			if (response != null) {
				loadTable();
				toggleForms('hide'); 
				toggleCrudButtons('show');
				alert('Success! Record has been edited.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
}

/*function getRole(role) {
	if (role == 1) {
		return 'Admin';
	} else if (role == 2) {
		return 'Regular';
	} else {
		return 'Unknown';
	} 
}*/

function hasSelected() {
	var selected = $('input:radio[name=index]:checked').val();
	if (selected == undefined) { 
		alert('Select a record first!');
		return false;
	}
	
	return true;
}

function fillEditForm() {
	var selected = $('input:radio[name=index]:checked').val();
	$('#editBusinessname').val( $('#tableBusinesses').data('model')[selected].businessName );
	$('#editType').val( $('#tableBusinesses').data('model')[selected].type );
	$('#editPhone').val( $('#tableBusinesses').data('model')[selected].phone );
	/*$('#editRole').val( $('#tableBusinesses').data('model')[selected].role.role );*/
}

function resetNewForm() {
	$('#newBusinessname').val('');
	$('#newType').val('');
	$('#newCity').val('');
	$('#newPhone').val('');
	//$('#newRole').val('2');
}

function resetEditForm() {
	$('#editBusinessname').val('');
	$('#editType').val('');
	$('#editCity').val('2');
}

function toggleForms(id) {
	if (id == 'hide') {
		$('#newForm').hide();
		$('#editForm').hide();
		
	} else if (id == 'new') {
 		resetNewForm();
 		$('#newForm').show();
 		$('#editForm').hide();
 		
	} else if (id == 'edit') {
 		resetEditForm();
 		$('#newForm').hide();
 		$('#editForm').show();
	}
}

function toggleCrudButtons(id) {
	if (id == 'show') {
		$('#newBtn').removeAttr('disabled');
		$('#editBtn').removeAttr('disabled');
		$('#deleteBtn').removeAttr('disabled');
		$('#reloadBtn').removeAttr('disabled');
		
	} else if (id == 'hide'){
		$('#newBtn').attr('disabled', 'disabled');
		$('#editBtn').attr('disabled', 'disabled');
		$('#deleteBtn').attr('disabled', 'disabled');
		$('#reloadBtn').attr('disabled', 'disabled');
	}
}
