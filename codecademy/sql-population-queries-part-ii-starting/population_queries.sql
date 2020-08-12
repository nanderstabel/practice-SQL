-- How many entries in the database are from Africa?
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

-- What was the total population of Oceania in 2005?

SELECT SUM(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE year = 2005
	AND countries.continent = 'Oceania';

-- What is the average population of countries in South America in 2003?

SELECT AVG(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE year = 2003
	AND countries.continent = 'South America';

-- What country had the smallest population in 2007?

SELECT countries.name,
	MIN(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?

SELECT AVG(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';

-- How many countries have the word "The" in their name?

SELECT COUNT(*)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.name LIKE '%The%';

-- What was the total population of each continent in 2010?

SELECT countries.continent, SUM(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY countries.continent;
