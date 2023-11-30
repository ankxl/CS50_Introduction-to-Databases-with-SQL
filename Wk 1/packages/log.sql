
-- *** The Lost Letter ***
-- Find the address id for sender
SELECT id
FROM addresses
WHERE address = "900 Somerville Avenue";

-- Find the address id for receiver
SELECT id
FROM addresses
WHERE address LIKE "2 Finn%";

-- Find the package id for letter sent by sender address to receiver address
SELECT id, contents
FROM packages
WHERE from_address_id in (
                            SELECT id
                            FROM addresses
                            WHERE address = "900 Somerville Avenue"
                        ) AND
    to_address_id in (  SELECT id
                        FROM addresses
                        WHERE address LIKE "2 Finn%"
                    )
-- Join the packages and scans to identify the address id where the letter was delivered
SELECT packages.id, contents, scans.address_id
FROM packages
INNER JOIN scans
on packages.id = scans.package_id
WHERE from_address_id in (
                            SELECT id
                            FROM addresses
                            WHERE address = "900 Somerville Avenue"
                        ) AND
    to_address_id in (  SELECT id
                        FROM addresses
                        WHERE address LIKE "2 Finn%"
                    ) AND
    scans.action = "Drop";

-- Delivery address details
SELECT packages.id, contents, scans.address_id,addresses.id, addresses.type, addresses.address
FROM packages
INNER JOIN scans
on packages.id = scans.package_id
INNER JOIN addresses
on scans.address_id = addresses.id
WHERE from_address_id in (
                            SELECT id
                            FROM addresses
                            WHERE address = "900 Somerville Avenue"
                        ) AND
    to_address_id in (  SELECT id
                        FROM addresses
                        WHERE address LIKE "2 Finn%"
                    ) AND
    scans.action = "Drop";

-- *** The Devious Delivery ***
-- Find packages with no from address
SELECT *
FROM packages
WHERE from_address_id is NULL;

-- Find the drop off locations for packages with no address

SELECT scans.package_id, scans.address_id, scans.action, packages.to_address_id
FROM scans
INNER JOIN packages
on packages.id = scans.package_id
WHERE from_address_id is NULL
        AND scans.action = "Drop";

-- The actual drop off address details
SELECT scans.package_id, scans.address_id, scans.action, packages.to_address_id, addresses.address, addresses.type
FROM scans
INNER JOIN packages
on packages.id = scans.package_id
INNER JOIN addresses
ON addresses.id = scans.address_id
WHERE from_address_id is NULL
        AND scans.action = "Drop";


-- *** The Forgotten Gift ***
-- address id for the granddaughter

SELECT *
FROM addresses
WHERE address = "728 Maple Place";

-- address id for sender
SELECT *
FROM addresses
WHERE address = "109 Tileston Street";

-- PAckages sent from sender address to receiver address
SELECT *
FROM packages
WHERE from_address_id IN (
                            SELECT id
                            FROM addresses
                            WHERE address = "109 Tileston Street"
                        ) AND
    to_address_id IN
                        (
                            SELECT id
                            FROM addresses
                            WHERE address = "728 Maple Place"
                        );


-- Find the drop location for the above packages

SELECT *
FROM packages
INNER JOIN scans
on scans.package_id = packages.id
WHERE from_address_id IN (
                            SELECT id
                            FROM addresses
                            WHERE address = "109 Tileston Street"
                        ) AND
    to_address_id IN
                        (
                            SELECT id
                            FROM addresses
                            WHERE address = "728 Maple Place"
                        ) AND
    scans.action = "Drop";

-- Find the address along with other details

SELECT *
FROM packages
INNER JOIN scans
on scans.package_id = packages.id
INNER JOIN addresses
ON addresses.id = scans.address_id
INNER JOIN drivers
ON drivers.id = scans.driver_id
WHERE from_address_id IN (
                            SELECT id
                            FROM addresses
                            WHERE address = "109 Tileston Street"
                        ) AND
    to_address_id IN
                        (
                            SELECT id
                            FROM addresses
                            WHERE address = "728 Maple Place"
                        )
ORDER BY timestamp ASC;

