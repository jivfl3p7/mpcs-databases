/*
At least 10 SQL Queries using JOIN syntax.
At least 4 should involve aggregation.
Use all JOIN variations (ON, USING, NATURAL, OUTER)
and aggregation with and without the GROUP BY clause.
*/

#-------------------
#With aggregation:

#Find the player's real name and average kills of a player who has played in games
SELECT a.PlayerName, AVG(b.Kills) AS AverageKills
FROM Player a
JOIN PlayerPlaysGame b
	ON a.PlayerID = b.PlayerID
GROUP BY a.PlayerID;

#Find the player's real name whose kills are greater than the average total kills
SELECT a.PlayerName, b.Kills
FROM Player a 
JOIN PlayerPlaysGame b
	ON a.PlayerID = b.PlayerID
WHERE b.Kills > (SELECT AVG(Kills)
				FROM PlayerPlaysGame);

#Find the players' Team's Specific Region and Team Name and their worst score (MAX death)
SELECT b.PlayerID, a.SpecificRegion, b.TeamName, MAX(c.Deaths) AS GreatestDeaths
FROM CurrentTeam a
INNER JOIN PlayerBITeam b
	ON a.TeamName = b.TeamName
INNER JOIN PlayerPlaysGame c
	ON b.PlayerID = c.PlayerID
GROUP BY c.PlayerID;

#Select the Team Name and count who has won the most Tournaments
SELECT b.FinalWinner, COUNT(*) as NumberOfWins
FROM CurrentTeam a
JOIN Tournament b
WHERE a.TeamName = b.FinalWinner
GROUP BY b.FinalWinner
HAVING COUNT(*) >= ALL(
	SELECT COUNT(*)
    FROM Tournament
    GROUP BY FinalWinner);

#Find the player's ID, Country, and Position who has played the most games
SELECT a.PlayerID, a.PlayerCountry, a.PlayerPosition
FROM Player a
JOIN PlayerPlaysGame b
ON a.PlayerID = b.PlayerID
GROUP BY b.PlayerID
HAVING COUNT(*) >= ALL(
	SELECT COUNT(*)
    FROM PlayerPlaysGame
    GROUP BY PlayerID);

#---------------------
#Without aggregation:

#Find all pairs of players who have the same death score
SELECT a.PlayerID AS FirstPlayer, b.PlayerID AS SecondPlayer
FROM PlayerPlaysGame a
JOIN PlayerPlaysGame b
	ON a.Deaths = b.Deaths
WHERE a.PlayerID > b.PlayerID;

#Get the real names of players and the champions they have banned, if any
SELECT a.PlayerName, b.ChampionBanned
FROM Player a
LEFT OUTER JOIN PlayerPlaysGame b
	ON a.PlayerID = b.PlayerID;

#For each team,find the player IDs of its members and return team info
SELECT TeamName, SpecificRegion, PlayerID
FROM PlayerBITeam
NATURAL JOIN CurrentTeam;

#Find pairs of players (by ID) who pick the same champions, and the name of the champion
SELECT a.PlayerID, b.PlayerID, ChampionPicked
FROM PlayerPlaysGame a
JOIN PlayerPlaysGame b
	USING (ChampionPicked)
WHERE a.PlayerID > b.PlayerID;

#List all the players without a champion ban
SELECT a.PlayerName, b.ChampionBanned
FROM Player a
LEFT OUTER JOIN PlayerPlaysGame b
	ON a.PlayerID = b.PlayerID
WHERE b.ChampionBanned IS NULL;
