/*
Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot
contain duplicates.
*/
SELECT DISTINCT city
FROM stationdata
WHERE City REGEXP '[a e i o u]$';