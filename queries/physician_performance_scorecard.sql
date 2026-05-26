-- Physician Performance Scorecard
-- Purpose: Track procedure volume, efficiency, and complication rates by physician
-- Output: Performance metrics for quality review and benchmarking

SELECT 
    p.attending_physician,
    COUNT(DISTINCT p.procedure_id) AS total_procedures,
    AVG(p.duration_minutes) AS avg_duration_minutes,
    MIN(p.duration_minutes) AS fastest_procedure_minutes,
    MAX(p.duration_minutes) AS longest_procedure_minutes,
    SUM(CASE WHEN p.outcome != 'None' THEN 1 ELSE 0 END) AS procedures_with_issues,
    ROUND(
        (SUM(CASE WHEN p.outcome != 'None' THEN 1 ELSE 0 END) * 100.0) / 
        COUNT(DISTINCT p.procedure_id),
        1
    ) AS issue_rate_percent,
    COUNT(DISTINCT c.complication_id) AS total_complications
FROM procedures p
LEFT JOIN complications c ON p.procedure_id = c.procedure_id
GROUP BY p.attending_physician
ORDER BY total_procedures DESC;