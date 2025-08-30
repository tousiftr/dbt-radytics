WITH raw_data AS (
    SELECT 
        customer_id
    FROM {{ source('uber_dataset', 'uber_customer_data_clean') }}   
)
SELECT * 
FROM raw_data
