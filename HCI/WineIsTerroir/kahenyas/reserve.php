<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$database = "wineisterrior";

	//create connection
	$conn = mysqli_connect($servername, $username, $password, $database);

	if(!$conn){
		die("Connection failed: " . mysqli_connect_error());
	} 
	// else{
	// echo "Connection successful";
// }


	//passing all variables through ajax
	$var_name = $_POST['pname'];
	$var_email = $_POST['pemail'];
	$var_phoneNo = $_POST['pphoneNo'];
	$var_reserveDate = $_POST['preserveDate'];
	$var_reserveTime = $_POST['preserveTime'];
	$var_guestsNo = $_POST['pguestsNo'];
	//$var_ = $_POST[''];  remember to correct for eventType


	//json decode all the variables
	$var_name = json_decode($var_name);
	$var_email = json_decode($var_email);
	$var_phoneNo = json_decode($var_phoneNo);
	$var_reserveDate = json_decode($var_reserveDate);
	$var_reserveTime = json_decode($var_reserveTime);
	$var_guestsNo = json_decode($var_guestsNo);
	//$var_name = json_decode($var_name);  remember to correct for eventType


	// $custName = $_POST['customerName'];
	// $email = $_POST['email'];
	// $phoneNo = $_POST['phoneNo'];
	// $reserveDate = $_POST['reserveDate'];
	// $reserveTime = $_POST['reserveTime'];
	// $guestsNo = $_POST['guestsNo'];
	// var_dump(json_encode($fullName.$email.$phoneNo.$reserveDate.$reserveTime.$guestsNo));
	// $sql=("INSERT INTO `reservations`(`name`, `email`, `phoneNo`, `dateReserve`, `time`, `guestNo`, `eventType`) VALUES ('$fname','$email','$phoneNo','$reserveDate','$reserveTime','$guestsNo',null)");

	$sql1 = "INSERT INTO `reservations`(`reserveNo`, `name`, `email`, `phoneNo`, `dateReserve`, `time`, `guestNo`, `eventType`) VALUES (null,'$var_name','$var_email','$var_phoneNo','$var_reserveDate','$var_reserveTime','$var_guestsNo',null)";

	$sql = INSERT INTO `reservations`(`reservation_ID`, `name`, `email`, `phoneNumber`, `reservation_date`, `reservation_time`, `guest_count`, `event_type`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8]);

	$result=mysqli_query($conn, $sql1);
	mysqli_close($conn);
	if ($result)
		echo "You have successfully made a reservetion. We will get back to you ";
	else
		echo "error not sent";
?>