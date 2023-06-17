--Joining all 3 tables
SELECT*
FROM `Google_fiber.market_1`
UNION ALL
SELECT*
FROM `Google_fiber.market_2`
UNION ALL
SELECT*
FROM `Google_fiber.market_3`


--Call Counts
SELECT
    new_type,
    COUNT(*) AS call_count
FROM
    (
    SELECT*
FROM `Google_fiber.market_1`
UNION ALL
SELECT*
FROM `Google_fiber.market_2`
UNION ALL
SELECT*
FROM `Google_fiber.market_3`
    ) AS consolidated_dataset
GROUP BY
    new_type;
    
    
--Repeat call Ratio
SELECT
    date_created,
    SUM(SAFE_CAST(contacts_n_1 AS INT64) + SAFE_CAST(contacts_n_2 AS INT64) + SAFE_CAST(contacts_n_3 AS INT64) + SAFE_CAST(contacts_n_4 AS INT64) + SAFE_CAST(contacts_n_5 AS INT64) + SAFE_CAST(contacts_n_6 AS INT64) + SAFE_CAST(contacts_n_7 AS INT64)) / SUM(SAFE_CAST(contacts_n AS INT64) + SAFE_CAST(contacts_n_1 AS INT64) + SAFE_CAST(contacts_n_2 AS INT64) + SAFE_CAST(contacts_n_3 AS INT64) + SAFE_CAST(contacts_n_4 AS INT64) + SAFE_CAST(contacts_n_5 AS INT64) + SAFE_CAST(contacts_n_6 AS INT64) + SAFE_CAST(contacts_n_7 AS INT64)) AS repeat_call_ratio
FROM
    (
    SELECT*
FROM `Google_fiber.market_1`
UNION ALL
SELECT*
FROM `Google_fiber.market_2`
UNION ALL
SELECT*
FROM `Google_fiber.market_3`
    ) AS consolidated_dataset
GROUP BY
    date_created
ORDER BY
    date_created;


--Total calls
SELECT
    date_created,
    SUM(SAFE_CAST(contacts_n AS INT64) + SAFE_CAST(contacts_n_1 AS INT64) + SAFE_CAST(contacts_n_2 AS INT64) + SAFE_CAST(contacts_n_3 AS INT64) + SAFE_CAST(contacts_n_4 AS INT64) + SAFE_CAST(contacts_n_5 AS INT64) + SAFE_CAST(contacts_n_6 AS INT64) + SAFE_CAST(contacts_n_7 AS INT64)) AS total_calls
FROM
    (
    SELECT*
FROM `Google_fiber.market_1`
UNION ALL
SELECT*
FROM `Google_fiber.market_2`
UNION ALL
SELECT*
FROM `Google_fiber.market_3`

    ) AS consolidated_dataset
GROUP BY
    date_created
ORDER BY
    date_created;
