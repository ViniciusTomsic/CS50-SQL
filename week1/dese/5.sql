SELECT city, "number of public schools" FROM (
    SELECT city, COUNT(*) AS "number of public schools" FROM schools
    WHERE type = "Public School"
    GROUP BY city
)
WHERE "number of public schools" <= 3
ORDER BY "number of public schools" DESC, city
