/**
 * Contains custom JavaScript code
 */
var urlHolder = new Object();

function userCreationConfirmation() {
	$.get('#', function(response) {
		
 		alert("Thank you for registering; your account has been created.");
		//toggleForms('hide'); 
 	});
}

function submitNewRecord() {
	alert("Thank y*&**********8d.");
	
	$.post(urlHolder.add, {
			username: $('#newUsername').val(),
			firstName: $('#newFirstName').val()
//			lastName: $('#newLastName').val(),
//			password: $('#newPassword').val(),
//			email: $('#newEmail').val(),
//			zipcode: $('#zip').val(),
//			city: $('#city').val(),
//			country: $('#country').val()
		}, 
		function(response) {
			if (response != null) {
				userCreationConfirmation();
				//toggleForms('hide'); 
				//toggleCrudButtons('show');
				alert('Success! Record has been added.');
				//window.location.href = "http://localhost:8080/vakpom/";
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);	
	

	
	
}


