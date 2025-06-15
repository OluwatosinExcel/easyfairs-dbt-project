WITH attendees AS (
    SELECT 
        event_id,
        AVG(satisfaction_score) AS avg_satisfaction
    FROM {{ ref('stg_attendees')    }}
    GROUP BY event_id
),

exhibitors AS (
    SELECT
        event_id,
        AVG(feedback_rating) AS avg_feedback
    FROM {{ ref('stg_exhibitors')   }}
    GROUP BY event_id
),

sales AS (
    SELECT
        event_id,
        SUM(total_revenue) AS Total_revenue,
        SUM(expense) AS Total_expense,
        SUM(profit) AS Total_profit
    FROM {{ ref('stg_sales')    }}
    GROUP BY event_id
)

SELECT 
    e.event_id,
    e.event_name,
    e.region,
    e.event_type,
    e.start_date,
    e.end_date,
    e.organizer,
    s.Total_revenue,
    s.Total_expense,
    s.Total_profit,
    ex.avg_feedback,
    a.avg_satisfaction
FROM {{ ref('stg_events')   }} e
LEFT JOIN sales s ON s.event_id = e.event_id
LEFT JOIN attendees a ON a.event_id = e.event_id
LEFT JOIN exhibitors ex ON ex.event_id = e.event_id
