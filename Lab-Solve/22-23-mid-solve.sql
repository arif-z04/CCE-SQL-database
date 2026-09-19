-- ============================================================
-- 1. Find all instructors from the 'Physics' department
--    with salary > 50000
-- ============================================================

SELECT *
FROM instructor
WHERE dept_name = 'Physics'
  AND salary > 50000;


-- ============================================================
-- 2. Find courses taught by instructors along with their
--    sections and classrooms
-- ============================================================

SELECT
    c.course_id,
    c.title,
    i.name AS instructor_name,
    s.sec_id,
    s.semester,
    s.year,
    s.building,
    s.room_number
FROM course AS c
JOIN teaches AS t
    ON c.course_id = t.course_id
JOIN instructor AS i
    ON t.ID = i.ID
JOIN section AS s
    ON t.course_id = s.course_id
   AND t.sec_id = s.sec_id
   AND t.semester = s.semester
   AND t.year = s.year;


-- ============================================================
-- 3. Find departments with average instructor salary > 60000
--    and more than 2 instructors
-- ============================================================

SELECT
    dept_name,
    AVG(salary) AS average_salary,
    COUNT(*) AS instructor_count
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 60000
   AND COUNT(*) > 2;


-- ============================================================
-- 4. Find students who have taken courses from both
--    'Comp. Sci.' and 'Physics' departments
-- ============================================================

SELECT
    s.ID,
    s.name
FROM student AS s
JOIN takes AS t
    ON s.ID = t.ID
JOIN course AS c
    ON t.course_id = c.course_id
WHERE c.dept_name IN ('Comp. Sci.', 'Physics')
GROUP BY s.ID, s.name
HAVING COUNT(DISTINCT c.dept_name) = 2;