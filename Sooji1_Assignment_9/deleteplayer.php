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

// Get the attributes of the user with the given username
$query = "DELETE FROM PlayerBITeam
		WHERE PlayerID = '$user';";

$query2 = "DELETE FROM Player
		WHERE PlayerID = '$user';";

$query3 = "SELECT PlayerID FROM Player WHERE PlayerID = '$user';";

$result = mysqli_query($dbcon, $query)
  or die('Player NOT deleted from team. ');

$result2 = mysqli_query($dbcon, $query2)
  or die('Player NOT deleted from player roster.');

$result3 = mysqli_query($dbcon, $query3)
  or die('Delete successful.');

print "Player <b>$user</b> has successfully been deleted.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);
mysqli_free_result($result3);

// Closing connection
mysqli_close($dbcon);
?> 