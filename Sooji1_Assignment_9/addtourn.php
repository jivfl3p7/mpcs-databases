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
$tournament = $_REQUEST['tournament'];
$location = $_REQUEST['location'];
$start = $_REQUEST['startdate'];
$end = $_REQUEST['enddate'];
$winner = $_REQUEST['winner'];
$runnerup = $_REQUEST['runnerup'];

if (strlen($tournament) > 100 )
{
    die('Tournament name cannot exceed 100 characters');
}

if (strlen($location) > 25 )
{
    die('Location cannot exceed 25 characters');
}

if (strlen($winner) > 25 )
{
    die('Team name for winner cannot exceed 25 characters');
}

if (strlen($runnerup) > 25 )
{
    die('Team name for runner up cannot exceed 25 characters');
}

// Get the attributes of the user with the given username
$query = "INSERT INTO Tournament (TournamentName, Location, StartDate, EndDate, FinalWinner, RunnerUp)
		VALUES ('" . $tournament . "', '" . $location . "', '" . $start . "', '" . $end . "', '" . $winner . "', '" . $runnerup . "')
		ON DUPLICATE KEY UPDATE Location='" . $location . "',
			StartDate='" . $start . "',
			EndDate='" . $end . "',
			FinalWinner='" . $winner . "',
			RunnerUp='" . $runnerup . "';";

$query2 = "SELECT TournamentName FROM Tournament WHERE TournamentName = '$tournament';";
$result = mysqli_query($dbcon, $query)
  or die('Tournament add failed. ' . mysqli_error($dbcon));

$result2 = mysqli_query($dbcon, $query2)
  or die('Tournament add failed. ' . mysqli_error($dbcon));

print "Tournament <b>$tournament</b> has successfully been added/updated.";

// Free result
mysqli_free_result($result);
mysqli_free_result($result2);

// Closing connection
mysqli_close($dbcon);
?> 