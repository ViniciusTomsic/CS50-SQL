
-- *** The Lost Letter ***
-- I know from where the letter was send, i need to find the package_id, with package_id I will find the scan with action = 'Drop'
SELECT * FROM addresses
WHERE id = (
    SELECT address_id FROM scans
    WHERE action = "Drop" AND package_id = (
        SELECT id FROM packages
        WHERE from_address_id = (
            SELECT id FROM addresses
            WHERE address = "900 Somerville Avenue"
        )
    )
);

-- *** The Devious Delivery ***
-- I will find the contents and addres where from_address IS NULL
SELECT contents FROM packages
WHERE from_address_id IS NULL
UNION
SELECT "type" FROM addresses
WHERE id = (
    SELECT address_id FROM scans
    WHERE action = 'Drop' AND package_id = (
        SELECT id FROM packages
        WHERE from_address_id IS NULL
    )
);


-- *** The Forgotten Gift ***
SELECT contents FROM packages
WHERE from_address_id = (
    SELECT id FROM addresses
    WHERE address = "109 Tileston Street"
)
UNION
SELECT name FROM drivers
WHERE id = '17';
