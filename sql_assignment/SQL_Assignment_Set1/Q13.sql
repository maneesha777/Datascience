/*
Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot
contain duplicates. */
SELECT DISTINCT city 
FROM stationdata 
WHERE City NOT REGEXP '^[a e i o u]';