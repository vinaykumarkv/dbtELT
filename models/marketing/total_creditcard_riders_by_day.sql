{{ config(
    materialized='table',
    schema='marketing'
) }}

SELECT
    DATE(tpep_pickup_datetime) AS day,
    COUNT(*) AS total_cc_riders
FROM {{ source('raw_data', 'taxi_rides_raw') }}
WHERE payment_type = 1
GROUP BY DATE(tpep_pickup_datetime)