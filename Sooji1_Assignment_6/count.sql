/*
Counts total tuples from each relation.
*/

SELECT COUNT(*) AS CurrentTeam_Count FROM CurrentTeam;
SELECT COUNT(*) AS Game_Count FROM Game;
SELECT COUNT(*) AS Player_Count FROM Player;
SELECT COUNT(*) AS PlayerBITeam_Count FROM PlayerBITeam;
SELECT COUNT(*) AS PlayerPlaysGame_Count FROM PlayerPlaysGame;
SELECT COUNT(*) AS Tournament_Count FROM Tournament;