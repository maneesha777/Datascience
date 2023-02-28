/*Q.51 
Write an SQL Query to report the name, population, and area of the big countries. 
Return the result table in any order . */ 

CREATE TABLE world(
	name VARCHAR(50) NOT NULL,
	continent VARCHAR(50) NOT NULL,
	area INT NOT NULL,
	population BIGINT NOT NULL,
	gdp BIGINT NOT NULL,
	PRIMARY KEY(name)
	);
INSERT INTO world 
VALUES 
	    ('Afghanistan', 'Asia', 652230, 25500100, 203430000000),
        ('Albania', 'Europe', 28748, 2831741, 12960000000),
        ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
        ('Andorra', 'Europe', 468, 78115, 3712000000),
        ('Angola', 'Africa', 1246700, 20609294, 100990000000);
SELECT name,
       population,
       area
FROM world
WHERE (area >= 3000000 OR population >= 25000000);