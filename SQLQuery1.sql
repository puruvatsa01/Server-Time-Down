use ServerTime

WITH cte AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY service_name ORDER BY CAST(updated_time AS datetime)) -
        ROW_NUMBER() OVER (PARTITION BY service_name, status ORDER BY CAST(updated_time AS datetime)) AS diff
    FROM dbo.service_status_up_down
),
cte2 AS (
    SELECT *, 
        COUNT(diff) OVER (PARTITION BY service_name, diff) AS cn
    FROM cte
    WHERE status = 'DOWN'
)
SELECT DISTINCT 
    service_name,
    MIN(CAST(updated_time AS datetime)) OVER (PARTITION BY service_name, diff) AS start_time,
    MAX(CAST(updated_time AS datetime)) OVER (PARTITION BY service_name, diff) AS end_time,
    MAX(cn) OVER (PARTITION BY service_name, diff) AS Down_count
FROM cte2
WHERE cn >= 5
ORDER BY service_name, start_time;

