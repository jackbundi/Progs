<?php
// define('DB_NAME', 'terrior');
// define ('DB_USER','root');
// define ('DB_PASSWORD','');
// define ('DB_HOST','localhost');

$conn = mysqli_connect('localhost','root','','terrior') or die("an error occured ".mysqli_connect_error());

# echo "";
  
  $name = $_POST['name'];
  $Email = $_POST['email'];
  $Number = $_POST['Number'];
  $comment = $_POST['text'];

$sql=("INSERT INTO `contact_us`(`name`, `Email`, `Number`, `Comment`) VALUES ('$name','$Email','$Number','$comment')");

$result = mysqli_query($conn, $sql);
if ($result) {
	echo "Thanks for your feedback";	
}

?>
  