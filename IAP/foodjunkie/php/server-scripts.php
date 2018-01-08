<?php
	// Connects to the Database and returns the connection variable
	function connectToDB(){
		$servername = "localhost";
		$user = "root";
		// $pass = "127.0.0.1";
		$pass = "";
		$dbname = "wine_is_terroir";
		$conn = mysqli_connect($servername,$user,$pass,$dbname) or die("Connection failed " . mysqli_connect_error());
		return $conn;
	}

	// Adds elements to the order slip
	function addToOrderSlip(){
		$code = stripcslashes($_POST['pcodeOfMeal']);
		$code = json_decode($code, TRUE);
		$conn = connectToDB();
		$sql = "SELECT * FROM meals WHERE Code = '$code'";
		$result = mysqli_query($conn, $sql);
		$n = 0;
		while($row = mysqli_fetch_array($result)){
			?>
				<div class="container-fluid order-form-item" data-name="<?php echo $row["Code"]; ?>" style="background-image: url('<?php echo $row["Image_Url"]; ?>');">
					<div class="col-md-12">
						<div class="row">
							<p class="col-xs-7 col-md-10 pull-left name-of-order-item"> <?php echo $row["Name"]; ?> </p>
							<button class="col-xs-2 col-md-1 pull-right removeItem" onclick="<?php echo "removeItem('".$row['Code']."')"; ?>"> &times </button>
						</div>
						<div class="row">
							<div class="clearfix visible-xs visible-md visible-sm visible-lg" style="padding: 10px 5px;"></div>
							<p class="col-md-1">KSh</p><p class="col-md-5 pull-left cost-of-order-item"><?php echo $row["Cost"]; ?> </p>
							<select class="col-md-2 pull-right qty-of-order-item" onchange="totalCost()">
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
							</select>
						</div>
					</div>
				</div>
			<?php
			$n++;
		}
		mysqli_close($conn);
	}

	// Displays the menu on the orders page by fetching data from the DB
	//************************* Depricated function **************************//
	function displayMenu1(){
		// $ = stripcslashes($_POST['p']);
		// $ = json_decode($, TRUE);
		$sql = "SELECT * FROM `meals`";
		$conn = connectToDB();
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_array($result)){
			?>
				<div class="event-package col-xs-6 col-sm-4 col-md-3 col-lg-3">
					<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8 col-sm-offset-1 col-md-offset-2 col-lg-offset-2">
						<img src="img/Placeholder.png" alt="image goes here" class="img-responsive img-circle">
					</div>
					<div class="clearfix visible-lg visible-md visible-sm"></div>
					<div class="col-xs-12 cols-sm-12 col-md-12 col-lg-12 text-center">
						<h3> <?php echo $row["Name"]; ?> </h3>
						<p>	<?php echo $row["Description"]; ?> </p>
						<div class="costandbuy" style="height: 60px">
							<p class="animated fadeInUp"> <?php echo $row["Cost"]; ?> </p>
							<button class="col-xs-8 col-sm-6 col-md-6 col-lg-6 col-xs-offset-2 col-sm-offset-3 col-md-offset-3 col-lg-offset-3 text-center buyNow animated fadeInUp" onclick="<?php echo "addToSlip('".$row['Code']."')"; ?>">Buy Now!</button>
						</div>
					</div>
					
				</div>
			<?php
		}
		mysqli_close($conn);
	}

	// Displays the menu on the orders page by fetching data from the DB
	function displayMenu(){
		$menu = stripcslashes($_POST['pmenu']);
		$menu = json_decode($menu, TRUE);
		$sql = ($menu === "All") ? "SELECT * FROM `meals`" : "SELECT * FROM `meals` WHERE `meal_type` = '$menu'" ;
		$conn = connectToDB();
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_array($result)){
			?>
				<div class="event-package col-xs-6 col-sm-4 col-md-3 col-lg-3 text-center">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<img src="<?php echo $row['Image_Url']; ?>" alt="image goes here" style="height: 50%; width: 50%; max-height: 160px">
					</div>
					<div class="clearfix visible-lg visible-md visible-sm"></div>
					<div class="col-xs-12 cols-sm-12 col-md-12 col-lg-12 text-center">
						<h3> <?php echo $row["Name"]; ?> </h3>
						<div class="costandbuy" style="height: 80px">
							<h4 class="animated fadeInUp">KSh<?php echo $row["Cost"]; ?> </h4>
							<button class="col-xs-8 col-sm-6 col-md-6 col-lg-6 col-xs-offset-2 col-sm-offset-3 col-md-offset-3 col-lg-offset-3 text-center buyNow animated fadeInUp" onclick="<?php echo "addToSlip('".$row['Code']."')"; ?>">Buy Now!</button>
						</div>
					</div>
				</div>
			<?php
		}
		mysqli_close($conn);
	}

	// Displays the menu card for the home page by fetching data from te DB
	function displayMenuCards(){
		$conn = connectToDB();

		$menu = $_POST['pmenu'];
		$menu = json_decode($menu);
		
		$sql = "SELECT * FROM `menus` WHERE `menuType` = '$menu'";
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_array($result)){
			?>
		<ul class="col-md-12 col-md-offset-1 pull-left text-center">
			<li>
				<a href="order.php">
					<img src="<?php echo $row['foodOneImage']; ?>">
				</a>
			</li>
			<li>
				<a href="order.php">
					<h2>
						<?php echo $row['foodOneName']; ?>
					</h2>
					<p>
						<?php echo $row['foodOneText']; ?>
					</p>
				</a>
			</li>
			<li>
				<a href="order.php">
					<img src="<?php echo $row['foodTwoImage']; ?>">
				</a>
			</li>
			<li>
				<a href="order.php">
					<h2>
						<?php echo $row['foodTwoName']; ?>
					</h2>
					<p>
						<?php echo $row['foodTwoText']; ?>
					</p>
				</a>
			</li>
			<li>
				<a href="order.php">
					<img src="<?php echo $row['foodThreeImage']; ?>">
				</a>
			</li>
			<li>
				<a href="order.php">
					<h2>
						<?php echo $row['foodThreeName']; ?>
					</h2>
					<p>
						<?php echo $row['foodThreeText']; ?>
					</p>
				</a>
			</li>
			<li>
				<a href="order.php">
					<img src="<?php echo $row['foodFourImage']; ?>">                       
				</a>
			</li>
			<li>
				<a href="order.php">
					<h2>
						<?php echo $row['foodFourName']; ?>
					</h2>
					<p>
						<?php echo $row['foodFourText']; ?>
					</p>
				</a>
			</li>

		</ul>
		<center>
			<a href="order.php" class="animated infinite bounce">Click here to view the full menu and place an order!</a>
		</center>
		<?php
		}
	}

	// send the company an email with comment details
	function sendCommentEmail($name, $email, $text){
		$to = ""; // email of wine is terrior
		$from = $email;
		$first_name = $name;
		$subject = "Comment and Feedback";
		$message = $first_name . " wrote to us:" . "\n\n" . $text;

		$headers = "From:" . $from;
		mail($to,$subject,$message,$headers);
	}

	// send the company an email with order details
	function sendOrderEmail($name, $email, $order){
		$to = ""; // email of wine is terrior
		$from = $email;
		$first_name = $name;
		$subject = "Order Placed";
		$message = $first_name . " ordered the following meals:" . "\n\n" . $order;

		$headers = "From:" . $from;
		mail($to,$subject,$message,$headers);
	}

	// send the comapany an email with reservation details
	function sendReserveEmail(){
		$to = ""; // email of wine is terrior
		$from = $email;
		$first_name = $name;
		$subject = "Reservation";
		$message = $first_name . " would like to reserve a table:" . "\n\n" . $text;

		$headers = "From:" . $from;
		mail($to,$subject,$message,$headers);
	}

	/** used to save all the information about a customer 
	/* and the items he ordered on the DB 
	*/
	function placeOrder(){
		$orderSlip = stripcslashes($_POST['porderSlip']);
		$totalCost = stripcslashes($_POST['ptotalCost']);
		$customerDetails = stripcslashes($_POST['pcustomerDetails']);
		
		$orderSlip = json_decode($orderSlip,false);
		$totalCost = json_decode($totalCost,false);
		$customerDetails = json_decode($customerDetails,false);

		$conn = connectToDB();
		
		foreach ($orderSlip as $order) {
			date_default_timezone_set('Africa/Nairobi');
			$dateNow = date("d-m-y h:i:sa");

			$custName = $customerDetails->CustomerName;
			$custEmail = $customerDetails->CustomerEmail;
			$custPNumber = $customerDetails->CustomerPhoneNumber;

			$itemName = $order->OrderItemName;
			$itemCost = $order->OrderItemCost;
			$itemQty = $order->OrderItemQty;

			$sql = "INSERT INTO `orders`(`orderID`, `customerName`, `custEmail`, `custPhoneNumber`, `dateOfPurchase`, `orderItemName`, `orderItemQuantity`, `orderItemCost`) VALUES (null,'$custName','$custEmail','$custPNumber','$dateNow','$itemName','$itemQty','$itemCost')";

			$result = mysqli_query($conn, $sql);
			if ($result) {
				echo "success.";
				# sendOrderEmail($custName, $custEmail, $orderSlip);
			} else {
				echo "fail.";
			}
		}

		mysqli_close($conn);
	}

	// send comment to DB
	function sendComment(){
		$name = stripcslashes($_POST['pname']);
		$email = stripcslashes($_POST['pemail']);
		$comment = stripcslashes($_POST['pcomment']);

		$name = json_decode($name,TRUE);
		$email = json_decode($email,TRUE);
		$comment = json_decode($comment,TRUE);

		$conn = connectToDB();

		$sql = "INSERT INTO `comments_and_mailing_list`(`Name`, `Email`, `Comment`) VALUES ('$name','$email',$comment')";

		$result = mysqli_query($conn, $sql);

		if ($result) {
			echo "success.";
			# sendCommentEmail($name, $email, $comment);
		} else {
			echo "fail.";
		}

		mysqli_close($conn);
	}

	// reservation details are stored in a database
	function makeReservation(){
		$fname = stripcslashes($_POST['pfname']);
		$lname = stripcslashes($_POST['plname']);
		$email = stripcslashes($_POST['pemail']);
		$pnumber =stripcslashes($_POST['pphoneNumber']);
		$reservationDate = stripcslashes($_POST['preserveDate']);
		$reservationTime = stripcslashes($_POST['preserveTime']);
		$guestNumber = stripcslashes($_POST['pguestNumber']);
		$food = stripcslashes($_POST['pfoodPackage']);
		$wine = stripcslashes($_POST['pwinePackage']);

		$fname = json_decode($fname,TRUE);
		$lname = json_decode($lname,TRUE);
		$email = json_decode($email,TRUE);
		$pnumber = json_decode($pnumber,TRUE);
		$reservationDate = json_decode($reservationDate,TRUE);
		$reservationTime = json_decode($reservationTime,TRUE);
		$guestNumber = json_decode($guestNumber,TRUE);
		$food = json_decode($food,TRUE);
		$wine = json_decode($wine,TRUE);

		$name = $fname . " " . $lname;

		$packages = "Food: " . $food . " && Wine: " . $wine;

		$conn = connectToDB();

		$sql = "INSERT INTO `reservations`(`name`, `email`, `phoneNumber`, `reservation_date`, `reservation_time`, `guest_count`, `event_type`) VALUES ('$name','$email','$pnumber','$reservationDate','$reservationTime','$guestNumber','$packages')";

		$result = mysqli_query($conn, $sql);

		if ($result) {
			echo "success.";
			# sendReserveEmail();
		} else {
			echo "fail.";
		}
	}

	// used to decide which function to call
	function callFunction($pointer){
		switch ($pointer) {
			case 'displayMenu':
				displayMenu();
				// displayMenu1();
				break;
			case 'addToOrderSlip':
				addToOrderSlip();
				break;
			case 'placeOrder':
				placeOrder();
				break;
			case 'sendComment':
				sendComment();
				break;
			case 'displayMenuCards':
				displayMenuCards();
				break;
			case 'makeReservation':
				makeReservation();
				break;
			default:
				echo "Error: Undefined pointer.";
				break;
		}
	}

	$pointer = stripcslashes($_POST['ppointer']);
	$pointer = json_decode($pointer, TRUE);
	callFunction($pointer);
?>