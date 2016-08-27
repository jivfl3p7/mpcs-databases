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
$query = "SELECT TeamName, SpecificRegion FROM CurrentTeam WHERE TeamName = '$user'";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

// Can also check that there is only one tuple in the result
$tuple = mysqli_fetch_array($result, MYSQL_ASSOC)
  or die("Team $user not found!");

print "<b>$user</b> information:";

// Printing user attributes in HTML
print '<ul>';  
print '<li> Team Name: '.$tuple['TeamName'];
print '<li> Team Country: '.$tuple['SpecificRegion'];
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 