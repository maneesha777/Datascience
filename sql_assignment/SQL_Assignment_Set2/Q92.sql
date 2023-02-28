/* Q.92 
Write an SQL Query to report for each install date, the number of players 
that installed the game on that day, and the day one retention. */

CREATE TABLE activity(
        player_id INT,
        device_id INT,
        event_date DATE,
        games_played INT,
        CONSTRAINT pk_activity PRIMARY KEY(player_id, event_date)
    );
INSERT INTO activity 
VALUES 
        (1,2,'2016-03-01',5),
        (1,2,'2016-03-02',6),
        (2,3,'2017-06-25',1),
        (3,1,'2016-03-01',0),
        (3,4,'2018-07-03',5);