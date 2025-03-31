SELECT players.first_name, players.last_name, salaries.salary FROM players
JOIN salaries ON salaries.player_id = players.id
WHERE year = '2001'
ORDER BY salary, first_name, last_name, players.id
LIMIT 50
