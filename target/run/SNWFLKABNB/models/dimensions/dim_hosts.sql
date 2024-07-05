
  
    

        create or replace transient table AIRBNB.RAW_dimensions.dim_hosts
         as
        (WITH raw_hosts AS (
    SELECT
        id,
        NVL(name, 'Anonymous') AS name,
        is_superhost,
        created_at,
        updated_at
    FROM
        AIRBNB.RAW.RAW_HST
)
SELECT
    id AS host_id,
    name AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
        );
      
  