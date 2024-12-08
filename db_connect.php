<!--  PHP code for connecting to the MySQL database -->
<?php
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "universityaccomodationoffice";
$port = "3306"; # do not remove this - it is being used to automatically run the script





	if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
		$conn = mysqli_connect($servername, $username, $password, $dbname) or die("Connection failed: " .mysqli_connect_error());
		
		if (isset($_POST['URN'])) {
			$URN = $_POST['URN'];
			
			$sql = "SELECT Room_Number, Floor, Block, Campus FROM Room 
					WHERE LocationNumber IN
					(SELECT LocationNumber FROM Lease
					WHERE URN =
					(SELECT URN FROM Student
					WHERE URN = '$URN'))";
					
			$result = mysqli_query($conn,$sql);
			}
			
		}
		
	
			



?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset = "UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Your Room Details</title>
	<link rel="stylesheet" href="tablestyle.css">
</head>

<body>
		<div><h1>Your Room Details</h1></div>
<?php
if (mysqli_num_rows($result) > 0) {
?>			
<table>
	<tr>
		<td>Room_Number</td>
		<td>Floor</td>
		<td>Block</td>
		<td>Campus</td>
	</tr>
			<?php
			$i=0;
			while($row = mysqli_fetch_array($result)) {
			?>
	<tr>
		<td><?php echo $row["Room_Number"]; ?></td>
		<td><?php echo $row["Floor"]; ?></td>
		<td><?php echo $row["Block"]; ?></td>
		<td><?php echo $row["Campus"]; ?></td>
	</tr>
	
			<?php
			$i++;
			}
			?>
</table>
<br><br>
<img src="surrey_logo.jfif" alt="University of Surrey Logo"/>

<form action='index.php' method="POST">
			
			<br><br><br><br><br><br><br>
			<h4>Return to Home Page:</h4>
			<input type='submit' name='return' value="Return"> <br> <br>
</form>


<?php
}
else {
	
	echo "No Results Found";
	
}

?>
</body>
</html>