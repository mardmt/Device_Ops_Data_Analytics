-- ============================================================================
-- SAMPLE DATA - REFERENCES AND DATA SOURCE
-- ============================================================================
--
-- DATA TYPE: Synthetic/Example data for educational purposes
-- NOT real patient or hospital data
--
-- DEVICE MANUFACTURERS (Real companies):
-- - Philips Healthcare: https://www.philips.com/healthcare
--   Products: Allura Xper FD20 (angiography systems)
-- - Abbott Medical Devices: https://www.abbott.com
--   Products: Vigilance Monitor (patient monitoring)
-- - Medtronic: https://www.medtronic.com
--   Products: EP Recording Systems
--
-- PROCEDURE TYPES (Real cardiology procedures):
-- - Coronary Angiography: Diagnostic imaging of coronary arteries
--   Reference: American College of Cardiology
-- - Electrophysiology (EP) Study: Electrical mapping of heart
--   Reference: Heart Rhythm Society
-- - Percutaneous Coronary Intervention (PCI): Stent placement
--   Reference: American College of Cardiology
-- - Intracardiac Echo: Ultrasound from inside the heart
--
-- COMPLICATION TYPES (Real clinical events):
-- - Arrhythmia: Abnormal heart rhythm
-- - Equipment Error: Device malfunction
-- - Patient Reaction: Adverse patient response
-- Reference: Medical Device Reporting (FDA database)
--
-- DATA CONTEXT:
-- - Setting: Cardiac catheterization laboratory
-- - Time period: January-February 2025 (example only)
-- - Physicians: Fictional names for example only
-- - Patient IDs: De-identified (P-001, P-002, etc.)
--
-- EDUCATIONAL USE ONLY
-- This dataset demonstrates healthcare data structure, NOT real clinical data
-- ============================================================================


-- Add 5 devices to the devices table

INSERT INTO devices (device_name, manufacturer, serial_number, purchase_date, status, location)
VALUES ('Philips Allura Xper FD20', 'Philips', 'PH-2024-001', '2024-01-15', 'Active', 'Cardiac Lab A');

INSERT INTO devices (device_name, manufacturer, serial_number, purchase_date, status, location)
VALUES ('Abbott Vigilance Monitor', 'Abbott', 'AB-2024-002', '2024-02-20', 'Active', 'Cardiac Lab A');

INSERT INTO devices (device_name, manufacturer, serial_number, purchase_date, status, location)
VALUES ('Medtronic EP Recording System', 'Medtronic', 'MT-2024-003', '2024-03-10', 'Active', 'Cardiac Lab B');

INSERT INTO devices (device_name, manufacturer, serial_number, purchase_date, status, location)
VALUES ('Philips Intracardiac Echo System', 'Philips', 'PH-2024-004', '2024-01-20', 'Maintenance', 'Cardiac Lab B');

INSERT INTO devices (device_name, manufacturer, serial_number, purchase_date, status, location)
VALUES ('Abbott Pressure Recording System', 'Abbott', 'AB-2024-005', '2024-02-15', 'Active', 'Cardiac Lab A');
-- Add 6 maintenance records

INSERT INTO maintenance_logs (device_id, maintenance_date, maintenance_type, technician, notes)
VALUES (1, '2025-01-10', 'Preventative', 'John Smith', 'Annual inspection passed, all systems operational');

INSERT INTO maintenance_logs (device_id, maintenance_date, maintenance_type, technician, notes)
VALUES (1, '2025-01-25', 'Repair', 'Sarah Johnson', 'Fixed cooling fan malfunction, device returned to service');

INSERT INTO maintenance_logs (device_id, maintenance_date, maintenance_type, technician, notes)
VALUES (2, '2025-02-05', 'Calibration', 'John Smith', 'Recalibrated pressure sensors, accuracy verified');

INSERT INTO maintenance_logs (device_id, maintenance_date, maintenance_type, technician, notes)
VALUES (3, '2025-02-10', 'Inspection', 'Mike Chen', 'System checked, all recording channels functional');

INSERT INTO maintenance_logs (device_id, maintenance_date, maintenance_type, technician, notes)
VALUES (4, '2025-02-15', 'Repair', 'Sarah Johnson', 'Replaced transducer, device under testing');

INSERT INTO maintenance_logs (device_id, maintenance_date, maintenance_type, technician, notes)
VALUES (5, '2025-02-08', 'Calibration', 'John Smith', 'All pressure channels calibrated to reference standards');
-- Add 6 procedures

INSERT INTO procedures (procedure_date, procedure_type, patient_id, attending_physician, duration_minutes, outcome)
VALUES ('2025-01-20', 'Coronary Angiography', 'P-001', 'Dr. Martinez', 45, 'None');

INSERT INTO procedures (procedure_date, procedure_type, patient_id, attending_physician, duration_minutes, outcome)
VALUES ('2025-01-21', 'Electrophysiology Study', 'P-002', 'Dr. Kumar', 120, 'None');

INSERT INTO procedures (procedure_date, procedure_type, patient_id, attending_physician, duration_minutes, outcome)
VALUES ('2025-01-22', 'Percutaneous Coronary Intervention', 'P-003', 'Dr. Chen', 60, 'Minor Issue');

INSERT INTO procedures (procedure_date, procedure_type, patient_id, attending_physician, duration_minutes, outcome)
VALUES ('2025-01-23', 'Coronary Angiography', 'P-004', 'Dr. Martinez', 50, 'None');

INSERT INTO procedures (procedure_date, procedure_type, patient_id, attending_physician, duration_minutes, outcome)
VALUES ('2025-01-24', 'Electrophysiology Study with Ablation', 'P-005', 'Dr. Kumar', 150, 'Major Issue');

INSERT INTO procedures (procedure_date, procedure_type, patient_id, attending_physician, duration_minutes, outcome)
VALUES ('2025-02-01', 'Intracardiac Echo Guided Procedure', 'P-006', 'Dr. Chen', 90, 'None');

-- Add 15 procedure_device records (which devices were used in which procedures)

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (1, 1, '14:30:00', '15:15:00', 'Primary imaging device for coronary visualization');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (1, 2, '14:30:00', '15:15:00', 'Continuous patient monitoring');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (1, 5, '14:30:00', '15:15:00', 'Pressure measurement in coronary arteries');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (2, 3, '16:00:00', '18:00:00', 'EP recording system for electrical mapping');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (2, 2, '16:00:00', '18:00:00', 'Continuous patient monitoring during EP study');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (2, 5, '16:00:00', '18:00:00', 'Intracardiac pressures recorded');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (3, 1, '10:00:00', '11:00:00', 'Imaging for stent placement guidance');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (3, 2, '10:00:00', '11:00:00', 'Patient monitoring');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (3, 5, '10:00:00', '11:00:00', 'Pressure measurements');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (4, 1, '11:00:00', '11:50:00', 'Coronary imaging');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (4, 2, '11:00:00', '11:50:00', 'Patient monitoring');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (4, 5, '11:00:00', '11:50:00', 'Pressure measurement');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (5, 3, '14:00:00', '16:30:00', 'EP mapping and ablation guidance');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (5, 2, '14:00:00', '16:30:00', 'Hemodynamic monitoring');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (5, 5, '14:00:00', '16:30:00', 'Pressure monitoring during ablation');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (6, 4, '09:00:00', '10:30:00', 'Intracardiac ultrasound imaging (primary device)');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (6, 1, '09:00:00', '10:30:00', 'Fluoroscopic imaging support');

INSERT INTO procedure_devices (procedure_id, device_id, start_time, end_time, notes)
VALUES (6, 2, '09:00:00', '10:30:00', 'Patient hemodynamic monitoring');

-- Add 4 complications (what went wrong)

INSERT INTO complications (procedure_id, device_id, complication_type, severity, description, reported_date)
VALUES (3, 2, 'Arrhythmia', 'Minor', 'Premature ventricular contractions detected during stent deployment', '2025-01-22');

INSERT INTO complications (procedure_id, device_id, complication_type, severity, description, reported_date)
VALUES (5, 3, 'Equipment Error', 'Major', 'EP recording system lost signal for 15 seconds during critical mapping phase', '2025-01-24');

INSERT INTO complications (procedure_id, device_id, complication_type, severity, description, reported_date)
VALUES (5, NULL, 'Patient Reaction', 'Moderate', 'Bradycardia (slow heart rate) during ablation, managed medically', '2025-01-24');

INSERT INTO complications (procedure_id, device_id, complication_type, severity, description, reported_date)
VALUES (6, 4, 'Equipment Error', 'Moderate', 'Intermittent ultrasound image dropout, suspected transducer issue', '2025-02-01');
