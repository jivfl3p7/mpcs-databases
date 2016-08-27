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

if (strlen($user) > 25 )
{
    die('PlayerID cannot exceed 25 characters');
}

if (strlen($name) > 25 )
{
    die('Team name cannot exceed 25 characters');
}

// Get the attributes of the user with the given username
$query = "INSERT IGNORE INTO PlayerBITeam (PlayerID, TeamName)
		VALUES ('$user', '$name');";
$result = mysqli_query($dbcon, $query)
  or die('Player add to team failed. ' . mysqli_error($dbcon));

$query2 = "SELECT PlayerID FROM PlayerBITeam WHERE PlayerID = '$user';";
$result2 = mysqli_query($dbcon, $query2)
  or die('Player add to team failed. ' . mysqli_error($dbcon));


print "Player <b>$user</b> has successfully been added/updated to the team <b>$name</b>.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 