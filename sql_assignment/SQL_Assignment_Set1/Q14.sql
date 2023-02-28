/*
Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot
contain duplicates */
SELECT DISTINCT City 
FROM stationdata 
WHERE City NOT REGEXP '[a e i o u]$';
