-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.



CREATE TABLE tournament ( playerName TEXT, id SERIAL );

CREATE TABLE matches ( pID1 integer,pID2 integer, id SERIAL );             

DROP TABLE [ IF EXISTS ] name [, ...] [ CASCADE | RESTRICT ];  
DELETE FROM  tournament WHERE id = 2;
DELETE FROM tournament;
INSERT INTO matches VALUES (3,4 );
INSERT INTO tournament VALUES ('Bruno Walton' );
INSERT INTO tournament VALUES ("Dwayne Johnson");
INSERT INTO tournament VALUES ('Cathy Burton');
INSERT INTO tournament VALUES ('Diane Grant');

select * from tournament;
