<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset = "UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Room Details</title>
	<link rel="stylesheet" href="tablestyle.css">
</head>




<h1> University Accomodation Office </h1>
	<body>
		<div><h2>Check your Room Details</h2></div>
		<form action='db_connect.php' method="POST">
	
			Enter URN:<br>
			<input type='number' name='URN'>
			<br><br>

		
			<input type='submit' name='submit' value="Submit"> <br> <br>
		</form>
	
	</body>
</html>
