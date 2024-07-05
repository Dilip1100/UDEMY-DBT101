WITH raw_listings AS (
    SELECT
        id,
        name,
        room_type,
        CASE
            WHEN minimum_nights = 0 THEN 1
            ELSE minimum_nights
        END AS minimum_nights,
        host_id,
        REPLACE(price, '$', '')::NUMBER(10, 2) AS price,
        created_at,
        updated_at
    FROM
        AIRBNB.RAW.RAW_LST
)
SELECT
    id AS listing_id,
    name AS listing_name,
    room_type,
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
FROM
    raw_listings