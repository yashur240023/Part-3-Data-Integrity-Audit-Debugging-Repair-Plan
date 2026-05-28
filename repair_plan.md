# Repair Plan

# Repair Strategy

The repair process follows a safe staged workflow:

1. detect invalid records
2. copy affected records into staging tables
3. repair only staging data
4. validate repaired data
5. move corrected data into production tables

---

# Example Repairs

## Example 1

### Issue

Duplicate email detected.

```text id="0h2y2n"
student_id = 204
email = 'amit@gmail.com'
```

### Action

Manual verification required.

### Reason

Email uniqueness is critical for authentication.

---

## Example 2

### Issue

Negative score detected.

```text id="j9m4cf"
result_id = 5501
score = -10
```

### Action

Correct score to NULL and move for review.

---

## Example 3

### Issue

Score greater than maximum.

```text id="h7k9mv"
result_id = 5520
score = 140
```

### Action

Clamp value to 100 after verification.

---

## Example 4

### Issue

Submission references missing student.

```text id="oj4e4m"
submission_id = 9005
student_id = 99999
```

### Action

Move record to rejected staging table.

---

## Example 5

### Issue

Invalid difficulty value.

```text id="jygjlwm"
problem_id = 3002
difficulty = 'Very Hard'
```

### Action

Convert to 'Hard'.

---

## Example 6

### Issue

Attendance contains invalid status.

```text id="u1u4sv"
attendance_id = 8001
attendance_status = 'YES'
```

### Action

Replace with 'Present'.

---

## Example 7

### Issue

Contest end time before start time.

```text id="zod0ph"
contest_id = 7001
```

### Action

Manual timestamp verification required.

---

## Example 8

### Issue

Duplicate enrollment.

```text id="9jylg0"
student_id = 120
course_id = 15
```

### Action

Delete duplicate rows while keeping earliest record.

---

# Decision Rules

| Issue Type            | Repair Action               |
| --------------------- | --------------------------- |
| Invalid format        | Correct if safely inferable |
| Missing foreign key   | Move to staging             |
| Duplicate rows        | Remove duplicates           |
| Invalid timestamps    | Manual verification         |
| Mandatory NULL values | Reject or repair            |
| Impossible scores     | Correct or quarantine       |

---

# Important Principle

No repair is performed directly on production tables.
All changes occur on staging copies first.
