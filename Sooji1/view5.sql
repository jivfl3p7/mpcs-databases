/*
Develop and test at least two views and at least four queries that use the views.
*/

#Views

#View showing the Kills + Assists of all players who have played a game
CREATE VIEW PositiveScore AS
SELECT PlayerID AS ID, Kills + Assists AS KA, Deaths AS D
FROM PlayerPlaysGame;

#View showing all the players, their individual country, their team country, and their position
CREATE VIEW PlayerTeamInfo AS
SELECT a.PlayerID, a.PlayerCountry, a.PlayerPosition, b.SpecificRegion AS TeamCountry
FROM Player a
INNER JOIN PlayerBITeam c
	ON a.PlayerID = c.PlayerID
INNER JOIN CurrentTeam b
	ON b.TeamName = c.TeamName;

#Queries using views

#Select the player ID and his/her maximum Kills + Asissts
SELECT ID, MAX(KA) AS KA, D
FROM PositiveScore
GROUP BY ID;

#Select the country with the most number of player's countries being equal to the team countries
SELECT PlayerCountry AS Country, COUNT(PlayerCountry = TeamCountry) AS Count
FROM PlayerTeamInfo
GROUP BY PlayerCountry
HAVING COUNT(PlayerCountry = TeamCountry) >= ALL(
	SELECT COUNT(PlayerCountry = TeamCountry)
    FROM PlayerTeamInfo
    GROUP BY PlayerCountry);

#Return distinct countries (by player's country) with the number of Top, Mid, Supp, Sub, and Jungler positions.
SELECT PlayerCountry AS Country, PlayerPosition AS Position, COUNT(PlayerPosition) AS CountPosition
FROM PlayerTeamInfo
GROUP BY PlayerPosition, PlayerCountry
ORDER BY PlayerCountry;

#What average Kill + Assist did Smeb have?
SELECT AVG(KA) AS AverageKA
FROM PositiveScore
WHERE ID = 'Smeb';