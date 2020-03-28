# Basic CASE statements

### (1)
SELECT
	team_api_id,
	team_long_name
FROM teams_germany
WHERE team_long_name IN ( 'FC Schalke 04' , 'FC Bayern Munich');

### (2)
SELECT 
	CASE WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
        WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
GROUP BY home_team;

# CASE statements comparing column values

### (1)
SELECT date,
	CASE WHEN home_goal > away_goal THEN 'Home win!'
         WHEN home_goal < away_goal THEN 'Home loss :(' 
         ELSE 'Tie' END AS outcome
FROM matches_spain;

### (2)
SELECT 
	m.date,
	t.team_long_name AS opponent, 
	CASE WHEN m.home_goal > away_goal THEN 'Home win!'
         WHEN m.home_goal < away_goal THEN 'Home loss :('
         ELSE 'Tie' END AS outcome
FROM matches_spain AS m
LEFT JOIN teams_spain AS t
ON m.awayteam_id = t.team_api_id;

### (3)
SELECT 
	m.date,
	t.team_long_name AS opponent,
	CASE WHEN m.home_goal > m.away_goal THEN 'Barcelona win!'
         WHEN m.home_goal < m.away_goal THEN 'Barcelona loss :(' 
         ELSE 'Tie' END AS outcome 
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.awayteam_id = t.team_api_id
WHERE m.hometeam_id = 8634; 

# CASE statements comparing two column values part 2
SELECT  
	m.date,
	t.team_long_name AS opponent,
	CASE WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
         WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :(' 
         ELSE 'Tie' END AS outcome
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.hometeam_id = t.team_api_id
WHERE m.awayteam_id = 8634;

