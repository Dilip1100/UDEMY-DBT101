
  
    

        create or replace transient table AIRBNB.RAW_dimensions.dim_lst_hst
         as
        (WITH listings_cleansed AS (
    SELECT
        id AS listing_id,
        name AS listing_name,
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
),
hosts_cleansed AS (
    SELECT
        id AS host_id,
        NVL(name, 'Anonymous') AS host_name,
        is_superhost,
        created_at,
        updated_at
    FROM
        AIRBNB.RAW.RAW_HST
)
SELECT
    L.listing_id,
    L.listing_name,
    L.room_type,
    L.minimum_nights,
    L.price,
    L.host_id,
    H.host_name,
    H.is_superhost,
    L.created_at,
    GREATEST(L.updated_at, H.updated_at) AS updated_at
FROM
    listings_cleansed AS L
JOIN
    hosts_cleansed AS H ON L.host_id = H.host_id
        );
      
  