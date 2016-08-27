#Select the player with the most number of kills in all of the games
SELECT PlayerID, Kills
FROM PlayerPlaysGame
WHERE Kills = (SELECT MAX(Kills) FROM PlayerPlaysGame);

#Find the average deaths when the ChampionPicked is Elise
SELECT AVG(Deaths)
FROM PlayerPlaysGame
WHERE ChampionPicked = 'Elise';

#Find the total number of wins for each ChampionPicked
SELECT ChampionPicked, COUNT(Win)
FROM PlayerPlaysGame
GROUP BY ChampionPicked;

#Find the number of players by country who play the Mid or Top position
SELECT PlayerCountry, COUNT(PlayerCountry)
FROM Player
WHERE PlayerPosition = 'Mid'
OR PlayerPosition = 'Top'
GROUP BY PlayerCountry;

#For players who are CURRENTLY in Counter Logic Gaming, find the average assists of all the games they have played
SELECT a.PlayerID, CAST(AVG(Assists) as decimal(7,2)) as AVGassist
FROM PlayerPlaysGame a, PlayerBITeam b
WHERE a.PlayerID = b.PlayerID
AND b.TeamName = 'Counter Logic Gaming'
GROUP BY PlayerID;

#Find the players and their current team who has had 0 kills before
SELECT PlayerID, a.TeamName
FROM PlayerPlaysGame, CurrentTeam a
WHERE Kills = 0
GROUP BY PlayerID;