#  Which of the following is FALSE?
### Ans:Window functions can open a "window" to another table, whereas GROUP BY functions cannot.

# Numbering rows
SELECT
  *,
  ROW_NUMBER() OVER() AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;

