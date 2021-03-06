#!/usr/bin/env python
# 
# tournament.py -- implementation of a Swiss-system tournament
#

import psycopg2


def connect():
    """Connect to the PostgreSQL database.  Returns a database connection."""
    return psycopg2.connect("dbname=tournament")


def deleteMatches():
    """Remove all the match records from the database."""
    DB = connect()
    c = DB.cursor()
    c.execute("DELETE FROM matches")
    DB.commit()
    DB.close()



def deletePlayers():
    """Remove all the player records from the database."""
    DB = connect()
    c = DB.cursor()
    c.execute("DELETE FROM tournament")
    DB.commit()
    DB.close()

def countPlayers():
    """Returns the number of players currently registered."""
    DB = connect()
    c = DB.cursor()
    c.execute("SELECT count(id) FROM tournament")
    result=c.fetchone()
    DB.close()
    return result[0]


def registerPlayer(name):
    """Adds a player to the tournament database.
  
    The database assigns a unique serial id number for the player.  (This
    should be handled by your SQL database schema, not in your Python code.)
  
    Args:
      name: the player's full name (need not be unique).

    """
    # cn=name
    # title='playerName'
    # data=[title,cn]
    DB = connect()
    c = DB.cursor()
    #cur.execute("INSERT INTO test (num, data) VALUES (%s, %s)",*/
    #c.execute("INSERT INTO tournament  (playerName) values ('al pachino2') ")
    #c.execute("INSERT INTO tournament name  values (%s)", name)
    #cur.execute('INSERT INTO %s (day, elapsed_time, net_time, length, average_speed, geometry) VALUES (%s, %s, %s, %s, %s, %s)', (escaped_name, day, ))
    c.execute("INSERT INTO tournament  VALUES (%s)", (name,))
    DB.commit()
    DB.close()




def playerStandings():
    """Returns a list of the players and their win records, sorted by wins.

    The first entry in the list should be the player in first place, or a player
    tied for first place if there is currently a tie.

    Returns:
      A list of tuples, each of which contains (id, name, wins, matches):
        id: the player's unique id (assigned by the database)
        name: the player's full name (as registered)
        wins: the number of matches the player has won
        matches: the number of matches the player has played
    """
    DB = connect()
    c = DB.cursor()
    c.execute("""SELECT winner_id,tournament.playerName count(match_id) as num_wins 
                    FROM wins join tournament
                    group by winner_id 
                    order by num_wins""")
    result= c.fetchall()
    CREATE TABLE matches ( pID1 integer,pID2 integer, id SERIAL );  
    c.execute("""SELECT 
                    FROM matches join tournament
                    group by winner_id 
                    order by num_wins""")
   
    for row in result:
        print row
    DB.close()

def reportMatch(winner, loser):
    """Records the outcome of a single match between two players.

    Args:
      winner:  the id number of the player who won
      loser:  the id number of the player who lost
    """
    DB = connect()
    c = DB.cursor()
    c.execute("SELECT id FROM matches WHERE pID1 = %s and pID2= %s or pID2 = %s and pID1= %s", (winner,loser,))
    result= c.fetchone()
    c.execute("INSERT INTO wins VALUES(%s,%s,%s)",(winner,loser,result[0],))
    DB.commit()
    DB.close()

 
def swissPairings():
    """Returns a list of pairs of players for the next round of a match.
  
    Assuming that there are an even number of players registered, each player
    appears exactly once in the pairings.  Each player is paired with another
    player with an equal or nearly-equal win record, that is, a player adjacent
    to him or her in the standings.
  
    Returns:
      A list of tuples, each of which contains (id1, name1, id2, name2)
        id1: the first player's unique id
        name1: the first player's name
        id2: the second player's unique id
        name2: the second player's name
    """
    #get all players, sort by number of wins.create matches with the 2 adjacent players
    c.execute("""SELECT id, playerName, num_wins
                    FROM (SELECT winner_id, count(match_id) as num_wins 
                        FROM wins 
                        group by winner_id 
                    )as R1  right join tournament on R1.winner_id= tournament.id order by num_wins""")
    result= c.fetchall()
    for row in result:
        print row

