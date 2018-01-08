function sub(){
	alert( '...' );
	if (document.getElementById("name").value === ""){
		alert("Please enter your name");
	}
	else if(document.getElementById("email").value === ""){
		alert("Please enter an email address");
	}
	else if(document.getElementById("phoneNo").value ===""){
		alert("Please enter your phone number");
	}
	else if(document.getElementById("reserveDate").value ===""){
		alert("Please enter the reservation date");
	}
	else if(document.getElementById("reserveTime").value ===""){
		alert("Please enter the time the event is meant to start");
	}
	else if(document.getElementById("guestsNo").value ===""){
		alert("Please enter the number of expected guests");
	}
	//else if(document.getElementById("t7").value ===""){
		//alert("Please pick the type of event you would like to hold");
	// }
	else{
		//alert("Validation complete");
		ajax_function();
	}
}


function phoneNumber (inputtxt){
	var phoneNo = "/^\(?([0-9]{4})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{3})$/";
	if(inputtxt.value.match(phoneNo)){
		// return true;
	} else {
		alert("WTF!!");
	}
}

//this is the ajax function
function ajax_function(){
	alert('i have been called');
	//this gets all the values from the input elements
	var nameV = document.getElementById('name').value;
	var emailV = document.getElementById('email').value;
	var phoneNoV = document.getElementById('phoneNo').value;
	var reserveDateV = document.getElementById('reserveDate').value;
	var reserveTimeV = document.getElementById('reserveTime').value;
	var guestsNoV = document.getElementById('guestsNo').value;
	// var eventType = document.getElementById('t7').value;   //make sure to name correctly

//this converts all the variables to JSON
name = JSON.stringify(nameV);
email = JSON.stringify(emailV);
phoneNo = JSON.stringify(phoneNoV);
reserveDate = JSON.stringify(reserveDateV);
reserveTime = JSON.stringify(reserveTimeV);
guestsNo = JSON.stringify(guestsNoV);
//eventType = JSON(eventType);
alert('i have been called again');
//ajax at work
	$.ajax({
		type: "POST",
		url: "reserve.php",
		data: { pname:name, pemail:email, pphoneNo:phoneNo, preserveDate:reserveDate, preserveTime:reserveTime, pguestsNo:guestsNo },
		success: function(msg){
			console.log(msg);
			alert(msg);
		}
	});

	alert('i have been called again and again');
}