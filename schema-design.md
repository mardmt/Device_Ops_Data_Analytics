# Medical Device Operations Database Schema Design 

## What is a Schema?

A **schema** is the structural blueprint for how data is organized within a database.

- **Database:** The overall container holding the data.
- **Table:** A specific category of data (e.g., `devices`).
- **Column:** A specific attribute or field (e.g., `serial_number`).
- **Row:** A single record within a table.

---

## The 5 Core Tables

### 1. `devices`
**Purpose:** Stores hardware inventory and operational status.

| Column Name | Type | Description |
|---|---|---|
| `device_id` | INTEGER (PK) | Unique identifier for each device. |
| `device_name` | TEXT | Equipment model name (e.g., Philips Allura). |
| `manufacturer` | TEXT | Hardware manufacturer (Philips, Abbott, Medtronic). |
| `serial_number` | TEXT | Unique hardware serial identifier. |
| `purchase_date` | DATE | Date of acquisition. |
| `status` | TEXT | Operational state (`Active`, `Maintenance`, `Retired`). |

---

### 2. `maintenance_logs`
**Purpose:** Records routine servicing, repairs, and inspections for each device.

| Column Name | Type | Description |
|---|---|---|
| `log_id` | INTEGER (PK) | Unique identifier for each maintenance log entry. |
| `device_id` | INTEGER (FK) | Links to `devices.device_id` (Which device was serviced?). |
| `maintenance_date` | DATE | Date service was performed. |
| `maintenance_type` | TEXT | Service category (`Preventative`, `Repair`, `Calibration`, `Inspection`). |
| `technician` | TEXT | Name or ID of servicing technician. |

*Relationship:* One-to-Many ($1 \rightarrow M$). One device can have multiple maintenance entries over time.

---

### 3. `procedures`
**Purpose:** Logs cardiac interventional procedures performed in the lab.

| Column Name | Type | Description |
|---|---|---|
| `procedure_id` | INTEGER (PK) | Unique identifier for each procedure. |
| `procedure_date` | DATE | Date procedure was performed. |
| `procedure_type` | TEXT | Category (`Angiography`, `EP Study`, `PCI`). |
| `patient_id` | TEXT | Anonymized patient record identifier. |
| `attending_physician` | TEXT | Primary physician performing the procedure. |
| `duration_minutes` | INTEGER | Total procedural time in minutes. |
| `outcome` | TEXT | Clinical/operational outcome (`None`, `Minor Issue`, `Major Issue`). |

---

### 4. `procedure_devices` (Junction / Bridge Table)
**Purpose:** Resolves the Many-to-Many ($M \rightarrow N$) relationship between procedures and hardware.

| Column Name | Type | Description |
|---|---|---|
| `device_procedure_id` | INTEGER (PK) | Unique identifier for the usage instance. |
| `procedure_id` | INTEGER (FK) | Links to `procedures.procedure_id`. |
| `device_id` | INTEGER (FK) | Links to `devices.device_id`. |
| `start_time` | TIME | Time device engagement began. |
| `end_time` | TIME | Time device usage concluded. |

*Why a Bridge Table?* A single procedure uses multiple hardware systems (e.g., imaging system + pressure monitor), and a single device is reused across many procedures.

---

### 5. `complications`
**Purpose:** Tracks procedural complications, hardware failures, and incident logs.

| Column Name | Type | Description |
|---|---|---|
| `complication_id` | INTEGER (PK) | Unique identifier for each incident. |
| `procedure_id` | INTEGER (FK) | Links to `procedures.procedure_id`. |
| `device_id` | INTEGER (FK) | Links to `devices.device_id` (Optional / Can be `NULL`). |
| `complication_type` | TEXT | Category (`Arrhythmia`, `Equipment Error`, `Patient Reaction`). |
| `severity` | TEXT | Severity classification (`Minor`, `Moderate`, `Major`). |
| `description` | TEXT | Detailed incident notes. |

*Note:* `device_id` is nullable because procedural complications are not always caused by hardware failure.

---

## Entity Relationships & Integrity Constraints

```text
devices (1) ────< maintenance_logs (M)
   │
   └──< procedure_devices (M) >─── procedures (1) ────< complications (M)

