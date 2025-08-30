
WITH raw_data AS (
    SELECT 
        customer_id,  
        booking_date, 
        booking_amount
    FROM {{ source('uber_dataset', 'booking_data_uber') }}  
    WHERE customer_id IS NOT NULL  -
)

SELECT
    customer_id
FROM raw_data
