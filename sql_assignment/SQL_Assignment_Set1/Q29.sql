/*
Q29.
Table: TVProgram
Column Name Type
program_date date
content_id int
channel varchar
(program_date, content_id) is the primary key for this table.
This table contains information about the programs on the TV.
content_id is the id of the program in some channel on the TV.

Table: Content
Column Name Type
content_id varchar
title varchar
Kids_content enum
content_type varchar
content_id is the primary key for this table.

Kids_content is an enum that takes one of the values ('Y', 'N') where:
'Y' means content for kids, otherwise 'N' is not content for kids.
content_type is the category of the content as movies, series, etc.

Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
Return the result table in any order. */

CREATE TABLE tv_program(
        program_date DATETIME,
        content_id INT,
        channel VARCHAR(50),
        CONSTRAINT pk_tvprogram PRIMARY KEY(program_date, content_id)
);
INSERT INTO tv_program 
VALUES
		('2020-06-10 18:00',1,'LC-channel'),
        ('2020-05-11 12:00',2,'LC-channel'),
        ('2020-05-12 12:00',3,'LC-channel'),
        ('2020-05-13 14:00',4,'DISNEY-CH'),
        ('2020-06-18 14:00',4,'DISNEY-CH'),
        ('2020-07-15 16:00',5,'DISNEY-CH');

CREATE TABLE content(
        content_id INT,
        title VARCHAR(50),
        kids_content ENUM('Y','N'),
        content_type VARCHAR(50),
        CONSTRAINT pk_content PRIMARY KEY(content_id)
);
INSERT INTO content 
VALUES
        (1,'LEETCODE MOVIE', 'N','MOVIES'),
        (2,'ALG. FOR KidS', 'Y','SERIES'),
        (3,'DATABASE SOLS', 'N','SERIES'),
        (4,'ALADDIN', 'Y','MOVIES'),
        (5,'CINDERELLA', 'Y','MOVIES');

SELECT DISTINCT c.title
FROM content c 
JOIN tv_program t
ON c.content_id = t.content_id 
WHERE c.kids_content = 'Y' AND c.content_type = 'MOVIES' AND DATE_FORMAT(t.program_date, '%Y-%m') = '2020-06' 


