-- =====================================================
-- NEGATIVE SCORES
-- =====================================================

SELECT *
FROM submission_results
WHERE score < 0;

--------------------------------------------------------

-- SCORES ABOVE MAXIMUM

SELECT *
FROM submission_results
WHERE score > 100;

--------------------------------------------------------

-- INVALID DIFFICULTY VALUES

SELECT *
FROM problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

--------------------------------------------------------

-- INVALID SUBMISSION STATUS

SELECT *
FROM submissions
WHERE status NOT IN
(
    'Accepted',
    'Wrong Answer',
    'Runtime Error',
    'Time Limit Exceeded'
);

--------------------------------------------------------

-- INVALID PROGRAMMING LANGUAGES

SELECT *
FROM submissions
WHERE language NOT IN
(
    'Python',
    'Java',
    'C++',
    'C',
    'JavaScript'
);

--------------------------------------------------------

-- INVALID TEST RESULT STATUS

SELECT *
FROM submission_results
WHERE verdict NOT IN ('Pass', 'Fail');

--------------------------------------------------------

-- INVALID ATTENDANCE STATUS

SELECT *
FROM attendance
WHERE attendance_status NOT IN
(
    'Present',
    'Absent'
);

--------------------------------------------------------

-- END TIME BEFORE START TIME

SELECT *
FROM contests
WHERE end_time < start_time;

--------------------------------------------------------

-- RESOLVED TIME BEFORE REQUESTED TIME

SELECT *
FROM regrade_requests
WHERE resolved_time < request_time;

--------------------------------------------------------

-- SUBMISSION BEFORE ENROLLMENT

SELECT
    s.submission_id,
    s.submission_time,
    e.enrollment_date
FROM submissions s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE s.submission_time < e.enrollment_date;

--------------------------------------------------------

-- MANDATORY NULL CHECKS

SELECT *
FROM students
WHERE student_name IS NULL
   OR email IS NULL;

--------------------------------------------------------

SELECT *
FROM problems
WHERE title IS NULL;
