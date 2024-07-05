
  create or replace   view AIRBNB.RAW_staging.stg_lst
  
   as (
    WITH raw_listings AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_LST
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings
  );

