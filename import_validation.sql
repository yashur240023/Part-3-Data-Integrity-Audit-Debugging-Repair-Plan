-- =====================================================
-- ROW COUNT VALIDATION
-- =====================================================

SELECT 'students' AS table_name, COUNT(*) AS total_rows
FROM students;

SELECT 'courses' AS table_name, COUNT(*) AS total_rows
FROM courses;

SELECT 'batches' AS table_name, COUNT(*) AS total_rows
FROM batches;

SELECT 'enrollments' AS table_name, COUNT(*) AS total_rows
FROM enrollments;

SELECT 'problems' AS table_name, COUNT(*) AS total_rows
FROM problems;

SELECT 'submissions' AS table_name, COUNT(*) AS total_rows
FROM submissions;

SELECT 'submission_results' AS table_name, COUNT(*) AS total_rows
FROM submission_results;

--------------------------------------------------------

-- DISTINCT PRIMARY KEY VALIDATION

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT student_id) AS distinct_student_ids
FROM students;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT course_id) AS distinct_course_ids
FROM courses;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT submission_id) AS distinct_submission_ids
FROM submissions;

--------------------------------------------------------

-- NULL / BLANK CHECKS

SELECT COUNT(*) AS missing_student_names
FROM students
WHERE student_name IS NULL
   OR TRIM(student_name) = '';

SELECT COUNT(*) AS missing_emails
FROM students
WHERE email IS NULL
   OR TRIM(email) = '';

SELECT COUNT(*) AS missing_problem_titles
FROM problems
WHERE title IS NULL
   OR TRIM(title) = '';

--------------------------------------------------------

-- EMPTY TABLE CHECK

SELECT 'attendance' AS table_name
WHERE NOT EXISTS (SELECT 1 FROM attendance);

SELECT 'contest_problems' AS table_name
WHERE NOT EXISTS (SELECT 1 FROM contest_problems);

--------------------------------------------------------

-- CSV IMPORT VALIDATION NOTE
-- Compare SQL row counts with raw CSV row counts manually.
