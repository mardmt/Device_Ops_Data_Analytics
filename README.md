# Medical Device & Cath Lab Operations SQL Project

A relational database SQL project, modeling medical device inventory, maintenance history, and procedure complications in a hospital cardiac catheterization laboratory.

---

## Overview

This repository contains a 5-table relational database and set of SQL queries designed to track equipment usage and maintenance patterns in a hospital Cath Lab environment.


- **Relational Schema Design:** 5 core tables linked by foreign keys (`devices`, `maintenance_logs`, `procedures`, `procedure_devices`, and `complications`).
- **SQL Analytics:** Practice queries using table `JOIN`s, aggregations (`GROUP BY`), subqueries, and conditional logic.
- **Cardiology Context:** Features realistic equipment classifications (e.g., angiography systems, EP recording monitors) and standard procedure categories.

---

## Database Schema

```text
devices (1) ────< maintenance_logs (M)
   │
   └──< procedure_devices (M) >─── procedures (1) ────< complications (M)


### Tables

| Table | Purpose |
|-------|---------|
| `devices` | Equipment inventory (Philips, Abbott, Medtronic devices) |
| `maintenance_logs` | Service history, routine checks, and repair records per device |
| `procedures` | Type, Physician, Date of Cardiac catheterization procedures performed |
| `procedure_devices` | Table tracking which devices were utilized during specific procedures (many-to-many relationship) |
| `complications` | Logs tracking procedure complications and incidents |


### Data Context

- **Setting:** Cardiac catheterization laboratory
- **Sample period:** January-February 2025
- **Device manufacturers:** Philips, Abbott, Medtronic
- **Procedure types:** Coronary angiography, electrophysiology studies, percutaneous interventions
- **Sample size:** 5 devices, 6 procedures, 6 maintenance events, 4 complications


## SQL Analytics & Queries

1. **Device Reliability** - Identify equipment models with high maintenance frequencies
2. **Physician Metrics** - Calculate complication rates across different procedure types
3. **Device Utilisation** - Track device usage patterns across elective vs. emergency procedures.
4. **Complication Tracking** - Maps equipment failures directly to procedure incident logs in order to trace potential causes
5. **Maintenance Effectiveness** - Reviews repair history and service intervals preceding device breakdowns


## Technical Stack

- **Database:** MySQL/SQLite
- **Language:** SQL
- **Schema:** Relational (5 table - normalized)

## Domain Context

Equipment names and procedure types reflect standard equipment used in interventional cardiology:
- **Equipment:** Angiography systems (Philips), pressure recording systems (Abbott), EP mapping systems (Medtronic).
- **Procedures:** Diagnostic coronary angiography, percutaneous coronary intervention (PCI), electrophysiology studies.

---

## How to Run

1. Run `schema.sql` to build the database tables
2. Run `sample-data.sql` to populate sample test records
3. Review `schema-design.md` for entity relationships 
4. Run  `queries/` to view analytics

---

## Security Layer

To practice basic database security, I included a `security_policies.sql` script that sets up two user roles:
* `cath_lab_admin`: Full access to manage tables and modify system records.
* `clinical_analyst`: Read-only access to query anonymized procedure data for research without modifying the raw data.


