# CodeJudge Data Integrity Audit — Part 3

# Objective

This part focuses on auditing the imported CodeJudge database for:

* integrity violations
* duplicate records
* foreign key mismatches
* invalid domain values
* timestamp inconsistencies
* missing mandatory data

The goal is to simulate responsibilities of a database engineer responsible for maintaining reliable production data.

---

# Repository Structure

```text id="hnw3ml"
├── README.md
├── import_validation.sql
├── integrity_audit.sql
├── domain_rule_checks.sql
├── repair_plan.md
├── staging_repair_scripts.sql
└── before_after_evidence.md
```

---

# Audit Areas Covered

## Import Validation

* row count checks
* NULL checks
* distinct primary key validation
* empty table detection

## Uniqueness Audit

* duplicate primary keys
* duplicate emails
* duplicate enrollments
* duplicate mappings

## Foreign Key Audit

* missing parent records
* broken relationships
* orphaned rows

## Domain Validation

* invalid statuses
* negative scores
* invalid timestamps
* incorrect difficulty values

## Repair Strategy

* staging-table-based repair workflow
* safe updates and deletes
* before/after validation evidence

---

# Safety Principle

Original imported tables are never modified directly.

All repair operations are performed on:

* staging tables
* copied repair tables

This prevents accidental data loss.

---

# Assumptions

* CSV imports may contain inconsistent records
* some foreign keys may not have been enforced during raw import
* blank strings are treated similar to NULL in many checks
