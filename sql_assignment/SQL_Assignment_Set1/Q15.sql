/*
Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end
with vowels. Your result cannot contain duplicates. */
SELECT DISTINCT City
FROM stationdata
WHERE City NOT REGEXP ('^[a e i o u]') OR City NOT REGEXP ('[a e i o u]$');