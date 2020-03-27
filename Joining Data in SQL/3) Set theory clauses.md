# Union

SELECT *
  FROM economies2010
	UNION
SELECT *
  FROM economies2015
ORDER BY CODE, YEAR;


# Union (2)
SELECT country_code
  FROM cities
	UNION
SELECT code
 FROM currencies
Order BY country_code;

# Union all

SELECT code, year
  FROM economies
	UNION ALL
SELECT country_code, year
  FROM populations
ORDER BY code, year;

# Intersect

SELECT code, year
  FROM economies
	INTERSECT
SELECT country_code, year
  FROM populations
ORDER BY code, year;

# Intersect (2)

SELECT name
  FROM countries
	INTERSECT
SELECT name
  FROM cities;

# Review union and intersect
Q:- Which of the following combinations of terms and definitions is correct?
Ans:- INTERSECT: returns only records appearing in both tables

# Except

SELECT name
  FROM cities
	EXCEPT
SELECT capital
  FROM countries
ORDER BY name;

# Except (2)

SELECT capital
  FROM countries
	EXCEPT
SELECT name
  FROM cities
ORDER BY capital;

# Semi-join
1)
SELECT country.code
  FROM countries AS country
WHERE country.region = 'Middle East';

2)
SELECT DISTINCT lang.name
FROM languages AS lang
ORDER BY lang.name;

# Relating semi-join to a tweaked inner join
Ans: DISTNICT

# Diagnosing problems using anti-join
1)
SELECT COUNT(*)
FROM countries
WHERE continent = 'Oceania';

2)
SELECT c1.code, c1.name, c2.basic_unit AS currency
FROM countries AS c1
INNER JOIN currencies AS c2
USING (code)
WHERE continent = 'Oceania';

3)
SELECT c1.code, c1.name
FROM countries AS c1
WHERE c1.continent = 'Oceania'
    AND code NOT IN
    (SELECT code 
    FROM currencies);

# Set theory challenge
SELECT name
FROM cities AS c1
WHERE country_code IN
(
    SELECT e.code
    FROM economies AS e
    UNION
    SELECT c2.code
    FROM currencies AS c2
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);



