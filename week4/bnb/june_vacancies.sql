CREATE VIEW june_vacancies AS
SELECT
    id,
    property_type,
    host_name,
    (
        SELECT COUNT(*)
        FROM availabilities
        WHERE listing_id = listings.id AND available = "TRUE" AND date LIKE "2023-06%"
    ) AS days_vacant
FROM
    listings
WHERE
    days_vacant > 0

