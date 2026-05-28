# Before and After Repair Evidence

# Repair 1 — Negative Scores

## Before

| result_id | score |
| --------- | ----- |
| 5501      | -10   |

## Action

Updated invalid negative score to NULL.

## After

| result_id | score |
| --------- | ----- |
| 5501      | NULL  |

---

# Repair 2 — Scores Above Maximum

## Before

| result_id | score |
| --------- | ----- |
| 5520      | 140   |

## Action

Score corrected to 100.

## After

| result_id | score |
| --------- | ----- |
| 5520      | 100   |

---

# Repair 3 — Invalid Attendance Status

## Before

| attendance_id | attendance_status |
| ------------- | ----------------- |
| 8001          | YES               |

## Action

Replaced YES with Present.

## After

| attendance_id | attendance_status |
| ------------- | ----------------- |
| 8001          | Present           |

---

# Repair 4 — Duplicate Enrollment

## Before

| student_id | course_id | count |
| ---------- | --------- | ----- |
| 120        | 15        | 2     |

## Action

Removed duplicate rows and kept earliest enrollment.

## After

No duplicate enrollment rows remain.

---

# Repair 5 — Invalid Difficulty

## Before

| problem_id | difficulty |
| ---------- | ---------- |
| 3002       | Very Hard  |

## Action

Converted invalid value to Hard.

## After

| problem_id | difficulty |
| ---------- | ---------- |
| 3002       | Hard       |

---

# Validation Summary

After repairs:

* no negative scores remain
* no scores exceed maximum
* attendance statuses are standardized
* duplicate enrollments removed
* invalid difficulty values corrected

This improves consistency and referential integrity of the staging database.
