-- ====================================================================
-- HEALTHCARE DATA PRIVACY & ROLE-BASED ACCESS CONTROL (RBAC) IMPLEMENTATION
-- Objective: Enforce HIPAA/GDPR Principle of Least Privilege for Cath Lab Systems
-- ====================================================================

-- 1. Create Distinct Operational Roles
CREATE ROLE IF NOT EXISTS 'cath_lab_admin';
CREATE ROLE IF NOT EXISTS 'clinical_analyst';

-- 2. Provision Administrative Privileges (Full Read/Write/Schema Access)
GRANT ALL PRIVILEGES ON device_ops.* TO 'cath_lab_admin';

-- 3. Provision Analyst Privileges (Restricted Read-Only Access)
-- Analysts require diagnostic data but must be restricted from modifying schemas
GRANT SELECT ON device_ops.devices TO 'clinical_analyst';
GRANT SELECT ON device_ops.maintenance_logs TO 'clinical_analyst';
GRANT SELECT ON device_ops.procedures TO 'clinical_analyst';

-- 4. Revoke Critical System Access from General Roles
-- Explicitly deny administrative or structural modification rights to analysts
REVOKE DROP, ALTER, DELETE ON device_ops.* FROM 'clinical_analyst';

-- 5. Apply Changes to the Active Access Control List
FLUSH PRIVILEGES;
