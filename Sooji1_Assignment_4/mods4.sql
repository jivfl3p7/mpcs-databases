#Insert 1
 
INSERT INTO CurrentTeam
VALUES('Star Horn Royal Club', 'China');

#Insert 2
INSERT INTO Player
VALUES('Lies', 'Guo Hao-Tian', 'China', 'Top');

#Insert 3
INSERT INTO PlayerBITeam
VALUES('Lies', 'Star Horn Royal Club');

#Insert 1 that we will delete later
INSERT INTO CurrentTeam
VALUES('Delete', 'Fairyland');

#Insert 2 that we will delete later
INSERT INTO Player
VALUES('Cat', 'Cheshire Cat', 'Wonderland', 'Jungle');

#Delete 1
DELETE FROM CurrentTeam
WHERE TeamName = 'Delete'; #Since TeamName is the primary key, I don't need to worry about checking that the other attributes match

#Delete 2
DELETE FROM Player
WHERE PlayerID = 'Cat'; #Again, this is the primary key

#Create a table that we can work with for this assignment
/* The data I am working with makes it difficult to insert a
subquery, since all the tables tend to be very unique. Updating
the data also could cause potential problems since many of the tables
are related to each other. So I have done the inserts and deletes
above, and I am doing the inserting a subquery and updating below
with a Test table that I have created and can Drop afterwards. */

CREATE TABLE IF NOT EXISTS Test(
	PlayerIDTest varchar(50),
    PlayerDeathsTest int);

#Insert a subquery
INSERT INTO Test
(SELECT DISTINCT a.PlayerID, b.Deaths
FROM Player a, PlayerPlaysGame b
WHERE b.Kills = 1);

#Insert some random values too
INSERT INTO Test VALUES ('Mickey', 13);
INSERT INTO Test VALUES ('Minnie', 3);
INSERT INTO Test VALUES ('Goofy', 5);

#Update 1
UPDATE Test
SET PlayerDeathsTest = 5
WHERE PlayerDeathsTest > 5;

#Update 2
UPDATE Test
SET PlayerDeathsTest = 0
WHERE PlayerIDTest LIKE 'M%';