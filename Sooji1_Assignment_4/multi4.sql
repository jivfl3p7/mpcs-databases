# Find the player IDs and their countries of those who played in games called 'CLG vs FW'
SELECT a.PlayerID, a.PlayerCountry
FROM Player a, PlayerPlaysGame b
WHERE b.GameName = 'CLG vs FW'
AND a.PlayerID = b.PlayerID;

# Find all the player IDs and their team name whose position/role is Support.
SELECT PlayerPosition, TeamName
FROM Player a, PlayerBITeam b
WHERE b.PlayerID = a.PlayerID
AND a.PlayerPosition = 'Support';

/* Find the player ID and team names in games called CLG vs FW
who banned the same champion as Hojin did in games called paiN vs KOO.*/
SELECT a.PlayerID, b.TeamName
FROM PlayerPlaysGame a, PlayerBITeam b
WHERE GameName = 'CLG vs FW'
AND a.PlayerID = b.PlayerID
AND ChampionBanned = (SELECT ChampionBanned
	FROM PlayerPlaysGame
    WHERE PlayerID = 'Mylon'
    AND GameName = 'paiN vs KOO');

/* Find the player IDs who played Darius (ChampionPicked) played in the same championships
as GorillA did when he played Thresh.*/
SELECT PlayerID, TournamentName
FROM PlayerPlaysGame
WHERE ChampionPicked = 'Darius'
AND TournamentName = (SELECT TournamentName
	FROM PlayerPlaysGame
    WHERE PlayerID = 'GorillA'
    AND ChampionPicked = 'Thresh');
    
# Find the players and the countries where the players' countries match the countries of the teams they are in.
SELECT a.PlayerID, a.PlayerCountry
FROM Player a, PlayerBITeam b, CurrentTeam c
WHERE a.PlayerID = b.PlayerID
AND b.TeamName = c.TeamName
AND c.SpecificRegion = a.PlayerCountry;

/* Find the names of the games where the winner was Counter Logic Gaming and the loser was a team from
Brazil */
SELECT GameName
FROM Game, CurrentTeam a
WHERE Winner = 'Counter Logic Gaming'
AND Loser = a.TeamName
AND a.SpecificRegion = 'Brazil';