SELECT * 
FROM {{ source('raw', 'events_data') }}
