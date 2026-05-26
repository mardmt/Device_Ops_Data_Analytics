-- Complication Investigation and Root Cause Analysis
-- Purpose: Detail incident review with device and procedure context
-- Output: Comprehensive incident log for quality and safety analysis

SELECT 
    c.complication_id,
    p.procedure_date,
    p.procedure_type,
    p.attending_physician,
    c.complication_type,
    c.severity,
    CASE 
        WHEN c.device_id IS NOT NULL THEN CONCAT(d.device_name, ' (', d.manufacturer, ')')
        ELSE 'Non-device related'
    END AS involved_equipment,
    c.description,
    CASE 
        WHEN c.severity = 'Major' THEN 'ESCALATE'
        WHEN c.severity = 'Moderate' THEN 'REVIEW'
        ELSE 'MONITOR'
    END AS action_required
FROM complications c
JOIN procedures p ON c.procedure_id = p.procedure_id
LEFT JOIN devices d ON c.device_id = d.device_id
ORDER BY c.severity DESC, p.procedure_date DESC;