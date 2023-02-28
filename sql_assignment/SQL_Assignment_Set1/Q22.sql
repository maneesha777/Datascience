/* Q.22 
Write an SQL query to find the type of weather in each country for November 2019. 
The type of weather is:
● Cold if the average weather_state is less than or equal 15,
● Hot if the average weather_state is greater than or equal to 25, and
● Warm otherwise.
Return result table in any order. */

CREATE TABLE countries(
        country_id INT,
        country_name VARCHAR(20),
        PRIMARY KEY(country_id)
	);
INSERT INTO countries 
VALUES
        (2, 'USA'),
        (3, 'AUSTRALIA'),
        (7, 'PERU'),
        (5, 'CHINA'),
        (8, 'MOROCCO'),
        (9, 'SPAIN');

CREATE TABLE weather(
        country_id INT,
        weather_state INT,
        day DATE,
        CONSTRAINT pk_weather PRIMARY KEY(country_id, day) 
	);
INSERT INTO weather 
VALUES
        (2,15,'2019-11-01'),
        (2,12,'2019-10-28'),
        (2,12,'2019-10-27'),
        (3,-2,'2019-11-10'),
        (3,0,'2019-11-11'),
        (3,3,'2019-11-12'),
        (5,16,'2019-11-07'),
        (5,18,'2019-11-09'),
        (5,21,'2019-11-23'),
        (7,25,'2019-11-8'),
        (7,22,'2019-12-01'),
        (7,20,'2019-12-02'),
        (8,25,'2019-11-05'),
        (8,27,'2019-11-15'),
        (8,31,'2019-11-25'),
        (9,7,'2019-10-23'),
        (9,3,'2019-12-23');
SELECT country_name,
	   CASE 
           WHEN AVG(weather_state) <= 15 THEN 'COLD'
			WHEN AVG(weather_state) >= 25 THEN 'HOT'
			ELSE 'WARM'
			END AS avg_weather
FROM countries c
JOIN weather w 
ON c.country_id = w.country_id
WHERE w.day BETWEEN '2019-11-01' AND '2019-11-30'
GROUP BY c.country_id;