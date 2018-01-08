<!DOCTYPE html>
<html>
	<head>
		<title> Menus | Wine Is Terroir </title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/animate.css">
		<link rel="stylesheet" type="text/css" href="css/font.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>

	<div class="menu-bar">
			<div class="container">
				<div class="top-menu">
					<ul>
						<li><a href="index.html">Home</a></li>|
						<li><a href="popular-Restaurants.html">Popular Restaurants</a></li>|
						<li class="active"><a href="order.html">Order</a></li>|
						<li><a href="contact.html">contact</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="login-section">
					<ul>
						<li><a href="login.html">Login</a>  </li> |
						<li><a href="register.html">Register</a> </li> |
						<li><a href="#">Help</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

<!-- 		<div class="navigation">
			<div class="navigation-links col-md-6 col-md-offset-6">
				<a href='terrior.html'>Home</a>
				<a href='terrior.html#aboutus'>About us</a>
				<a href='order.php'>Menu</a>
				<a href='terrior.html#events'>Blog</a>
			</div>	
		</div> -->



		<!-- Main Content -->
		<div class="container-fluid" id="main">
			<div class="row" id="main-content">
				<h1 class="col-xs-12 col-sm-12 col-md-9 col-lg-9 text-center"> Popular Restaurants </h1>
				<!-- Menu -->
				<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" id="menu">
					<!-- Menus added by php -->
				</div>
				<!-- Order Slip -->
				<div class="col-xs-4 col-sm-3 col-md-3 col-lg-3 order-form">
					<!-- Header contains the number of items -->
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 order-form-header">
						<p style="float: left;">Order Slip</p>
						<p style="float: right;"><span id="number-of-items">0</span> item(s)</p>
					</div>
					<!-- Order Slip -->
					<div id="orderslip" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
					<!-- Footer contains the buttons and total cost -->
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 order-form-footer">
						<p class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pull-right" style="text-align: right;">Total Cost: KSh <span id="totalCost">0</span></p>
						<button class="col-xs-6 col-sm-6 col-md-5 col-lg-5 pull-left" onclick="removeAllItems()">Remove All</button>
						<button class="col-xs-6 col-sm-6 col-md-5 col-lg-5 pull-right" id="placeOrder">Place Order</button>
					</div>
				</div>
			</div>

			<!-- button for menu -->
			<a id="openMenu" onclick="openMenu()"><i class="fa fa-bars fa-2x" aria-hidden="true"></i></a>
			<a id="closeMenu" onclick="closeMenu()"><i class="fa fa-times fa-2x" aria-hidden="true"></i></a>

			<!-- Menu Navigation bar -->
			<div id="menu-nav">
				<h3 class="text-center" onclick="filterMenu(7)">Restaurants</h3>
				<ul class="menu-list">
					<li onclick="filterMenu(0)">Artcaffe</li>
					<li onclick="filterMenu(1)"> Dominno's Pizza</li>
					<li onclick="filterMenu(2)">Kfc</li>
					<li onclick="filterMenu(3)">Subway</li>
					<li onclick="filterMenu(4)">Steers</li>
					<li onclick="filterMenu(5)">Pizza inn</li>
					<li onclick="filterMenu(6)">Ocean Basket</li>
				</ul>
			</div>
		</div>

		<!-- Pop up window for purchasing -->
		<div id="orderModal" class="order-modal">
			<div class="order-modal-content animated fadeInDown">
				<div class="order-modal-header">
					<span class="close-order-modal">&times;</span>
					<h2>Order Now!!</h2>
				</div>
				<div class="order-modal-body container-fluid">
					<form class="row" id="personalDetails">
						<div class="form-group col-md-5">
							<label for="fname">First Name: </label><input type="text" name="fname" id="fname" placeholder="John" class="form-control">
						</div>
						<div class="form-group col-md-5">
							<label for="lname">Last Name: </label><input type="text" name="lname" id="lname" placeholder="Doe" class="form-control">
						</div>
						<div class="form-group col-md-5">
							<label for="pnumber">Phone Number: </label><input type="text" name="pnumber" id="pnumber" placeholder="xxx xxx xxxx" class="form-control">
						</div>
						<div class="form-group col-md-5">
							<label for="email">Email Address: </label><input type="email" name="email" id="email" placeholder="someone@example.com" class="form-control">
						</div>
						<div class="form-group col-md-8 col-md-offset-2 text-center">
							<p><b><u>Note:</u></b><br>All orders made through this forum <i>must</i> be paid for in full on pick up.</p>
						</div>
					</form>
					<div class="form-group col-md-12">
						<div id="paypal-button-container animated fadeIn" class="col-md-4 col-md-offset-4" onclick="finishPayPal()"></div>
						<button class="col-md-4 col-md-offset-4 animated fadeIn" onclick="submitOrder()">Submit</button>
					</div>
				</div>
				<div class="order-modal-footer"></div>
			</div>
		</div>
		
		<!-- Error message -->
		<p class="animated slideInDown text-center" id="error-message"></p>

		<!-- Scripts -->
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://www.paypalobjects.com/api/checkout.js"></script>
		<script type="text/javascript" src="js/scripts.js"></script>
	</body>
</html>