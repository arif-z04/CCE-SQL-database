-- ============================================================
-- 01. Find the titles of courses in the Comp. Sci. department
--     that have 3 credits.
-- ============================================================

SELECT title
FROM course
WHERE dept_name = 'Comp. Sci.'
  AND credits = 3;


-- ============================================================
-- 02. Find the IDs of all students who were taught by an
--     instructor named Einstein; make sure there are no
--     duplicates in the result.
-- ============================================================

SELECT DISTINCT s.ID
FROM student AS s
JOIN takes AS t
    ON s.ID = t.ID
JOIN teaches AS tc
    ON t.course_id = tc.course_id
   AND t.sec_id = tc.sec_id
   AND t.semester = tc.semester
   AND t.year = tc.year
JOIN instructor AS i
    ON tc.ID = i.ID
WHERE i.name = 'Einstein';


-- ============================================================
-- 03. Find the ID and name of each student who has taken at
--     least one Comp. Sci. course; make sure there are no
--     duplicate names in the result.
-- ============================================================

SELECT DISTINCT s.ID, s.name
FROM student AS s
JOIN takes AS t
    ON s.ID = t.ID
JOIN course AS c
    ON t.course_id = c.course_id
WHERE c.dept_name = 'Comp. Sci.';


-- ============================================================
-- 04. Find the course id, section id, and building for each
--     section of a Biology course.
-- ============================================================

SELECT s.course_id, s.sec_id, s.building
FROM section AS s
JOIN course AS c
    ON s.course_id = c.course_id
WHERE c.dept_name = 'Biology';


-- ============================================================
-- 05. Output instructor names sorted by the ratio of their
--     salary to their department's budget (in ascending order).
-- ============================================================

SELECT i.name
FROM instructor AS i
JOIN department AS d
    ON i.dept_name = d.dept_name
ORDER BY i.salary / d.budget ASC;


-- ============================================================
-- 06. Output instructor names and buildings for each building
--     an instructor has taught in. Include instructor names
--     who have not taught any classes (the building name should
--     be NULL in this case).
-- ============================================================

SELECT DISTINCT
    i.name,
    s.building
FROM instructor AS i
LEFT JOIN teaches AS t
    ON i.ID = t.ID
LEFT JOIN section AS s
    ON t.course_id = s.course_id
   AND t.sec_id = s.sec_id
   AND t.semester = s.semester
   AND t.year = s.year;


-- ============================================================
-- 07. Find the names of those departments whose budget is
--     higher than that of Astronomy. List them in alphabetic
--     order.
-- ============================================================

SELECT dept_name
FROM department
WHERE budget > (
    SELECT budget
    FROM department
    WHERE dept_name = 'Astronomy'
)
ORDER BY dept_name ASC;


-- ============================================================
-- 08. Output instructor names and buildings for each building
--     an instructor has taught in. Include instructor names
--     who have not taught any classes (the building name should
--     be NULL in this case).
-- ============================================================

SELECT DISTINCT
    i.name,
    s.building
FROM instructor AS i
LEFT JOIN teaches AS t
    ON i.ID = t.ID
LEFT JOIN section AS s
    ON t.course_id = s.course_id
   AND t.sec_id = s.sec_id
   AND t.semester = s.semester
   AND t.year = s.year;


-- ============================================================
-- 09. For each student who has retaken a course at least twice
--     (i.e., the student has taken the course at least three
--     times), show the course ID and the student's ID.
--     Display the results in order of course ID and do not
--     display duplicate rows.
-- ============================================================

SELECT
    course_id,
    ID
FROM takes
GROUP BY course_id, ID
HAVING COUNT(*) >= 3
ORDER BY course_id ASC;