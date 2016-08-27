/**
To show that your stored procedures work create a script spscenarios.sql that shows
the effect of each stored procedure. For stored procedures including database
modifications show the instance of an affected relation before and after the stored
procedure is called. 
*/

#Procedures with database modifications
#--------------------------------------

/** PROCEDURE: AddPlayerToTable */
#Adds a player to the Player Relation

#Showing the relation before the stored procedure is called.
#Should return 'Not Found' since BlackWidow does not exist.
#I did this instead of listing all the player ID's because the list of PlayerID's is long.

SELECT IFNULL((SELECT PlayerID
		FROM Player
		WHERE PlayerID = 'BlackWidow'), 'Not Found') AS FindWidow;

#Call procedure.
CALL AddPlayerToTable('BlackWidow', 'Natalia Romanova', 'Russia', 'Mid');

#Check relation to see if it has beed modified to add this player.
#Should return 'BlackWidow' since she has been added.
SELECT IFNULL((SELECT PlayerID
		FROM Player
		WHERE PlayerID = 'BlackWidow'), 'Not Found') AS FindWidow;

/** PROCEDURE: AddTourn */
#Adds a tournament given the name, location, dates, and a player from winning team and a player from losing team.

#Showing the relation before the stored procedure is called.
#Shows all tournaments in the Tournament relation
SELECT TournamentName, FinalWinner, RunnerUp
FROM Tournament;

#Call procedure.
CALL AddTourn('2015 Master Tournament', 'Europe', 2015-10-31, 2015-12-20, 'Mylon', 'Cry');

#See changed relation. The new tournament will be added with the player's teams, not the player ID's.
SELECT TournamentName, FinalWinner, RunnerUp
FROM Tournament;
	#FinalWinner will be paiN Gaming
	#RunnerUp will be KOO Tigers

#Procedures without database modifications
#------------------------------------------alter

/** PROCEDURE: GetCountryPlayers */
#Gets the players in a specified country.
CALL GetCountryPlayers('South Korea');

/** PROCEDURE: GetPlayerID */
#Gets the player IDs for a specified team.
CALL GetPlayerID('Cloud9');

/** PROCEDURE: GetKills */
#Gets the total number of kills that a specified player has.
CALL GetKills('Darshan');