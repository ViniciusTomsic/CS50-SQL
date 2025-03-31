SELECT districts.name AS district, staff_evaluations.unsatisfactory AS unsatisfactory FROM districts
JOIN staff_evaluations ON districts.id = staff_evaluations.district_id
WHERE (unsatisfactory IS NOT NULL) AND (unsatisfactory != "0")
ORDER BY unsatisfactory
LIMIT 10
