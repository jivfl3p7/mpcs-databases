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
$query = "SELECT GameName, GameNumber, Week, Stage, Winner, Loser, TournamentName FROM Game WHERE Winner = '$user' OR Loser = '$user'";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

// Can also check that there is only one tuple in the result
$tuple = mysqli_fetch_array($result, MYSQL_ASSOC)
  or die("Team $user not found in any game data.");

print "<b>$user</b>'s Games:";

print '<ul>';
while ($tuple = mysqli_fetch_array($result)) {
	echo '<li> Game Name: ' . $tuple['GameName'] . ' | Game Number: ' . $tuple['GameNumber'] . ' | Game Week: ' . $tuple['Week'] . ' | Stage: ' . $tuple['Stage'] . ' | Winner: ' . $tuple['Winner'] . ' | Loser: ' . $tuple['Loser'] . ' | Tournament: ' . $tuple['TournamentName'] . '<br />';
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 