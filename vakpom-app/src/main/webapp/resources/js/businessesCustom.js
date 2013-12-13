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
			row += '<td>' + response.businesses[i].streetAddress + '</td>';
			row += '<td>' + response.businesses[i].city + '</td>';
			
			row += '<td>' + response.businesses[i].country + '</td>';
			row += '<td>' + response.businesses[i].phone + '</td>';
			
			row += '</tr>';
	 		$('#tableBusinesses').append(row);
 		}
 		
 		$('#tableBusinesses').data('model', response.businesses);
		toggleForms('hide'); 
 	});
}

function submitNewRecord() {
	
	$.post(urlHolder.add, {
		businessName: $('#newBusinessName').val(),
		description: $('#newDescription').val(),
		type: $('#newType').val(),
		phone: $('#newPhone').val(),
		city: $('#newCity').val(),
		country: $('#newCountry').val(),
		streetAddress: $('#newStreetAddress').val()
		}, 
		function(response) {
			
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
		businessName: $('.editBusinessName').val(),
		type: $('.editType').val(),
		description: $('.editDesc').val(),
		phone: $('.editPhone').val(),
		streetAddress: $('.editStreetAddress').val(),
		city: $('.editCity').val(),
		country: $('.editCountry').val()
		
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
	$('.editBusinessName').val( $('#tableBusinesses').data('model')[selected].businessName );
	$('.editDesc').val( $('#tableBusinesses').data('model')[selected].description );
	$('.editStreetAddress').val( $('#tableBusinesses').data('model')[selected].streetAddress );
	$('.editType').val( $('#tableBusinesses').data('model')[selected].type );
	$('.editPhone').val( $('#tableBusinesses').data('model')[selected].phone );
	$('.editCity').val( $('#tableBusinesses').data('model')[selected].city);
	$('.editCountry').val( $('#tableBusinesses').data('model')[selected].country);
}


function fillViewForm() {
	var selected = $('input:radio[name=index]:checked').val();
	var imagepath='http://localhost:8080/vakpom/resources/images/';
	var imageurl= imagepath + $('#tableBusinesses').data('model')[selected].imageUrl;
	$('h3.editBusinessName').text( $('#tableBusinesses').data('model')[selected].businessName );
	$('p.editDesc').text( $('#tableBusinesses').data('model')[selected].description );
	$('span.editStreetAddress').text( $('#tableBusinesses').data('model')[selected].streetAddress + ', ' );
	$('span.editType').text( '' + $('#tableBusinesses').data('model')[selected].type );
	$('span.editPhone').text( ': ' + $('#tableBusinesses').data('model')[selected].phone );
	$('span.editCity').text( '' + $('#tableBusinesses').data('model')[selected].city);
	$('span.editCountry').text( $('#tableBusinesses').data('model')[selected].country);
	$('.imagelink').attr('src', imageurl);
	
	//alert(imageurl);
}



function resetNewForm() {
	$('#newBusinessname').val('');
	$('#newType').val('');
	$('#newCity').val('');
	$('#newPhone').val('');
	
}

function resetEditForm() {
	$('#editBusinessname').val('');
	$('#editType').val('');
	$('#editCity').val('2');
}

function toggleForms(id) {
	if (id == 'hide') {
		$('#newForm').hide();
		$('#viewForm').hide();
		$('#editForm').hide();
		
	} else if (id == 'new') {
 		resetNewForm();
 		$('#newForm').show();
 		$('#viewForm').hide();
 		$('#editForm').hide();
 		
	} else if (id == 'edit') {
 		resetEditForm();
 		$('#newForm').hide();
 		$('#viewForm').hide();
 		$('#editForm').show();
	}else if (id == 'view') {
 		
 		$('#newForm').hide();
 		$('#editForm').hide();
 		$('#viewForm').show();
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
