/*
Reverting to the pre-Assignment 6 data for this Assignment 7.
*/

DROP TABLE IF EXISTS PlayerPlaysGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Tournament;
DROP TABLE IF EXISTS PlayerBITeam;
DROP TABLE IF EXISTS CurrentTeam;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS PlayerCount; #This is for a trigger

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
