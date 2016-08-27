/**
To show that your triggers work create a script triggerscenarios.sql that shows, for each trigger,
the effect of two database modifications. One modification should activate the trigger while the
other should not. In the script, show queries that demonstrate that the trigger has an effect in
the first case and not in the second one. 
*/

#----------------
/**FIRST TRIGGER

CREATE TRIGGER PlayerCountTrigger
	AFTER INSERT ON Player
    FOR EACH ROW
		BEGIN
			IF (NEW.PlayerCountry = 'Japan') THEN
				INSERT IGNORE INTO PlayerCount(Player)
				VALUES(NEW.PlayerID);
			END IF;
	END;|
*/
#PlayerCountTrigger Working Modification
INSERT INTO Player VALUES ('HelloKitty', 'FirstName LastName', 'Japan', 'Mid');
	#This should work since it is inserting into relation 'Player' and the player is from Japan.

#PlayerCountTrigger Not-Working Modification
INSERT INTO Player VALUES ('IronMan', 'Tony Stark', 'United States', 'Jungler');
	#This shouldn't work since it is not a player from Japan.'

#PlayerCountTrigger Queries
SELECT Player
FROM PlayerCount;
	#This should only show the newly inserted player tuples after trigger was created (aka HelloKitty).
    #If the second modification activated the trigger, IronMan will also be in the table.

SELECT PlayerID #This is to check that the second modification did actually work.
FROM Player
WHERE PlayerID = 'IronMan';

#This should return 1 if only the first modification activated the trigger.
#If the second one DID activate the trigger, then the count should be "2".
SELECT COUNT(*)
FROM PlayerCount;

#------------------
/** SECOND TRIGGER
CREATE TRIGGER GameNumberCapCheckInsertTrigger
	BEFORE INSERT ON Game
	FOR EACH ROW
    BEGIN
		IF (NEW.GameNumber > 5) THEN
			SET NEW.GameNumber = 5;
		END IF;
	END;|
*/
#GameNumberCapCheckInsertTrigger Working Modification
INSERT INTO Game VALUES('paiN vs CLG', 7, 1, 1, 'paiN Gaming', 'Counter Logic Gaming', '2015 Season World Championship');
	#GameNumber here is 7, which is greater than 5.

#GameNumberCapCheckInsertTrigger Not-Working Modification
INSERT INTO Game VALUES('CLG vs paiN', 4, 1, 4, 'paiN Gaming', 'Counter Logic Gaming', '2015 Season World Championship');
	#GameNumber is <5, so this should not trigger.

#Game NumberCapCheckInsertTrigger Queries
#Query that should return the modified tuple that was inserted above (first one) with GameNumber as 5.
#If it was not modified, this will not return.
SELECT GameName, GameNumber, Week, TournamentName
FROM Game
WHERE GameName = 'paiN vs CLG'
AND GameNumber = 5
AND Week = 1
AND TournamentName = '2015 Season World Championship';

#Query that should return the un-modified tuple that was inserted above (second one) with GameNumber still as 4.
#If it was wrongfully modified, this will not return.
SELECT GameName, GameNumber, Week, TournamentName
FROM Game
WHERE GameName = 'CLG vs paiN'
AND GameNumber = 4
AND Week = 1
AND TournamentName = '2015 Season World Championship';

#--------------------
/** THIRD TRIGGER
CREATE TRIGGER PlayerNullPositionTrigger
	BEFORE INSERT ON Player
	FOR EACH ROW
		BEGIN
			IF (NEW.PlayerPosition = NULL) THEN
				SET NEW.PlayerPosition = 'Sub';
			END IF;
	END;|
*/
#PlayerNullPositionTrigger Working Modification
INSERT INTO Player VALUES ('Totoro', 'First Last', 'Japan', NULL);

#PlayerNullPositionTrigger Not-Working Modification
INSERT INTO Player VALUES ('Cat', 'Meowth DasRight', 'Space', 'Mid');

#PlayerNullPositionTrigger Queries
SELECT PlayerID, PlayerPosition
FROM Player
WHERE PlayerID = 'Totoro';
#This should show that the PlayerPosition has been changed from NULL to 'Sub'.

SELECT PlayerID, PlayerPosition
FROM Player
WHERE PlayerID = 'Cat';
#This should show that no trigger was activated and 'Mid' was not changed to 'Sub'.