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
INSERT INTO tournament VALUES ('Dwayne Johnson');
INSERT INTO wins VALUES (21,22,21);
INSERT INTO wins VALUES (23,24,23);
INSERT INTO wins VALUES (2,3,30);
INSERT INTO matches VALUES (21,22);
INSERT INTO matches VALUES (23,24);
INSERT INTO matches VALUES (3,2);
select * from tournament;
SELECT id FROM matches WHERE pID1 = 1 and pID2= 2 or pID2 = 1 and pID1= 2;

select id, playerName, num_wins
from (SELECT winner_id, count(match_id) as num_wins 
                    FROM wins 
                    group by winner_id 
                    order by num_wins)as R1  right join tournament on R1.winner_id= tournament.id;
/* with loses and order by wins*/
select id, playerName, num_wins
from (SELECT winner_id, count(match_id) as num_wins 
                    FROM wins 
                    group by winner_id 
                    order by num_wins)as R1  right join tournament on R1.winner_id= tournament.id order by num_wins;

SELECT winner_id,tournament.playerName, count(match_id) as num_wins 
                    FROM wins join tournament on winner_ID= tournament.id
                    group by winner_id,tournament.playerName 
                    order by num_wins;