SELECT performances.year AS year, SUM(performances.HR) AS h FROM performances
JOIN players ON players.id = performances.player_id
WHERE (players.first_name = "Ken") AND (players.last_name = "Griffey") AND
    (birth_year = "1969")
GROUP BY performances.year
ORDER BY year DESC
