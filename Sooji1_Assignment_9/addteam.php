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
$country = $_REQUEST['country'];

if (strlen($team) > 25 )
{
    die('Team name cannot exceed 25 characters');
}

if (strlen($country) > 25 )
{
    die('Country name cannot exceed 25 characters');
}

// Get the attributes of the user with the given username
$query = "INSERT INTO CurrentTeam (TeamName, SpecificRegion)
		VALUES ('" . $team . "', '" . $country . "')
		ON DUPLICATE KEY UPDATE SpecificRegion='" . $country . "';";

$query2 = "SELECT TeamName FROM CurrentTeam WHERE TeamName = '$team';";
$result = mysqli_query($dbcon, $query)
  or die('Adding team failed. ' . mysqli_error($dbcon));

$result2 = mysqli_query($dbcon, $query2)
  or die('Adding team failed. ' . mysqli_error($dbcon));

print "Team <b>$team</b> has successfully been added/updated.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 