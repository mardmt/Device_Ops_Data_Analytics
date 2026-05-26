\# Database Schema Design - Medical Device Operations



\## What is a Schema?



A \*\*schema\*\* is a blueprint for how data is organized.



Think of it like a hospital filing system:

\- \*\*Database\*\* = The entire filing room

\- \*\*Table\*\* = One type of file cabinet (e.g., "Device Files")

\- \*\*Column\*\* = A specific piece of information (e.g., "Serial Number")

\- \*\*Row\*\* = One complete record (e.g., one device's full information)



\---



\## The 5 Tables



\### TABLE 1: devices



\*\*Purpose:\*\* Store information about each piece of equipment



\*\*Example Data:\*\*


\*\*Columns:\*\*



| Column Name | Type | Meaning |

|------------|------|---------|

| `device\_id` | INTEGER | Unique number for each device (1, 2, 3...) |

| `device\_name` | TEXT | Equipment name ("Philips Allura...") |

| `manufacturer` | TEXT | Brand (Philips, Abbott, Medtronic) |

| `serial\_number` | TEXT | Unique serial code |

| `purchase\_date` | DATE | When bought |

| `status` | TEXT | Active, Maintenance, or Retired |



\---



\### TABLE 2: maintenance\_logs



\*\*Purpose:\*\* Record every time a device is serviced



\*\*Example Data:\*\*


\*\*Columns:\*\*



| Column Name | Type | Meaning |

|------------|------|---------|

| `log\_id` | INTEGER | Unique ID for each maintenance record |

| `device\_id` | INTEGER | \*\*Links to devices table\*\* - which device was serviced? |

| `maintenance\_date` | DATE | When was it serviced? |

| `maintenance\_type` | TEXT | Preventative, Repair, Calibration, Inspection |

| `technician` | TEXT | Who did the work? |



\*\*Key Concept:\*\* One device can have MANY maintenance records. This is a "one-to-many" relationship.



\---



\### TABLE 3: procedures



\*\*Purpose:\*\* Record each cardiac procedure performed



\*\*Example Data:\*\*


\*\*Columns:\*\*



| Column Name | Type | Meaning |

|------------|------|---------|

| `procedure\_id` | INTEGER | Unique ID for each procedure |

| `procedure\_date` | DATE | When the procedure happened |

| `procedure\_type` | TEXT | Type: Angiography, EP Study, PCI, etc. |

| `patient\_id` | TEXT | Patient identifier |

| `attending\_physician` | TEXT | Doctor who performed it |

| `duration\_minutes` | INTEGER | How long it took |

| `outcome` | TEXT | None, Minor Issue, Major Issue |



\---



\### TABLE 4: procedure\_devices (Bridge Table)



\*\*Purpose:\*\* Record which devices were used in each procedure



\*\*Why a separate table?\*\*



One procedure uses MULTIPLE devices. One device is used in MANY procedures.



Example:

\- Procedure 1 used: Device 1 (imaging) + Device 2 (monitor) + Device 3 (recording)

\- Device 1 was used in: Procedure 1, Procedure 5, Procedure 10, etc.



\*\*This is called a "many-to-many" relationship.\*\*



We solve it with a bridge table:



\*\*Example Data:\*\*

\*\*Columns:\*\*



| Column Name | Type | Meaning |

|------------|------|---------|

| `device\_procedure\_id` | INTEGER | Unique ID for this device-usage record |

| `procedure\_id` | INTEGER | \*\*Links to procedures\*\* - which procedure? |

| `device\_id` | INTEGER | \*\*Links to devices\*\* - which device? |

| `start\_time` | TIME | When was device used? |

| `end\_time` | TIME | When did usage end? |



\---



\### TABLE 5: complications



\*\*Purpose:\*\* Record any issues during procedures



\*\*Example Data:\*\*

\*\*Columns:\*\*



| Column Name | Type | Meaning |

|------------|------|---------|

| `complication\_id` | INTEGER | Unique ID |

| `procedure\_id` | INTEGER | \*\*Links to procedures\*\* - which procedure? |

| `device\_id` | INTEGER | \*\*Links to devices\*\* - which device caused it? (can be NULL) |

| `complication\_type` | TEXT | Type: Arrhythmia, Equipment Error, Patient Reaction, etc. |

| `severity` | TEXT | Minor, Moderate, or Major |

| `description` | TEXT | What happened? |



\*\*Key Concept:\*\* `device\_id` can be NULL because not all complications are device-related.



\---



\## How Tables Connect (Relationships)

\*\*English translation:\*\*

\- One device → many maintenance records

\- One procedure → many devices used

\- One procedure → many complications

\- One device → can cause many complications



\---



\## Data Types Explained



When creating tables, each column has a \*\*data type\*\*:



| Type | What It Holds | Example |

|------|--------------|---------|

| `INTEGER` | Whole numbers | 1, 42, 9999 |

| `TEXT` | Words, sentences | "John Smith", "Device works" |

| `DATE` | Calendar dates | 2025-01-15 |

| `TIME` | Clock times | 14:30:45 |

| `VARCHAR(50)` | Text with max length | 50 characters max |



\---



\## Foreign Keys (The Glue)



\*\*Foreign Key\*\* = A column that links to another table's primary key.



Example: `maintenance\_logs.device\_id` is a foreign key.

\- It links to `devices.device\_id`

\- Prevents mistakes (can't record maintenance for non-existent device)



\---



\## Next Step


Read `schema.sql` to see HOW this design becomes SQL code.


## Primary Keys vs Foreign Keys

**Primary Key** = Column that uniquely identifies each row
- Example: `device_id` in devices table
- No two rows can have the same primary key

**Foreign Key** = Column that references another table's primary key
- Example: `device_id` in maintenance_logs
- Creates the link between tables
- Ensures data integrity

---

## Next Step

Now read `schema.sql` to see the actual SQL code that creates these tables.

---

## Data Sources and References

### Manufacturers Referenced
- **Philips Healthcare**: Allura Xper FD20 angiography systems
  - https://www.philips.com/healthcare
  - Real product used in cardiology labs

- **Abbott Medical Devices**: Vigilance Monitor and pressure systems
  - https://www.abbott.com
  - Real products for patient monitoring

- **Medtronic**: EP Recording Systems
  - https://www.medtronic.com
  - Real products for electrophysiology procedures

### Medical Procedure References
- **Coronary Angiography**: American College of Cardiology
  - Diagnostic imaging procedure
  - Duration: 30-60 minutes typical

- **Electrophysiology Study**: Heart Rhythm Society
  - Cardiac electrical mapping
  - Duration: 60-180 minutes typical

- **Percutaneous Coronary Intervention (PCI)**: American College of Cardiology
  - Interventional procedure (stent placement)
  - Duration: 45-120 minutes typical

### Data Standards
- **Foreign Key relationships**: SQL Standard
- **Data types**: ISO/IEC 9075 (SQL Standard)
- **Healthcare data modeling**: HL7 FHIR standards

### Disclaimer

**This is synthetic/example data for educational purposes.**
- NOT real patient data
- NOT derived from actual hospital systems
- Device names and manufacturers are real
- Procedure types are real
- Complication types are realistic but fictional examples
- Designed to teach SQL concepts in healthcare context

---

## Next Steps

This schema and sample data are suitable for:
- Learning SQL fundamentals
- Understanding healthcare data relationships
- Portfolio demonstration
- Educational projects

For real healthcare data:
- Requires IRB approval
- HIPAA compliance mandatory
- Institutional data use agreements required

