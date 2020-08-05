
--CODECADEMY GIST: https://gist.github.com/ca6930bc38234a41ba7ccb61f4b9ed0f

-- This is the first query:

--What years are covered by the dataset?
SELECT COUNT(DISTINCT year)
FROM population_years;

-- Add your additional queries below:

-- What is the largest population size for Gabon in this dataset?
SELECT population
FROM population_years
WHERE country = 'Gabon'
ORDER BY population DESC
LIMIT 1;


--What were the 10 lowest population countries in 2005?
SELECT *
FROM population_years
WHERE year = 2005
ORDER BY population ASC
LIMIT 10;


--What are all the distinct countries with a population of over 100 million in the year 2010?
SELECT DISTINCT country, population
FROM population_years
WHERE population > 100 AND year = 2010
ORDER BY population DESC;

SELECT COUNT(DISTINCT country)
FROM population_years
WHERE population > 100 AND year = 2010;

--How many countries in this dataset have the word “Islands” in their name?
SELECT DISTINCT country AS 'Countries having "Islands" in their name'
FROM population_years
WHERE country LIKE '%Islands%';

SELECT COUNT(DISTINCT country) AS 'No. of Countries having "Islands" in their name'
FROM population_years
WHERE country LIKE '%Islands%';


--What is the difference in population between 2000 and 2010 in Indonesia?

SELECT ((SELECT population
FROM population_years
WHERE country = 'Indonesia' AND year = 2010)-(SELECT population
FROM population_years
WHERE country = 'Indonesia' AND year = 2000)) AS 'Population Difference In Indonesia (2000-2010)';

--Manually figuring out Difference in Population
SELECT population, year
FROM population_years
WHERE country = 'Indonesia'
  AND (year = 2000 OR year = 2010);
