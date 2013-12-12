/**
 * Contains custom JavaScript code
 */
var urlHolder = new Object();

function loadTable() {
	$.get(urlHolder.records, function(response) {
		alert('Loading tables.');
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
	$.post(urlHolder.add, {
		businessName: $('#newBusinessName').val(),
		description: $('#newDescription').val()
//		type: $('#newType').val(),
//		phone: $('#newPhone').val(),
//		city: $('#city').val(),
//		country: $('#country').val()
			
		}, 
		function(response) {
			if (response != null) {
				
				toggleTable('show');
				toggleForms('hide');
				//window.location.href = "http://localhost:8080/vakpom/businesses/viewBusinesses";
				alert('Success! A new Business has been added.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);	

}





function toggleTable(id) {
	
	  var lTable = document.getElementById("tableBusinesses");
	    lTable.style.display = (lTable.style.display == "table") ? "none" : "table";
//	    
//	if (id == 'hide') {
//		$('#tableBusinesses').hide();		
//	} else if (id == 'new') {
// 		$('#tableBusinesses').hide();
// 		
//	} else if (id == 'view') {
// 		$('#tableBusinesses').show();
// 		loadTable();
//	}
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
