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
$query = "SELECT TournamentName, Location, FinalWinner
		FROM Tournament;";
$result = mysqli_query($dbcon, $query)
  or die('Show Tournament table failed: ' . mysqli_error());

print "Tournament Information: <br>";

print '<ul>';
while ($tuple = mysqli_fetch_array($result)) {
	echo $tuple['TournamentName'] . ' | ' . $tuple['Location'] . ' | ' . ' Winner: ' . $tuple['FinalWinner'] . '<br />';
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 