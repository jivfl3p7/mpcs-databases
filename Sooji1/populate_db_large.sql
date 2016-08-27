/*
This is the new loaded data, randomly generated using Python scripts. They are for
the relations Player (approx. 2000 tuples), PlayerBITeam (approx. 2000 tuples), and
CurrentTeam (approx. 200 tuples).

I have not added anything to tournaments because there are very specific tournaments 
that players can play in. Because Game and PlayerPlaysGame depends on Tournaments,
they too remain the same.
*/

#Contains ~200 tuples
LOAD DATA
	LOCAL INFILE "data/CurrentTeam.txt"
    REPLACE INTO TABLE CurrentTeam
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n';

#Contains ~2000 tuples
LOAD DATA
	LOCAL INFILE "data/Player.txt"
    REPLACE INTO TABLE Player
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n';

#Contains ~2000 tuples
LOAD DATA
	LOCAL INFILE "data/PlayerBITeam.txt"
    REPLACE INTO TABLE PlayerBITeam
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n';