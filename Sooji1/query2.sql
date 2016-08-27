SELECT PlayerID
FROM PlayerPlaysGame
WHERE Kills > Deaths;

SELECT PlayerID, ChampionPicked
FROM PlayerPlaysGame
WHERE ChampionPicked LIKE 'E%'
AND Win = 1;

SELECT PlayerName
FROM Player
WHERE PlayerCountry != 'South Korea';

SELECT PlayerID
FROM PlayerBITeam
WHERE TeamName = 'KOO Tigers';

SELECT *
FROM Tournament
WHERE StartDate > 2014-01-01
AND FinalWinner LIKE 'S%';

SELECT GameName, GameNumber, Week, TournamentName, Winner
FROM Game;

SELECT GameName, GameNumber, GameWeek
FROM PlayerPlaysGame
WHERE ChampionPicked LIKE '_alista';
