/**
Create at least five stored procedures, with at least two including a database
modification, and show that they work. 
*/

#For myself when testing and modifying.
DROP PROCEDURE IF EXISTS AddPlayerToTable;
DROP PROCEDURE IF EXISTS ChangeKills;
DROP PROCEDURE IF EXISTS GetCountryPlayers;
DROP PROCEDURE IF EXISTS GetPlayerID;
DROP PROCEDURE IF EXISTS GetKills;

/**Procedures that include database modification*/
DELIMITER |

#Procedure to add a player to the Player relation.
CREATE PROCEDURE AddPlayerToTable(
		IN addID		VARCHAR(25),
		IN addName		VARCHAR(25),
		IN addCountry	VARCHAR(25),
		IN addPosition	VARCHAR(25))
	BEGIN
		INSERT INTO Player(PlayerID, PlayerName, PlayerCountry, PlayerPosition)
        VALUES(addID, addName, addCountry, addPosition);
	END |

#Procedure to add tournaments to the Tournament relation given a player in winning team and player in losing team.
CREATE PROCEDURE AddTourn(
		IN addTourn		VARCHAR(100),
        IN addLoc		VARCHAR(25),
        IN addStartD		DATE,
        IN addEndD			DATE,
        IN nameWin		VARCHAR(25),
        IN nameLose		VARCHAR(25))
	BEGIN
		DECLARE winner VARCHAR(25);
        DECLARE loser VARCHAR(25);
	
		SET winner = (SELECT TeamName
					FROM PlayerBITeam
                    WHERE PlayerID = nameWin);
		SET loser = (SELECT TeamName
					FROM PlayerBITeam
                    WHERE PlayerID = nameLose);
		INSERT INTO Tournament
        VALUES(addTourn, addLoc, addStartD, addEndD, winner, loser);
	END |
        
/**Procedures that do not modify the database. */

#Procedure to return players from any country that is specified.
CREATE PROCEDURE GetCountryPlayers(
		IN country VARCHAR(25))
	BEGIN
		SELECT PlayerName
        FROM Player
        WHERE PlayerCountry = country;
	END |

#Procedure to get playerIDs from any team that is specified.
CREATE PROCEDURE GetPlayerID(
		IN team VARCHAR(25))
	BEGIN
		SELECT PlayerID
        FROM PlayerBITeam
        WHERE TeamName = team;
	END |

#Procedure to get the total kills of a player given a specified player ID.
CREATE PROCEDURE GetKills(
		IN player VARCHAR(25))
	BEGIN
		SELECT SUM(Kills)
        FROM PlayerPlaysGame
        WHERE PlayerID = player;
	END |