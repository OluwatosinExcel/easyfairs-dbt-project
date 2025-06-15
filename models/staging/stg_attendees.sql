SELECT *
FROM {{ source('raw', 'attendees_data') }}
