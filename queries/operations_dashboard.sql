-- Operations Dashboard - Executive Summary
-- Purpose: High-level KPIs for daily operations reporting
-- Output: Key metrics for management and quality assurance

-- KPI 1: Device Fleet Status
SELECT 'FLEET_STATUS' AS metric, COUNT(*) AS value, 
    CONCAT(SUM(CASE WHEN status='Active' THEN 1 ELSE 0 END), ' Active | ',
           SUM(CASE WHEN status='Maintenance' THEN 1 ELSE 0 END), ' In Maintenance') AS detail
FROM devices
UNION

-- KPI 2: Procedure Volume
SELECT 'PROCEDURES_TOTAL', COUNT(*), 
    CONCAT('Avg duration: ', ROUND(AVG(duration_minutes)), ' min')
FROM procedures
UNION

-- KPI 3: Complication Rate
SELECT 'COMPLICATIONS_TOTAL', COUNT(*),
    CONCAT('Major: ', SUM(CASE WHEN severity='Major' THEN 1 ELSE 0 END),
           ' | Moderate: ', SUM(CASE WHEN severity='Moderate' THEN 1 ELSE 0 END))
FROM complications
UNION

-- KPI 4: Maintenance Activity
SELECT 'MAINTENANCE_EVENTS', COUNT(*),
    CONCAT('Repairs: ', SUM(CASE WHEN maintenance_type='Repair' THEN 1 ELSE 0 END),
           ' | Preventative: ', SUM(CASE WHEN maintenance_type='Preventative' THEN 1 ELSE 0 END))
FROM maintenance_logs
UNION

-- KPI 5: Device Utilization
SELECT 'AVG_PROCEDURES_PER_DEVICE', ROUND(COUNT(*) / 5.0), 
    'Procedures / Device'
FROM procedure_devices;