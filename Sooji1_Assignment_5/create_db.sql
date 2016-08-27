/*
THINGS I HAVE CHANGED:
-----------------------
I have changed the TournamentName attribute for all the tables to take in
100 characters. I also updated the CurrentTeam to only be two attributes,
to reflect my updated ERD.

TESTING:
--------
So that I wouldn't run into the same problem as the past two assignments,
I dropped all of my tables and started over. I re-created the tables. For
the composite keys, I chose not to do a surrogate key because it is working
fine for my data, and it was something that I was told by Dragos was fine.

So that I can ensure this works, I may try to bring it in early to class and
double check with one of you... I would really rather not lose 20 points just for
this single issue, when I know my queries are working :/

I also re-did the populate_db and it worked for me! Hopefully it works for you as well.

*/

CREATE TABLE IF NOT EXISTS Player(
	PlayerID varchar(25) PRIMARY KEY,
    PlayerName varchar(25),
    PlayerCountry varchar(25),
    PlayerPosition varchar(25));
    
CREATE TABLE IF NOT EXISTS CurrentTeam(
	TeamName varchar(25) PRIMARY KEY,
    SpecificRegion varchar(25));

CREATE TABLE IF NOT EXISTS PlayerBITeam(
	PlayerID varchar(25),
    TeamName varchar(25),
    PRIMARY KEY (PlayerID, TeamName),
    CONSTRAINT fk_toplayer FOREIGN KEY (PlayerID)
		REFERENCES Player(PlayerID),
    CONSTRAINT fk_toteam FOREIGN KEY (TeamName)
		REFERENCES CurrentTeam(TeamName));

CREATE TABLE IF NOT EXISTS Tournament(
	TournamentName varchar(100) PRIMARY KEY,
    Location varchar(25),
    StartDate date,
    EndDate date,
    FinalWinner varchar(25),
    RunnerUp varchar(25));
    
CREATE TABLE IF NOT EXISTS Game(
	GameName varchar(25),
    GameNumber real,
    Week real,
    Stage real,
    Winner varchar(25),
    Loser varchar(25),
    TournamentName varchar(100)
    REFERENCES Tournament(TournamentName),
    PRIMARY KEY (TournamentName, Week, GameName, GameNumber));

CREATE TABLE IF NOT EXISTS PlayerPlaysGame(
	PlayerID varchar(25),
	Kills int,
	Deaths int,
	Assists int,
	Win int,
	ChampionPicked varchar(25),
	ChampionBanned varchar(25),
	GameName varchar(25),
	GameWeek real,
	GameNumber real,
	TournamentName varchar(100),
	PRIMARY KEY(GameName, GameWeek, GameNumber, PlayerID, TournamentName),
	CONSTRAINT fk_playingtogamename FOREIGN KEY (TournamentName, GameWeek, GameName, GameNumber)
    REFERENCES Game(TournamentName, Week, GameName, GameNumber),
    CONSTRAINT fk_playigtoplayer FOREIGN KEY (PlayerID)
    REFERENCES Player(PlayerID));
