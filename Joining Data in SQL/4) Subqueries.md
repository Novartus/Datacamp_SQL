# Subquery inside where
 ## (1) 
SELECT AVG(life_expectancy)
FROM populations 
WHERE Year=2015;
## (2)
SELECT *
FROM populations
WHERE life_expectancy > 1.15 *
    (SELECT AVG(life_expectancy)
    FROM populations
    WHERE year = 2015)
    AND year = 2015;