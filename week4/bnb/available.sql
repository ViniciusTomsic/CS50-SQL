CREATE VIEW available AS
SELECT listings.id, property_type, host_name, date
FROM listings
JOIN availabilities ON listing_id = listings.id
WHERE available = "TRUE";
