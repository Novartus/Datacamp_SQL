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