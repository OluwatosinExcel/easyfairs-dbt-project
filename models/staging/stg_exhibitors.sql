WITH source AS (
  SELECT * FROM {{ source('raw', 'exhibitors_data') }}
),

cleaned_ex AS (
  SELECT
    exhibitor_id,
    event_id,
    booth_size,
    cast(feedback_rating as int64) as feedback_rating
  FROM source
)

SELECT * FROM cleaned_ex
