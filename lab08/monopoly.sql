
--

-- This SQL script builds a monopoly database, deleting any pre-existing version.

--

-- @author lauren ebels

-- @version 10/26/18

--



-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.

DROP TABLE IF EXISTS PropertiesPlayerGame;

DROP TABLE IF EXISTS PlayerGame;

DROP TABLE IF EXISTS Game;

DROP TABLE IF EXISTS Player;

DROP TABLE IF EXISTS Properties;



-- Create the schema.

CREATE TABLE Game (

	ID integer PRIMARY KEY, 

	time timestamp

	);



CREATE TABLE Player (

	ID integer PRIMARY KEY, 

	emailAddress varchar(50) NOT NULL,

	name varchar(50)

	);



CREATE TABLE PlayerGame (

	ID integer PRIMARY KEY,

	gameID integer REFERENCES Game(ID), 

	playerID integer REFERENCES Player(ID),

	score integer,

	cash money,

	location int

	);



CREATE TABLE Properties (

	ID integer PRIMARY KEY,

	name varchar(25)

	);



CREATE TABLE PropertiesPlayerGame (

	ID integer PRIMARY KEY,

	playerGameID integer REFERENCES PlayerGame(ID),

	propertiesID integer REFERENCES Properties(ID),

	houses integer,

	hotels boolean

	);



-- Allow users to select data from the tables.

GRANT SELECT ON Game TO PUBLIC;

GRANT SELECT ON Player TO PUBLIC;

GRANT SELECT ON PlayerGame TO PUBLIC;

GRANT SELECT ON Properties TO PUBLIC;

GRANT SELECT ON PropertiesPlayerGame TO PUBLIC;



-- Add sample records.

INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');

INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');

INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');



INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');

INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');

INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');



--Properties(ID, name)

INSERT INTO Properties VALUES (1, 'Park Place');

INSERT INTO Properties VALUES (2, 'Boardwalk');

INSERT INTO Properties VALUES (3, 'Virginia Avenue');

INSERT INTO Properties VALUES (4, 'St. James Place');

INSERT INTO Properties VALUES (5, 'Tennessee Avenue');

INSERT INTO Properties VALUES (6, 'North Carolina Avenue');



--PlayerGame(ID, gameID, playerID, score, cash, location)

INSERT INTO PlayerGame VALUES (1, 1, 1, 50, 0.00, 3);

INSERT INTO PlayerGame VALUES (2, 1, 2, 27, 0.00, 28);

INSERT INTO PlayerGame VALUES (3, 1, 3, 96, 2350.00, 14);

INSERT INTO PlayerGame VALUES (4, 2, 1, 52, 1000.00, 4);

INSERT INTO PlayerGame VALUES (5, 2, 2, 44, 0.00, 1);

INSERT INTO PlayerGame VALUES (6, 2, 3, 19, 500.00, 40);

INSERT INTO PlayerGame VALUES (7, 3, 2, 36, 0.00, 33);

INSERT INTO PlayerGame VALUES (8, 3, 3, 28, 5500.00, 20);



--PropertiesPlayerGame(ID, playerGameID, propertiesID, houses, hotels)

INSERT INTO PropertiesPlayerGame VALUES (1, 8, 3, 2, TRUE);

INSERT INTO PropertiesPlayerGame VALUES (2, 6, 3, 0, FALSE);

INSERT INTO PropertiesPlayerGame VALUES (3, 1, 6, 4, FALSE);

INSERT INTO PropertiesPlayerGame VALUES (4, 4, 2, 3, TRUE);


--8.1

--a

--SELECT * FROM Game
--ORDER BY time DESC;

--b

--SELECT * FROM Game
--WHERE time BETWEEN DateAdd(DD,-7,GETDATE()) AND GETDATE();

--c

--SELECT * FROM Player
--WHERE name is not NULL;

--d

--SELECT playerID FROM PlayerGame
--WHERE score > 2000;

--e

--SELECT name FROM Players
--WHERE emailAddress LIKE %gmail%;



--8.2

--a

--SELECT score FROM 
--PlayerGame JOIN Player
--ON PlayerGame.playerID = PlayerID
--WHERE Player.name = "The King"
--ORDER BY score DESC;

--b

--SELECT name FROM
--Player JOIN PlayerGame
--ON Player.ID = PlayerGame.playerID
--WHERE PlayerGame.score = 
--(SELECT MAX(score) FROM 
--PlayerGame JOIN Game
--ON PlayerGame.gameID = Game.ID
--WHERE
--Game.time = '2006-06-28 13:20:00')

--c

--p1.ID and p2.ID are primary keys and unique identifiers, so even
-- if both players have the same name they can be differentiated
-- through their ID assignments.

--d

--Joining a table to itself is useful when we want to compare one
-- value of a column in a table with other values in that same column.