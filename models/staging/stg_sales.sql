WITH source AS (
    SELECT *
    FROM {{ source('raw', 'sales_data') }}
),

cleaned AS (
    SELECT
        event_id,
        ticket_sales,
        expense,
        profit,
        CAST('Total Revenue' AS float64) AS total_revenue
    FROM source
)

SELECT *
FROM cleaned