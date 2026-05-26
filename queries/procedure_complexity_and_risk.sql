-- Procedure Complexity and Risk Analysis
-- Purpose: Ranking procedures by complexity (device count, duration, complication history)
-- Output: Risk profile for operational planning and physician assignment

SELECT 
    p.procedure_id,
    p.procedure_date,
    p.procedure_type,
    p.attending_physician,
    p.duration_minutes,
    COUNT(DISTINCT pd.device_id) AS devices_required,
    COUNT(DISTINCT c.complication_id) AS complications_occurred,
    CASE 
        WHEN COUNT(DISTINCT c.complication_id) > 0 THEN 'YES'
        ELSE 'NO'
    END AS had_issues,
    SUM(CASE 
        WHEN c.severity = 'Major' THEN 3
        WHEN c.severity = 'Moderate' THEN 2
        WHEN c.severity = 'Minor' THEN 1
        ELSE 0
    END) AS risk_score
FROM procedures p
LEFT JOIN procedure_devices pd ON p.procedure_id = pd.procedure_id
LEFT JOIN complications c ON p.procedure_id = c.procedure_id
GROUP BY p.procedure_id, p.procedure_date, p.procedure_type, p.attending_physician, p.duration_minutes
ORDER BY risk_score DESC, devices_required DESC;