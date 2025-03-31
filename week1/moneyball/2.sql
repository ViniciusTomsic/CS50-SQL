SELECT salaries.year AS year, salary FROM salaries
JOIN players ON player_id = players.id
WHERE player_id = (
    SELECT id FROM players
    WHERE last_name = "Ripken" AND first_name = "Cal"
)
ORDER BY year DESC
