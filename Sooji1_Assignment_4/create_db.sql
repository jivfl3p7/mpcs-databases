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
	TournamentName varchar(25) PRIMARY KEY,
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
    TournamentName varchar(25)
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
	TournamentName varchar(25),
	PRIMARY KEY(GameName, GameWeek, GameNumber, PlayerID, TournamentName),
	CONSTRAINT fk_playingtogamename FOREIGN KEY (TournamentName, GameWeek, GameName, GameNumber)
    REFERENCES Game(TournamentName, Week, GameName, GameNumber),
    CONSTRAINT fk_playigtoplayer FOREIGN KEY (PlayerID)
    REFERENCES Player(PlayerID));

/*The comment I received about Assignment 3 on this is something I looked at. Dragos suggested creating a surrogate key
which I'm not entirely sure how to do, but I looked it up on StackOverflow and Google and it all seems to suggest that
either way is fine. I commented in response to the Assignment 3 but haven't received a response so I'm leaving this here for
now. However, I did want to acknowledge it and if you think a surrogate key would work better in this instance, I will replace the
composite key with the surrogate key for both PlayerPlaysGame and Game tables.*/