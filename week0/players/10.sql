SELECT birth_country, AVG(height)*2.54 AS average_height FROM players
WHERE height IS NOT NULL AND birth_country IS NOT NULL
GROUP BY birth_country
HAVING COUNT(*) >= 10
ORDER BY average_height;
