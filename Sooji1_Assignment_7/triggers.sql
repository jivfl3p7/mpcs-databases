/**
Create at least three triggers and show that they work. One of your triggers
should enforce an attribute constraint. You should also have a trigger that
keeps track of some quantity such as the number of tuples in a relation, or
an aggregate function of some attribute. 
*/

CREATE TABLE IF NOT EXISTS PlayerCount(
	Player varchar(25) PRIMARY KEY);

/*Trigger that keeps track of some quantity such as number of tuples in a relation*/
#Updates the new PlayerCount table with players who are from Japan
DELIMITER |
CREATE TRIGGER PlayerCountTrigger
	AFTER INSERT ON Player
    FOR EACH ROW
		BEGIN
			IF (NEW.PlayerCountry = 'Japan') THEN
				INSERT IGNORE INTO PlayerCount(Player)
				VALUES(NEW.PlayerID);
			END IF;
	END;|
    
/**Trigger that enforces an attribute constraint*/
#Insert trigger that caps the game number to number 5 (games do not go above 5)
#If it is above 5, instead of null, it will make it game number 5

CREATE TRIGGER GameNumberCapCheckInsertTrigger
	BEFORE INSERT ON Game
	FOR EACH ROW
    BEGIN
		IF (NEW.GameNumber > 5) THEN
			SET NEW.GameNumber = 5;
		END IF;
	END;|
    
#Trigger other examples
CREATE TRIGGER PlayerNullPositionTrigger
	BEFORE INSERT ON Player
	FOR EACH ROW
		BEGIN
			IF (NEW.PlayerPosition IS NULL) THEN
				SET NEW.PlayerPosition = 'Sub';
			END IF;
	END;|
