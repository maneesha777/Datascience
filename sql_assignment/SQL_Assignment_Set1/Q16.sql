/*
Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with
vowels. Your result cannot contain duplicates */
SELECT DISTINCT City 
FROM stationdata 
WHERE City NOT REGEXP ('^[a e i o u]') AND City NOT REGEXP ('[a e i o u]$');
