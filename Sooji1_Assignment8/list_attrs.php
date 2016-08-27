<?php

// Connection parameters 
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'sooji1';
$password = '315momlove';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());

// Getting the input parameter (user):
$user = $_REQUEST['user'];

// Get the attributes of the user with the given username
$query = "SELECT a.PlayerID, a.PlayerName, a.PlayerCountry,
a.PlayerPosition, b.TeamName FROM Player a, PlayerBITeam b WHERE a.PlayerID = '$user' AND a.PlayerID = b.PlayerID;";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

// Can also check that there is only one tuple in the result
$tuple = mysqli_fetch_array($result, MYSQL_ASSOC)
  or die("User $user not found!");

print "Player <b>$user</b> information:";

// Printing user attributes in HTML
print '<ul>';  
print '<li> Full Name: '.$tuple['PlayerName'];
print '<li> Country: '.$tuple['PlayerCountry'];
print '<li> Position: '.$tuple['PlayerPosition'];
print '<li> Current Team: '.$tuple['TeamName'];
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 