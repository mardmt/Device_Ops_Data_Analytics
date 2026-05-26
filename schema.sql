-- Create devices table
CREATE TABLE devices (
    device_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(255) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    serial_number VARCHAR(50) NOT NULL UNIQUE,
    purchase_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Active',
    location VARCHAR(100)
);
-- Create maintenance_logs table
CREATE TABLE maintenance_logs (
    log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL,
    maintenance_date DATE NOT NULL,
    maintenance_type VARCHAR(50) NOT NULL,
    technician VARCHAR(100) NOT NULL,
    notes TEXT,
    CONSTRAINT fk_maintenance_device FOREIGN KEY (device_id) REFERENCES devices(device_id)
);

-- Create procedures table
CREATE TABLE procedures (
    procedure_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    procedure_date DATE NOT NULL,
    procedure_type VARCHAR(100) NOT NULL,
    patient_id VARCHAR(20) NOT NULL,
    attending_physician VARCHAR(100) NOT NULL,
    duration_minutes INT,
    outcome VARCHAR(50) DEFAULT 'None'
);

-- Create procedure_devices table (bridge table)
CREATE TABLE procedure_devices (
    device_procedure_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    procedure_id INT NOT NULL,
    device_id INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    notes TEXT,
    CONSTRAINT fk_procedure_device_proc FOREIGN KEY (procedure_id) REFERENCES procedures(procedure_id),
    CONSTRAINT fk_procedure_device_dev FOREIGN KEY (device_id) REFERENCES devices(device_id)
);
-- Create complications table
CREATE TABLE complications (
    complication_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    procedure_id INT NOT NULL,
    device_id INT,
    complication_type VARCHAR(100) NOT NULL,
    severity VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    reported_date DATE DEFAULT CURDATE(),
    CONSTRAINT fk_complication_proc FOREIGN KEY (procedure_id) REFERENCES procedures(procedure_id),
    CONSTRAINT fk_complication_dev FOREIGN KEY (device_id) REFERENCES devices(device_id)
);
