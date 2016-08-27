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
$query = "SELECT ChampionPicked, COUNT(ChampionPicked) AS Count
FROM PlayerPlaysGame
GROUP BY ChampionPicked
ORDER BY COUNT(ChampionPicked) DESC;";
$result = mysqli_query($dbcon, $query)
  or die('Show Champion Picked table failed: ' . mysqli_error());

print "Most-Picked Champions (Highest to Lowest):<br>";

print '<ul>';
while ($tuple = mysqli_fetch_array($result)) {
	echo $tuple['ChampionPicked'] . ' has been picked ' . $tuple['Count'] . ' times.' . '<br />';
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 