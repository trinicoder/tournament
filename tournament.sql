-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.



CREATE TABLE tournament ( playerName TEXT, id SERIAL );

CREATE TABLE matches ( pID1 integer,pID2 integer, id SERIAL );  
CREATE TABLE wins ( winner_ID integer,Loser_ID integer,match_ID integer, id SERIAL );            

DROP TABLE [ IF EXISTS ] name [, ...] [ CASCADE | RESTRICT ];  
DELETE FROM  tournament WHERE id = 2;
DELETE FROM tournament;
INSERT INTO matches VALUES (3,4 );
INSERT INTO tournament VALUES ('Bruno Walton' );
INSERT INTO tournament VALUES ("Dwayne Johnson");
INSERT INTO tournament VALUES ('Cathy Burton');
INSERT INTO tournament VALUES ('Diane Grant');
INSERT INTO wins VALUES (1,2,10);
INSERT INTO wins VALUES (1,3,20);
INSERT INTO wins VALUES (2,3,30);
INSERT INTO matches VALUES (1,2);
INSERT INTO matches VALUES (1,3);
INSERT INTO matches VALUES (3,2);
select * from tournament;
SELECT id FROM matches WHERE pID1 = 1 and pID2= 2 or pID2 = 1 and pID1= 2;