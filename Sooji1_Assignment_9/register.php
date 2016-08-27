<?php

// Connection parameters 
$host = 'mpcs53001.cs.uchicago.edu';
$password = '315momlove';
$username = 'sooji1';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());

// Getting the input parameters:
$user = $_REQUEST['user'];
$name = $_REQUEST['name'];
$country = $_REQUEST['country'];
$position = $_REQUEST['position'];

if (strlen($user) > 25 )
{
    die('PlayerID cannot exceed 25 characters');
}

if (strlen($name) > 25 )
{
    die('Player Name cannot exceed 25 characters');
}

if (strlen($country) > 25 )
{
    die('Country name cannot exceed 25 characters');
}

if (strlen($position) > 25 )
{
    die('Player position cannot exceed 25 characters');
}

// Get the attributes of the user with the given username
$query = "INSERT INTO Player (PlayerID, PlayerName, PlayerCountry, PlayerPosition)
		VALUES ('" . $user . "', '" . $name . "', '" . $country . "', '" . $position . "')
		ON DUPLICATE KEY UPDATE PlayerName='" . $name . "',
								PlayerCountry= '" . $country . "',
								PlayerPosition='" . $position . "';";

$query2 = "SELECT PlayerID, PlayerName, PlayerCountry, PlayerPosition FROM Player WHERE PlayerID = '$user';";
$result = mysqli_query($dbcon, $query)
  or die('Registration failed. ' . mysqli_error($dbcon));

$result2 = mysqli_query($dbcon, $query2)
  or die('Registration failed. ' . mysqli_error($dbcon));

print "Player <b>$user</b> has successfully been added/updated.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 