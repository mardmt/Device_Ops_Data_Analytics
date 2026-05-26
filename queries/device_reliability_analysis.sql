 --Device Reliability Analysis
--Purpose: Identify devices with complications to prioritize maintenance or replacement
-- Output: Device performance metrics with complication tracking

SELECT 
    d.device_id,
    d.device_name,
    d.manufacturer,
    d.status,
    COUNT(DISTINCT pd.procedure_id) AS procedures_used,
    COUNT(DISTINCT c.complication_id) AS total_complications,
    ROUND(
        (COUNT(DISTINCT c.complication_id) * 100.0) / 
        NULLIF(COUNT(DISTINCT pd.procedure_id), 0),
        2
    ) AS complication_rate_percent,
    GROUP_CONCAT(DISTINCT c.complication_type SEPARATOR ', ') AS complication_types,
    COUNT(DISTINCT m.log_id) AS maintenance_events
FROM devices d
LEFT JOIN procedure_devices pd ON d.device_id = pd.device_id
LEFT JOIN complications c ON c.device_id = d.device_id
LEFT JOIN maintenance_logs m ON d.device_id = m.device_id
GROUP BY d.device_id, d.device_name, d.manufacturer, d.status
ORDER BY complication_rate_percent DESC NULLS LAST;
