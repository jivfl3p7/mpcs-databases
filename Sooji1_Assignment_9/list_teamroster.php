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
$query = "SELECT PlayerID FROM PlayerBITeam WHERE TeamName = '$user';";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

print "Team <b>$user</b> roster:";

// Printing user attributes in HTML
print '<ul>';
while ($tuple = mysqli_fetch_array($result)) {
	echo $tuple['PlayerID']. '<br />';
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 