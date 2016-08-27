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
$tournament = $_REQUEST['tournament'];

// Get the attributes of the user with the given username
$query = "DELETE FROM Tournament
		WHERE TournamentName = '$tournament';";

$query2 = "SELECT TournamentName FROM Tournament WHERE TournamentName = '$tournament';";
$result = mysqli_query($dbcon, $query)
  or die('Delete not successful.');

$result2 = mysqli_query($dbcon, $query2)
  or die('Delete not successful.');

print "Tournament <b>$tournament</b> has successfully been deleted.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 