/*
Instructions:
Develop and test at least ten new SQL queries using the JOIN syntaxes discussed in class.
At least five of your queries should involve aggregation. To receive full credit,
you should use all JOIN variations discussed in class (ON, USING, NATURAL, OUTER)
and aggregation with and without the GROUP BY clause. 
*/
#---------------------
#Join with aggregation

#Find the teamname and its players that has lost the most games
SELECT a.Loser, b.PlayerID
FROM Game a
JOIN PlayerBITeam b
	ON a.Loser = b.TeamName
GROUP BY b.TeamName
HAVING COUNT(*) >= ALL(
	SELECT COUNT(*)
    FROM Game
    GROUP BY Loser);

#Find the players' IDs and kills whose kills are greater than the average total kills and whose team is from South Korea.
SELECT a.PlayerID, c.Kills
FROM PlayerBITeam a 
INNER JOIN PlayerPlaysGame c
	ON a.PlayerID = c.PlayerID
INNER JOIN CurrentTeam b
	ON b.TeamName = a.TeamName
WHERE c.Kills > (SELECT AVG(Kills)
				FROM PlayerPlaysGame)
AND b.SpecificRegion = 'South Korea';

#Select the Team Name, Country and count who has lost the most Tournaments
SELECT b.RunnerUp, a.SpecificRegion, COUNT(*) AS NumberOfLosses
FROM CurrentTeam a
JOIN Tournament b
WHERE a.TeamName = b.RunnerUp
GROUP BY b.RunnerUp
HAVING COUNT(*) >= ALL(
	SELECT COUNT(*)
    FROM Tournament
    GROUP BY RunnerUp);

#Find all the players who died a total of 0 times in their entire game record and their Team Name
SELECT a.PlayerID, b.TeamName
FROM PlayerPlaysGame a
JOIN PlayerBITeam b
	ON a.PlayerID = b.PlayerID
GROUP BY a.PlayerID
HAVING SUM(a.Deaths) = 0;

#Find the player's ID, Position, and count of games played who has played the least games and is a Sub
SELECT a.PlayerID, a.PlayerPosition, COUNT(*) AS GamesPlayed
FROM Player a
JOIN PlayerPlaysGame b
ON a.PlayerID = b.PlayerID
WHERE a.PlayerPosition = 'Sub'
GROUP BY b.PlayerID
HAVING COUNT(*) <= ALL(
	SELECT COUNT(*)
    FROM PlayerPlaysGame
    GROUP BY PlayerID);

#Find the player's real name and average deaths of a player who has played in games and played the position Jungler
SELECT a.PlayerName, AVG(b.Deaths) AS AverageDeaths
FROM Player a
JOIN PlayerPlaysGame b
	ON a.PlayerID = b.PlayerID
WHERE a.PlayerPosition = 'Jungler'
GROUP BY a.PlayerID;

#Find all the count of the champion picked, if any, where the Player who picked the champion is from Brazil
SELECT b.ChampionPicked AS ChampionName, COUNT(b.ChampionPicked) AS Count
FROM PlayerPlaysGame b
LEFT OUTER JOIN Player a
	ON a.PlayerID = b.PlayerID
WHERE a.PlayerCountry = 'Brazil'
GROUP BY b.ChampionPicked;

#------------------------
#Join without aggregation

#Find all pairs of players who played the same champion picked, where champion starts with letter "A", and the kill score for each
SELECT a.PlayerID AS Player1, b.PlayerID AS Player2, a.Kills AS Player1Score, b.Kills AS Player2Score, a.ChampionPicked AS Champion
FROM PlayerPlaysGame a
JOIN PlayerPlaysGame b
	USING (ChampionPicked)
WHERE a.PlayerID > b.PlayerID
AND ChampionPicked LIKE 'A%';

#Find all players who play position Mid and picked as their champion "Ahri" in at least one game
SELECT a.PlayerID AS PlayerPickedAhri, a.PlayerPosition
FROM Player a
NATURAL JOIN PlayerPlaysGame b
WHERE b.ChampionPicked = 'Ahri'
AND a.PlayerPosition = 'Mid';

#Give information about a player whose teamname is "KOO Tigers".
SELECT PlayerName, PlayerCountry, PlayerPosition, TeamName
FROM Player
NATURAL JOIN PlayerBITeam
WHERE TeamName = 'KOO Tigers';
