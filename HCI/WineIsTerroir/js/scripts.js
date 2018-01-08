// File path for php scripts
var phpUrl = "php/server-scripts.php";

// Called to populate the order slip when an item is clicked on
function addToSlip(code){
	closeMenu();
	var codeOfMeal = JSON.stringify(code);
	var pointer = JSON.stringify("addToOrderSlip");
	$.ajax ({
		type: "POST",
		url: phpUrl,
		data: {pcodeOfMeal:codeOfMeal, ppointer:pointer},
		success: function(msg){
			if (parseInt(Number(numberOfItems())) >= 10) {
				errorMessage("white","Error: Too many items on the order slip.","red");
			} else {
				document.getElementById("orderslip").innerHTML += msg;
				$(".order-form-item-empty").remove();
				document.getElementById("number-of-items").innerHTML = numberOfItems(document.getElementById("number-of-items").innerHTML);
				$("#placeOrder").removeClass("disabled");
				document.getElementById("placeOrder").addEventListener('click', makeOrder);
				totalCost();
			}
		}
	});
}

// Checks the number of items and returns one more
function numberOfItems(num){
	var num = parseInt(num);
	if (num <= 10){
		return parseInt(++num);
	}
}

// Removes all the items on the order slip
function removeAllItems(){
	closeMenu();
	document.getElementById("orderslip").innerHTML = 
	"<div class='col-md-12 order-form-item-empty'>" +
	"<p class='col-md-12' style='text-align: center;'>Order Something...</p></div>";
	document.getElementById("number-of-items").innerHTML = "0";
	$("#placeOrder").addClass("disabled");
	totalCost();
}

// Loops through each of the order items (if any) and adds their cost * quantity
function totalCost() {
	var cost = document.getElementsByClassName('cost-of-order-item');
	var quantity = document.getElementsByClassName('qty-of-order-item');
	var i = 0;
	var total = 0;

	if(document.getElementsByClassName("order-form-item").length < 1){
		total = 0;
	} else {
		$(".order-form-item").each(function(){
			total += (Number(cost[i].innerHTML) * Number(quantity[i].options[quantity[i].selectedIndex].text));
			// total += (Number(cost[i].innerHTML) * Number(quantity[i].innerHTML));
			i++;
		});
	}
	document.getElementById('totalCost').innerHTML = total;
}

// Removes an element from the order slip when the X is clicked
function removeItem(code){
	closeMenu()
	$("[data-name="+code+"]").remove();
	var numberOfOrders = $("#orderslip").children().length;
	document.getElementById("number-of-items").innerHTML = ""+numberOfOrders;
	if (numberOfOrders < 1) {
		$("#placeOrder").addClass("disabled");
		document.getElementById("placeOrder").removeEventListener('click', placeOrder);
		document.getElementById("orderslip").innerHTML = 
			"<div class='col-md-12 order-form-item-empty'>" +
			"<p class='col-md-12' style='text-align: center;'>Order Something...</p></div>";
			document.getElementById("placeOrder").removeEventListener('click', makeOrder);
	}
	totalCost();
}

// Creates a JSON string of all the order items and saves it in a cookie
function makeOrder(){
	closeMenu();
	var orderSlip = new Array();
	var totalCost = JSON.stringify(document.getElementById("totalCost").innerHTML);
	var i = 0;
	$(".order-form-item").each(function(order){
		orderSlip[order] = {
			"OrderItemName" : document.getElementsByClassName('name-of-order-item')[i].innerHTML,
			"OrderItemCost" : document.getElementsByClassName('cost-of-order-item')[i].innerHTML,
			"OrderItemQty" : document.getElementsByClassName('qty-of-order-item')[i].options[document.getElementsByClassName('qty-of-order-item')[i].selectedIndex].text
			// "OrderItemQty" : document.getElementsByClassName('qty-of-order-item')[i].innerHTML
		}
		i++;
	});

	orderSlip = JSON.stringify(orderSlip);

	setCookie("orderSlip", orderSlip);
	setCookie("totalCost", totalCost);

	var order_Modal = document.getElementById('orderModal');
	order_Modal.style.display = "block";
	$("body").addClass("blow-up-open");
}

// Retrieves data from the submit customer details form and also info from cookies and sends
// it to the PHP file to insert into the data
function submitOrder(){
	if (validateSubmitForm()){
		var customerDetails =  new Array();
		var orderSlip =  new Array();
		var totalCost;
		var pointer = JSON.stringify("placeOrder");
		customerDetails = {
			"CustomerName" : document.getElementById('fname').value + " " + document.getElementById('lname').value,
			"CustomerPhoneNumber" : document.getElementById('pnumber').value,
			"CustomerEmail" : document.getElementById('email').value
		}
		customerDetails = JSON.stringify(customerDetails);
		orderSlip = getCookie("orderSlip");
		totalCost = getCookie("totalCost");

		$.ajax({
			type: "POST",
			url: phpUrl,
			data: {ppointer:pointer, pcustomerDetails:customerDetails, porderSlip:orderSlip, ptotalCost:totalCost},
			success: function(msg){
				console.log(msg);
				var result = msg.split(".");
				if (result[0] === "success") {
					removeAllItems();
					document.getElementById("placeOrder").removeEventListener('click', makeOrder);
					var order_Modal = document.getElementById('orderModal');
					order_Modal.style.display = "none";
					$("body").removeClass("blow-up-open");
					errorMessage("white","Your order has been Placed. We will contact you when it is ready. Thank you for dining with Wine is Terroir", "green", '8000');
					deleteCookie("orderSlip");
					deleteCookie("totalCost");
					document.getElementById('fname').value = "";
					document.getElementById('lname').value = "";
					document.getElementById('pnumber').value = "";
					document.getElementById('email').value = "";
				} else {
					errorMessage("white","OOPS! Something went wrong. Please try again. If the problem persists leave us a complaint and we will attend to the issue as soon as possible. Sorry for the inconvenience.","red",'12000');
				}
			}
		});
	}
}

// Validates customer details form
function validateSubmitForm(){
	var fname = document.getElementById('fname').value;
	var lname = document.getElementById('lname').value;
	var pname = document.getElementById('pnumber').value;
	var email = document.getElementById('email').value;
	if ((fname === "") || (lname === "") || (pname === "") || (email === "")) {
		errorMessage("white", "Please fill in all the details on the form below.", "red");
		return false;
	} else {
		return true;
	}
}

// sets cookie
function setCookie(cname, cvalue) {
	var date = new Date();
	date.setTime(date.getTime() + (10*60*1000)); //10 minutes
	var expires = "expires="+ date.toUTCString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

// deletes cookie
function deleteCookie(cname){
	var date = new Date();
	date.setTime(date.getTime() - (10*24*60*60*1000)); //10 days in the past
	var expires = "expires="+ date.toUTCString();
	document.cookie = cname + "=;" + expires + ";path=/";	
}

// retrieves cookie
function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for(var i = 0; i <ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

// styles and displays the error message
function errorMessage(color = "white", msg, bgcolor = "red", delay = '4000'){
	var error_msg = document.getElementById("error-message");
	error_msg.style.backgroundColor = bgcolor;
	error_msg.style.color = color;
	error_msg.innerHTML = msg;
	error_msg.style.display = "block";
	$('#error-message').delay(delay).fadeOut('slow');
}

// opens the side navigaton bar for the menus
function openMenu() {
	document.getElementById("main-content").style.marginLeft = "18%";
	
	document.getElementById("menu-nav").style.width = "18%";
	document.getElementById("menu-nav").style.display = "block";
	
	document.getElementById("openMenu").style.opacity = "0";
	
	$('#openMenu').removeClass("animated fadeInLeft");
	$('#openMenu').addClass("animated fadeOutLeft");

	$('#closeMenu').removeClass("animated fadeOutLeft");
	$('#closeMenu').addClass("animated fadeInLeft");
	
	$('.order-form').removeClass("col-md-3 col-lg-3");
	$('.order-form').addClass("col-md-2 col-lg-2");
	
	$('#menu-nav').removeClass('animated fadeOutLeft');
	$('#menu-nav').addClass('animated fadeInLeft');
}

// closes the side navigaton bar for the menus
function closeMenu() {
	document.getElementById("main-content").style.marginLeft = "0%";
	
	document.getElementById("openMenu").style.opacity = "1";
	
	$('#openMenu').removeClass("animated fadeOutLeft");
	$('#openMenu').addClass("animated fadeInLeft");

	$('#closeMenu').removeClass("animated fadeInLeft");
	$('#closeMenu').addClass("animated fadeOutLeft");
	
	$('.order-form').removeClass("col-md-3 col-lg-2");
	$('.order-form').addClass("col-md-2 col-lg-3");
	
	$('#menu-nav').removeClass('animated fadeInLeft');
	$('#menu-nav').addClass('animated fadeOutLeft');
}

// uses ajax to get the menu type that has been selected
function getMenu(menu){
	if (menu !== "All") {
		setTimeout(closeMenu, 10000);	
	}
	document.querySelector('#main-content h1').innerHTML = (menu === "All" ? "The Menu" : "The Menu<br><sub>'" + menu + "'</sub>");
	menu = JSON.stringify(menu);
	var pointer = JSON.stringify("displayMenu");
	$.ajax({
		type: "POST",
		url: phpUrl,
		data: {ppointer:pointer,pmenu:menu},
		success: function(msg){
			// console.log(msg);
			document.getElementById('menu').innerHTML = "";
			document.getElementById('menu').innerHTML = msg;
		}
	});
}

// toggles the classes for active and non active for the side nav
function toggleClassListForMenus(nodeNumber){
	for (var i = 0; i <= 6; i++) {
		document.getElementsByClassName('menu-list')[0].getElementsByTagName('li')[i].classList.remove("menu-list-active");
	}
	document.getElementsByClassName('menu-list')[0].getElementsByTagName('li')[nodeNumber].classList.add("menu-list-active");
}

// filters the menu items displayed after the side nav is used
function filterMenu(menuNumber){
	switch (menuNumber){
		case 0:
			getMenu("Specials");
			toggleClassListForMenus(menuNumber);
			break;
		case 1:
			getMenu("Snacks");
			toggleClassListForMenus(menuNumber);
			break;
		case 2:
			getMenu("Oysters");
			toggleClassListForMenus(menuNumber);
			break;
		case 3:
			getMenu("Cheese");
			toggleClassListForMenus(menuNumber);
			break;
		case 4:
			getMenu("Charcuterie");
			toggleClassListForMenus(menuNumber);
			break;
		case 5:
			getMenu("Sweets");
			toggleClassListForMenus(menuNumber);
			break;
		case 6:
			getMenu("Drinks");
			toggleClassListForMenus(menuNumber);
			break;
		case 7:
		default:
			getMenu("All");
			for (var i = 0; i <= 6; i++) {
				document.getElementsByClassName('menu-list')[0].getElementsByTagName('li')[i].classList.remove("menu-list-active");
			}
			break;
	}
}

// displays the contact us pop up
function displayContactUs(){
	document.getElementById("contactPopUp").style.height = "auto";
	document.getElementById("contactPopUp").style.display = "block";
	document.getElementById("contactBtn").style.opacity = "0";
	document.getElementById("contactPopUp").classList.remove('fadeOutDown');
	document.getElementById("contactPopUp").classList.add('fadeInUp');
}

// hides the contact us pop up
function hideContactUs() { 
	document.getElementById("contactBtn").style.opacity = "1";
	document.getElementById("contactPopUp").classList.remove('fadeInUp');
	document.getElementById("contactPopUp").classList.add('fadeOutDown');
}

// gets the details from the contacts pop up and send sthem to the DB
function sendComment(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var phoneNumber = document.getElementById("pnumber").value;
	var comment = document.getElementById("text").value;
	var mailingList = (document.getElementById("mailing").checked) ? "TRUE" : "FALSE";
	var pointer = JSON.stringify("sendComment");

	name = JSON.stringify(name);
	email = JSON.stringify(email);
	phoneNumber = JSON.stringify(phoneNumber);
	comment = JSON.stringify(comment);
	mailingList = JSON.stringify(mailingList);

	$.ajax({
		type: "POST",
		url: phpUrl,
		data: {ppointer:pointer, pname:name, pemail:email, pphoneNumber:phoneNumber, pcomment:comment, pmailingList:mailingList},
		success: function(msg){
			console.log(msg);
			var result = msg.split(".");
			if (result[0] === "success") {
				errorMessage("white","Thank you, your feedback is appreciated.","green");
				// have another one for when a user joins the mailing list...
				document.getElementById("name").value = "";
				document.getElementById("email").value = "";
				document.getElementById("pnumber").value = "";
				document.getElementById("text").value = "";
				hideContactUs();
			} else {
				errorMessage("white","OOPS! Something went wrong. Please try again. If the problem persists leave us a complaint and we will attend to the issue as soon as possible. Sorry for the inconvenience.","red",'12000');
			}
		}
	});
}

$(document).ready(function(){
	// Checks if there are any items in the order slip 
	// and disables the place order button if there are not any
	if ($("#orderslip").children().length < 1) {
		document.getElementById("orderslip").innerHTML = 
			"<div class='col-md-12 order-form-item-empty'>" +
			"<p class='col-md-12' style='text-align: center;'>Order Something...</p></div>";
			document.getElementById("placeOrder").removeEventListener('click', makeOrder);
			$("#placeOrder").addClass("disabled");
	}

	// Fetches all the meals from the DB
	filterMenu(7);

	// calculate and display total cost
	totalCost();

	// provides onclick actions for the modal that appears when purchasing food
	var order_Modal = document.getElementById('orderModal');
	var closeOrderModal = document.getElementsByClassName("close-order-modal")[0];
	closeOrderModal.onclick = function() {
		order_Modal.style.display = "none";
		$("body").removeClass("blow-up-open");
	}
	window.onclick = function(event) {
		if (event.target == order_Modal) {
			order_Modal.style.display = "none";
			$("body").removeClass("blow-up-open");
		}
	}

	// validates the form on change/ on key up
	$("#fname").on("input change", function() {
		if ($(this).val() === "") {
			errorMessage("white", "Please fill in your first name", "red");
		}
	});
	
	$("#lname").on("input change", function() {
		if ($(this).val() === "") {
			errorMessage("white", "Please fill in your last name", "red");
		}
	});
	
	$("#pnumber").on("input change", function() {
		if ($(this).val() === "") {
			errorMessage("white", "Please fill in your phone number", "red");
		} else if ( isNaN( Number( $(this).val() ) ) ){
			errorMessage("white", " Please make sure you have entered a number", "red");
		}
	});

	$("#email").on("input change", function() {
		if ($(this).val() === "") {
			errorMessage("white", "Please fill in your emai address", "red");
		}
	});

});

function finishPayPal(){
	$('#paypal-button-container div').addClass('hidden');
	$('#paypal-button-container button').removeClass('hidden');
}

// Paypal section.....working on it atm
	$(document).ready(function () {
		 // Render the PayPal button

	    paypal.Button.render({

	        // Set your environment

	        env: 'sandbox', // sandbox | production

	        // Specify the style of the button

	        style: {
	            label: 'checkout', // checkout || credit
	            size:  'small',    // tiny | small | medium
	            shape: 'pill',     // pill | rect
	            color: 'blue'      // gold | blue | silver
	        },

	        // PayPal Client IDs - replace with your own
	        // Create a PayPal app: https://developer.paypal.com/developer/applications/create

	        client: {
	            sandbox:    'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
	            production: '<insert production client id>'
	        },

	        // Wait for the PayPal button to be clicked

	        payment: function() {

	            // Make a client-side call to the REST api to create the payment

	            return paypal.rest.payment.create(this.props.env, this.props.client, {
	                transactions: [
	                    {
	                        amount: { total: '0.01', currency: 'USD' }
	                    }
	                ]
	            });
	        },

	        // Wait for the payment to be authorized by the customer

	        onAuthorize: function(data, actions) {
	            return actions.payment.execute().then(function() {
	                window.alert('Payment Complete!');
	            });
	        }

	    }, '#paypal-button-container');

	});

/*
https://developer.paypal.com/docs/integration/direct/express-checkout/integration-jsv4/add-paypal-button/

https://developer.paypal.com/demo/checkout/#/pattern/client
*/