-- Q6. Query the names of all the Japanese cities in the CITY table.The COUNTRYCODE for Japan is JPN.
SELECT NAME 
FROM city_table
WHERE COUNTRYCODE = 'JPN';