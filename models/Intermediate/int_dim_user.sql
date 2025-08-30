
WITH customer_data AS (
    SELECT 
        customer_id 
    FROM {{ ref('stg_secure_user') }}
)
SELECT *
FROM customer_data