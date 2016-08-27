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
$team = $_REQUEST['team'];

// Get the attributes of the user with the given username

$query = "DELETE FROM PlayerBITeam
		WHERE TeamName = '$team';";

$query2 = "DELETE FROM CurrentTeam
		WHERE TeamName = '$team';";

$query3 = "SELECT TeamName FROM CurrentTeam WHERE TeamName = '$team';";

$result = mysqli_query($dbcon, $query)
  or die('Delete not successful. No such team name.');

$result2 = mysqli_query($dbcon, $query2)
  or die('Delete not successful. No such team name.');

$result3 = mysqli_query($dbcon, $query3)
  or die('Delete successful.');

print "Team <b>$team</b> has successfully been deleted.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 