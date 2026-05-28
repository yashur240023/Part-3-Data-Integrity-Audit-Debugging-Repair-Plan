-- =====================================================
-- PRIMARY KEY DUPLICATE CHECKS
-- =====================================================

SELECT student_id, COUNT(*)
FROM students
GROUP BY student_id
HAVING COUNT(*) > 1;

--------------------------------------------------------

SELECT course_id, COUNT(*)
FROM courses
GROUP BY course_id
HAVING COUNT(*) > 1;

--------------------------------------------------------

-- DUPLICATE EMAIL CHECK

SELECT email, COUNT(*)
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

--------------------------------------------------------

-- DUPLICATE ENROLLMENTS

SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

--------------------------------------------------------

-- DUPLICATE CONTEST-PROBLEM MAPPINGS

SELECT contest_id, problem_id, COUNT(*)
FROM contest_problems
GROUP BY contest_id, problem_id
HAVING COUNT(*) > 1;

--------------------------------------------------------

-- DUPLICATE TEST RESULTS

SELECT submission_id, testcase_id, COUNT(*)
FROM submission_results
GROUP BY submission_id, testcase_id
HAVING COUNT(*) > 1;

--------------------------------------------------------

-- DUPLICATE ATTENDANCE RECORDS

SELECT student_id, session_id, COUNT(*)
FROM attendance
GROUP BY student_id, session_id
HAVING COUNT(*) > 1;

--------------------------------------------------------
-- FOREIGN KEY AUDITS
--------------------------------------------------------

-- Students linked to missing batches

SELECT s.student_id, s.batch_id
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id
WHERE b.batch_id IS NULL;

--------------------------------------------------------

-- Enrollments linked to missing students

SELECT e.enrollment_id
FROM enrollments e
LEFT JOIN students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

--------------------------------------------------------

-- Enrollments linked to missing courses

SELECT e.enrollment_id
FROM enrollments e
LEFT JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

--------------------------------------------------------

-- Testcases linked to missing problems

SELECT tc.testcase_id
FROM test_cases tc
LEFT JOIN problems p
ON tc.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

--------------------------------------------------------

-- Contest mappings linked to missing contests

SELECT cp.contest_id, cp.problem_id
FROM contest_problems cp
LEFT JOIN contests c
ON cp.contest_id = c.contest_id
WHERE c.contest_id IS NULL;

--------------------------------------------------------

-- Contest mappings linked to missing problems

SELECT cp.contest_id, cp.problem_id
FROM contest_problems cp
LEFT JOIN problems p
ON cp.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

--------------------------------------------------------

-- Submissions linked to missing students

SELECT s.submission_id
FROM submissions s
LEFT JOIN students st
ON s.student_id = st.student_id
WHERE st.student_id IS NULL;

--------------------------------------------------------

-- Submissions linked to missing problems

SELECT s.submission_id
FROM submissions s
LEFT JOIN problems p
ON s.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

--------------------------------------------------------

-- Test results linked to missing submissions

SELECT sr.result_id
FROM submission_results sr
LEFT JOIN submissions s
ON sr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;

--------------------------------------------------------

-- Attendance linked to missing students

SELECT a.attendance_id
FROM attendance a
LEFT JOIN students s
ON a.student_id = s.student_id
WHERE s.student_id IS NULL;

--------------------------------------------------------

-- Attendance linked to missing sessions

SELECT a.attendance_id
FROM attendance a
LEFT JOIN sessions se
ON a.session_id = se.session_id
WHERE se.session_id IS NULL;

--------------------------------------------------------

-- Regrade requests linked to missing submissions

SELECT r.request_id
FROM regrade_requests r
LEFT JOIN submissions s
ON r.submission_id = s.submission_id
WHERE s.submission_id IS NULL;

--------------------------------------------------------

-- Plagiarism flags linked to missing submissions

SELECT p.flag_id
FROM plagiarism_flags p
LEFT JOIN submissions s
ON p.submission_id = s.submission_id
WHERE s.submission_id IS NULL;
