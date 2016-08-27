<?php

// Connection parameters 
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'sooji1';
$password = '315momlove';
$database = $username.'DB';

// Attempting to connect 
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());

// Listing tables in your database
$query = "SELECT Winner, COUNT(*) AS Count
		FROM Game
		GROUP BY Winner
		HAVING COUNT(*) >= ALL(
		SELECT COUNT(*)
    	FROM Game
    	GROUP BY Winner);";
$result = mysqli_query($dbcon, $query)
  or die('Show Top Player table failed: ' . mysqli_error());

print "Team(s) with most game wins:<br>";

print '<ul>';
while ($tuple = mysqli_fetch_array($result)) {
	echo 'Team: ' . $tuple['Winner'] . ' | Number of Wins: ' . $tuple['Count'] . '<br />';
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 