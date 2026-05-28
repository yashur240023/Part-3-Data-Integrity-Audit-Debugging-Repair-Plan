-- =====================================================
-- CREATE STAGING TABLES
-- =====================================================

CREATE TABLE staging_students AS
SELECT * FROM students;

CREATE TABLE staging_submission_results AS
SELECT * FROM submission_results;

CREATE TABLE staging_attendance AS
SELECT * FROM attendance;

--------------------------------------------------------
-- REPAIR 1: FIX NEGATIVE SCORES
--------------------------------------------------------

-- BEFORE

SELECT *
FROM staging_submission_results
WHERE score < 0;

-- REPAIR

UPDATE staging_submission_results
SET score = NULL
WHERE score < 0;

-- AFTER

SELECT *
FROM staging_submission_results
WHERE score < 0;

--------------------------------------------------------
-- REPAIR 2: FIX SCORES ABOVE 100
--------------------------------------------------------

-- BEFORE

SELECT *
FROM staging_submission_results
WHERE score > 100;

-- REPAIR

UPDATE staging_submission_results
SET score = 100
WHERE score > 100;

-- AFTER

SELECT *
FROM staging_submission_results
WHERE score > 100;

--------------------------------------------------------
-- REPAIR 3: FIX INVALID ATTENDANCE STATUS
--------------------------------------------------------

-- BEFORE

SELECT *
FROM staging_attendance
WHERE attendance_status = 'YES';

-- REPAIR

UPDATE staging_attendance
SET attendance_status = 'Present'
WHERE attendance_status = 'YES';

-- AFTER

SELECT *
FROM staging_attendance
WHERE attendance_status = 'YES';

--------------------------------------------------------
-- REPAIR 4: REMOVE DUPLICATE ENROLLMENTS
--------------------------------------------------------

-- BEFORE

SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- REPAIR

DELETE FROM enrollments
WHERE enrollment_id NOT IN
(
    SELECT MIN(enrollment_id)
    FROM enrollments
    GROUP BY student_id, course_id
);

-- AFTER

SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

--------------------------------------------------------
-- REPAIR 5: FIX INVALID DIFFICULTY
--------------------------------------------------------

-- BEFORE

SELECT *
FROM problems
WHERE difficulty = 'Very Hard';

-- REPAIR

UPDATE problems
SET difficulty = 'Hard'
WHERE difficulty = 'Very Hard';

-- AFTER

SELECT *
FROM problems
WHERE difficulty = 'Very Hard';
