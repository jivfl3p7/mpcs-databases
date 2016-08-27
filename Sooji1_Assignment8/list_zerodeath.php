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
$query = "SELECT a.PlayerID, b.TeamName
FROM PlayerPlaysGame a
JOIN PlayerBITeam b
	ON a.PlayerID = b.PlayerID
GROUP BY a.PlayerID
HAVING SUM(a.Deaths) = 0;";
$result = mysqli_query($dbcon, $query)
  or die('Show Zero Death table failed: ' . mysqli_error());

print "Players in the Zero Death club:<br>";

print '<ul>';
print 'Player ID&nbsp;&nbsp;&nbsp;&nbsp;TeamName<br>';
while ($tuple = mysqli_fetch_array($result)) {
	echo $tuple['PlayerID'] . ':&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $tuple['TeamName'] . '<br />';
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 