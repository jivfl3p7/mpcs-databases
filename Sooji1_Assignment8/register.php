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
$user = $_REQUEST['user'];
$name = $_REQUEST['name'];
$country = $_REQUEST['country'];
$position = $_REQUEST['position'];

// Get the attributes of the user with the given username
$query = "INSERT INTO Player VALUES ($user, $name, $country, $position);";

$query2 = "SELECT PlayerID FROM Player WHERE PlayerID = $user;";
$result = mysqli_query($dbcon, $query2)
  or die('Registration failed. ' . mysqli_error($dbcon));

print "Player <b>$user</b> has successfully been added.";

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 