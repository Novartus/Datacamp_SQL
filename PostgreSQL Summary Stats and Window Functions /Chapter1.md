#  Which of the following is FALSE?
### Ans:Window functions can open a "window" to another table, whereas GROUP BY functions cannot.

# Numbering rows
SELECT
  *,
  ROW_NUMBER() OVER() AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;

# Numbering Olympic games in ascending order
SELECT
  Year,

  -- Assign numbers to each year
  ROW_NUMBER() OVER() AS Row_N
FROM (
  SELECT DISTINCT year
  FROM Summer_Medals
  ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;
