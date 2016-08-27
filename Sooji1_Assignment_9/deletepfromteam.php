<?php

// Connection parameters 
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'sooji1';
$password = '315momlove';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());

// Getting the input parameters:
$user = $_REQUEST['user'];
$name = $_REQUEST['name'];

// Get the attributes of the user with the given username
$query = "DELETE FROM PlayerBITeam
		WHERE PlayerID = '$user'
		AND TeamName = '$name';";

$query2 = "SELECT PlayerID FROM PlayerBITeam WHERE PlayerID = '$user';";
$result = mysqli_query($dbcon, $query)
  or die('Delete not successful.');

$result2 = mysqli_query($dbcon, $query2)
  or die('Delete successful.');

print "Player <b>$user</b> has successfully been deleted from the team <b>$name</b>.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 