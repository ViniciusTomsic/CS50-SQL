SELECT name FROM (
    SELECT name, MIN(pupils) FROM expenditures
    JOIN districts ON expenditures.district_id = districts.id
)

