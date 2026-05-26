# Medical Device Operations Data Analytics

SQL database and analytics for medical device inventory, maintenance tracking, and procedure analysis in a hospital cardiology environment.

## Overview

This project demonstrates:
- **Data modeling**: Normalized schema with 5 related tables (devices, maintenance_logs, procedures, procedure_devices, complications)
- **SQL proficiency**: Complex queries using JOINs, aggregations, GROUP BY, and subqueries
- **Healthcare domain knowledge**: Real-world device operations in interventional cardiology
- **Analytics**: Performance metrics, reliability analysis, resource utilization

## Database Schema

### Tables

| Table | Purpose |
|-------|---------|
| `devices` | Equipment inventory (Philips, Abbott, Medtronic devices) |
| `maintenance_logs` | Service history and maintenance tracking |
| `procedures` | Cardiac procedures performed in the lab |
| `procedure_devices` | Device usage per procedure (many-to-many relationship) |
| `complications` | Procedure complications and incident tracking |

### Data Context

- **Setting:** Cardiac catheterization laboratory
- **Sample period:** January-February 2025
- **Device manufacturers:** Philips, Abbott, Medtronic
- **Procedure types:** Coronary angiography, electrophysiology studies, percutaneous interventions
- **Sample size:** 5 devices, 6 procedures, 6 maintenance events, 4 complications

## Queries

Analytics queries demonstrate:

1. **Device reliability analysis** - Identify problematic equipment
2. **Physician performance metrics** - Procedure volume, duration, complication rates
3. **Device utilization** - Usage frequency and maintenance patterns
4. **Complication tracking** - Incident investigation and root cause analysis
5. **Maintenance effectiveness** - Quality of service repairs
6. **Equipment inventory status** - Operational readiness dashboard
7. **Procedure complexity analysis** - Risk scoring and resource planning

## Key Features

a. Normalized schema with foreign key constraints  
b. Realistic medical device data (real manufacturers, real procedure types)  
c. Multi-table analytics (JOINs, aggregations, subqueries)  
d. Production-ready queries for healthcare operations  
e. Comprehensive documentation  

## Technical Stack

- **Database:** MySQL/SQLite
- **Language:** SQL
- **Data model:** Relational (normalized)


## References

**Device Manufacturers:**
- Philips Healthcare: Allura Xper FD20 angiography systems
- Abbott Medical Devices: Vigilance Monitor and pressure recording systems
- Medtronic: EP recording and mapping systems

**Medical Procedures:**
- American College of Cardiology: Coronary angiography and PCI standards
- Heart Rhythm Society: Electrophysiology study guidelines

**Data Standards:**
- HL7 FHIR: Healthcare data interoperability
- SQL Standard: ISO/IEC 9075

## Getting Started

1. Execute `schema.sql` 
2. Execute `sample-data.sql`
3. Review `schema-design.md` 
4. Run  `queries/` 



