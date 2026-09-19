-- ============================================================
-- University Database Lab: Problem Set 1 (Exercises 1 to 57)
-- Schema: Silberschatz, Korth and Sudarshan (7th Edition)
-- ============================================================

-- ============================================================
-- Question 1: Find out the ID and salary of the instructors.
-- ============================================================

SELECT ID, salary
FROM   instructor;


-- ============================================================
-- Question 2: Find out the ID and salary of every instructor earning more than $85,000.
-- ============================================================

SELECT ID, salary
FROM   instructor
WHERE  salary > 85000;


-- ============================================================
-- Question 3: Find out the department names and their budget at the university.
-- ============================================================

SELECT dept_name, budget
FROM   department;


-- ============================================================
-- Question 4: Names of Computer Science instructors earning more than $70,000.
-- ============================================================

SELECT name
FROM   instructor
WHERE  dept_name = 'Comp. Sci.'
       AND salary > 70000;


-- ============================================================
-- Question 5: For every instructor who has taught some course, list their names
-- and the course IDs of all courses they taught.
-- ============================================================

SELECT DISTINCT i.name, t.course_id
FROM   instructor i
       JOIN teaches t ON t.ID = i.ID;


-- ============================================================
-- Question 6: Names of instructors whose salary is greater than at least one
-- instructor in the Biology department.
-- ============================================================

SELECT name
FROM   instructor
WHERE  salary > (SELECT MIN(salary)
                 FROM   instructor
                 WHERE  dept_name = 'Biology');


-- ============================================================
-- Question 7: Advisor of the student with ID 12345.
-- ============================================================

SELECT i_ID
FROM   advisor
WHERE  s_ID = 12345;


-- ============================================================
-- Question 8: Average salary of all instructors.
-- ============================================================

SELECT AVG(salary) AS avg_salary
FROM   instructor;


-- ============================================================
-- Question 9: Names of departments whose building name contains 'Watson'.
-- ============================================================

SELECT dept_name
FROM   department
WHERE  building LIKE '%Watson%';


-- ============================================================
-- Question 10: Names of instructors earning between $90,000 and $100,000.
-- ============================================================

SELECT name
FROM   instructor
WHERE  salary BETWEEN 90000 AND 100000;


-- ============================================================
-- Question 11: Names of instructors in Biology who have taught some course,
-- with the courses they taught.
-- ============================================================

SELECT DISTINCT i.name, t.course_id
FROM   instructor i
       JOIN teaches t ON t.ID = i.ID
WHERE  i.dept_name = 'Biology';


-- ============================================================
-- Question 12: Distinct courses taught in Fall-2009.
-- ============================================================

SELECT DISTINCT course_id
FROM   teaches
WHERE  semester = 'Fall' AND year = 2009;


-- ============================================================
-- Question 13: Distinct courses taught in Fall-2009 OR Spring-2010.
-- ============================================================

SELECT DISTINCT course_id
FROM   teaches
WHERE  (semester = 'Fall'   AND year = 2009)
    OR (semester = 'Spring' AND year = 2010);


-- ============================================================
-- Question 14: Distinct courses taught in BOTH Fall-2009 AND Spring-2010.
-- ============================================================

SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
INTERSECT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;


-- ============================================================
-- Question 15: Distinct courses taught in Fall-2009 but NOT in Spring-2010.
-- ============================================================

SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
EXCEPT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;


-- ============================================================
-- Question 16: Instructors with NULL salary values.
-- ============================================================

SELECT *
FROM   instructor
WHERE  salary IS NULL;


-- ============================================================
-- Question 17: Average salary in the Finance department.
-- ============================================================

SELECT AVG(salary) AS avg_salary
FROM   instructor
WHERE  dept_name = 'Finance';


-- ============================================================
-- Question 18: Total number of instructors who teach a course in Spring-2010.
-- ============================================================

SELECT COUNT(DISTINCT ID) AS instructor_count
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;


-- ============================================================
-- Question 19: Average salary in each department.
-- ============================================================

SELECT dept_name, AVG(salary) AS avg_salary
FROM   instructor
GROUP  BY dept_name;


-- ============================================================
-- Question 20: Number of instructors per department who teach in Spring-2010.
-- ============================================================

SELECT i.dept_name, COUNT(DISTINCT i.ID) AS instructor_count
FROM   instructor i
       JOIN teaches t ON t.ID = i.ID
WHERE  t.semester = 'Spring' AND t.year = 2010
GROUP  BY i.dept_name;


-- ============================================================
-- Question 21: Departments where the average instructor salary is greater than $42,000.
-- ============================================================

SELECT dept_name
FROM   instructor
GROUP  BY dept_name
HAVING AVG(salary) > 42000;


-- ============================================================
-- Question 22: For every course section offered in 2009 with at least 2 enrolled
-- students, the average total-credits (tot_cred) of those students.
-- ============================================================

SELECT t.course_id, t.sec_id, AVG(s.tot_cred) AS avg_tot_cred
FROM   takes  t
       JOIN student s ON s.ID = t.ID
WHERE  t.year = 2009
GROUP  BY t.course_id, t.sec_id
HAVING COUNT(*) >= 2;


-- ============================================================
-- Question 23: Courses taught in BOTH Fall-2009 and Spring-2010.
-- ============================================================

SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
INTERSECT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;


-- ============================================================
-- Question 24: Courses taught in Fall-2009 but NOT in Spring-2010.
-- ============================================================

SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
EXCEPT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;


-- ============================================================
-- Question 25: Names of instructors whose names are neither 'Mozart' nor 'Einstein'.
-- ============================================================

SELECT name
FROM   instructor
WHERE  name <> 'Mozart' AND name <> 'Einstein';


-- ============================================================
-- Question 26: Total number of distinct students taught by instructor ID 110011.
-- ============================================================

SELECT COUNT(DISTINCT t.ID) AS student_count
FROM   takes  t
       JOIN teaches te ON te.course_id = t.course_id
                       AND te.sec_id    = t.sec_id
                       AND te.semester  = t.semester
                       AND te.year      = t.year
WHERE  te.ID = 110011;


-- ============================================================
-- Question 27: Names & IDs of instructors whose salary is greater than at least
-- one instructor in History.
-- ============================================================

SELECT ID, name
FROM   instructor
WHERE  salary > (SELECT MIN(salary)
                 FROM   instructor
                 WHERE  dept_name = 'History');


-- ============================================================
-- Question 28: Names of instructors whose salary is greater than every instructor
-- in the Biology department.
-- ============================================================

SELECT name
FROM   instructor
WHERE  salary > (SELECT MAX(salary)
                 FROM   instructor
                 WHERE  dept_name = 'Biology');


-- ============================================================
-- Question 29: Departments with the highest average salary.
-- ============================================================

SELECT dept_name
FROM   instructor
GROUP  BY dept_name
HAVING AVG(salary) = (SELECT MAX(dept_avg)
                       FROM   (SELECT AVG(salary) AS dept_avg
                                FROM   instructor
                                GROUP  BY dept_name));


-- ============================================================
-- Question 30: Courses taught in BOTH Fall-2009 and Spring-2010.
-- ============================================================

SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
INTERSECT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;


-- ============================================================
-- Question 31: Find every student who has taken all courses offered by the
-- Biology department.
-- ============================================================

SELECT s.ID, s.name
FROM   student s
WHERE  NOT EXISTS (SELECT c.course_id
                    FROM   course c
                    WHERE  c.dept_name = 'Biology'
                    AND    NOT EXISTS (SELECT 1
                                        FROM   takes t
                                        WHERE  t.ID = s.ID
                                        AND    t.course_id = c.course_id));


-- ============================================================
-- Question 32: Courses offered at most once in 2009.
-- ============================================================

SELECT course_id
FROM   section
WHERE  year = 2009
GROUP  BY course_id
HAVING COUNT(*) <= 1;


-- ============================================================
-- Question 33: Courses offered at least twice in 2009.
-- ============================================================

SELECT course_id
FROM   section
WHERE  year = 2009
GROUP  BY course_id
HAVING COUNT(*) >= 2;


-- ============================================================
-- Question 34: Average instructor salary for departments with avg salary > $42,000.
-- ============================================================

SELECT dept_name, AVG(salary) AS avg_salary
FROM   instructor
GROUP  BY dept_name
HAVING AVG(salary) > 42000;


-- ============================================================
-- Question 35: Maximum total salary across all departments.
-- ============================================================

SELECT MAX(dept_total) AS max_total_salary
FROM   (SELECT SUM(salary) AS dept_total
         FROM   instructor
         GROUP  BY dept_name);


-- ============================================================
-- Question 36: All departments along with the number of instructors in each.
-- ============================================================

SELECT d.dept_name, COUNT(i.ID) AS instructor_count
FROM   department d
       LEFT JOIN instructor i ON i.dept_name = d.dept_name
GROUP  BY d.dept_name;


-- ============================================================
-- Question 37: Titles of Comp. Sci. courses worth 3 credits.
-- ============================================================

SELECT title
FROM   course
WHERE  dept_name = 'Comp. Sci.'
       AND credits = 3;


-- ============================================================
-- Question 38: Distinct IDs of students taught by an instructor named 'Einstein'.
-- ============================================================

SELECT DISTINCT t.ID
FROM   takes  t
       JOIN teaches te ON te.course_id = t.course_id
                       AND te.sec_id    = t.sec_id
                       AND te.semester  = t.semester
                       AND te.year      = t.year
       JOIN instructor i ON i.ID = te.ID
WHERE  i.name = 'Einstein';


-- ============================================================
-- Question 39: Highest salary of any instructor.
-- ============================================================

SELECT MAX(salary) AS max_salary
FROM   instructor;


-- ============================================================
-- Question 40: All instructors earning the highest salary.
-- ============================================================

SELECT *
FROM   instructor
WHERE  salary = (SELECT MAX(salary) FROM instructor);


-- ============================================================
-- Question 41: Enrollment of every section that was offered in Autumn-2009.
-- ============================================================

SELECT course_id, sec_id, COUNT(*) AS enrollment
FROM   takes
WHERE  semester = 'Fall' AND year = 2009
GROUP  BY course_id, sec_id;


-- ============================================================
-- Question 42: Maximum enrollment across all sections in Autumn-2009.
-- ============================================================

SELECT MAX(enrollment) AS max_enrollment
FROM   (SELECT COUNT(*) AS enrollment
         FROM   takes
         WHERE  semester = 'Fall' AND year = 2009
         GROUP  BY course_id, sec_id);


-- ============================================================
-- Question 43: Salaries after a 10% raise for instructors in Comp. Sci.
-- ============================================================

SELECT ID, name, salary * 1.10 AS new_salary
FROM   instructor
WHERE  dept_name = 'Comp. Sci.';


-- ============================================================
-- Question 44: All students who have not taken a single course.
-- ============================================================

SELECT s.ID, s.name
FROM   student s
       LEFT JOIN takes t ON t.ID = s.ID
WHERE  t.course_id IS NULL;


-- ============================================================
-- Question 45: Physics sections offered in Fall-2009, with building and room number.
-- ============================================================

SELECT sec.course_id, sec.sec_id, sec.building, sec.room_number
FROM   section sec
       JOIN course c ON c.course_id = sec.course_id
WHERE  c.dept_name = 'Physics'
       AND sec.semester = 'Fall'
       AND sec.year     = 2009;


-- ============================================================
-- Question 46: Student names who take any Spring-2010 course held in Watson building.
-- ============================================================

SELECT DISTINCT s.name
FROM   student s
       JOIN takes   t  ON t.ID = s.ID
       JOIN section sec ON sec.course_id = t.course_id
                         AND sec.sec_id    = t.sec_id
                         AND sec.semester  = t.semester
                         AND sec.year      = t.year
WHERE  sec.semester = 'Spring'
       AND sec.year     = 2010
       AND sec.building = 'Watson';


-- ============================================================
-- Question 47: Students who take a course taught by 'Brandt'.
-- ============================================================

SELECT DISTINCT s.ID, s.name
FROM   student s
       JOIN takes   t  ON t.ID = s.ID
       JOIN teaches te ON te.ID = (SELECT ID FROM instructor WHERE name = 'Brandt')
                        AND te.course_id = t.course_id
                        AND te.sec_id    = t.sec_id
                        AND te.semester  = t.semester
                        AND te.year      = t.year;


-- ============================================================
-- Question 48: Average salary of the instructors in each department.
-- ============================================================

SELECT dept_name, AVG(salary) AS avg_salary
FROM   instructor
GROUP  BY dept_name;


-- ============================================================
-- Question 49: Number of students taking the course titled 'Intro. to Computer Science'.
-- ============================================================

SELECT COUNT(DISTINCT t.ID) AS student_count
FROM   takes t
       JOIN course c ON c.course_id = t.course_id
WHERE  c.title = 'Intro. to Computer Science';


-- ============================================================
-- Question 50: Total salary of Comp. Sci. instructors who teach a course in the
-- Watson building.
-- ============================================================

SELECT SUM(DISTINCT i.salary) AS total_salary
FROM   instructor i
       JOIN teaches   te ON te.ID = i.ID
       JOIN section   sec ON sec.course_id = te.course_id
                          AND sec.sec_id    = te.sec_id
                          AND sec.semester  = te.semester
                          AND sec.year      = te.year
WHERE  i.dept_name = 'Comp. Sci.'
       AND sec.building = 'Watson';


-- ============================================================
-- Question 51: Course titles whose start-time is between 10:00 and 12:00.
-- ============================================================

SELECT DISTINCT c.title
FROM   course    c
       JOIN section  sec ON sec.course_id = c.course_id
       JOIN time_slot ts ON ts.time_slot_id = sec.time_slot_id
WHERE  ts.start_hr = 10
    OR (ts.start_hr = 11 AND ts.start_min = 0)
    OR (ts.start_hr = 12 AND ts.start_min = 0);


-- ============================================================
-- Question 52: Courses whose prerequisite is CS-101.
-- ============================================================

SELECT course_id
FROM   prereq
WHERE  prereq_id = 'CS-101';


-- ============================================================
-- Question 53: Student names who earned more than a B+ in any of their courses.
-- ============================================================

SELECT DISTINCT s.name
FROM   student s
       JOIN takes t ON t.ID = s.ID
WHERE  t.grade IN ('A-','A','A+','B');


-- ============================================================
-- Question 54: Student with the maximum tot_cred in each department.
-- ============================================================

SELECT s.dept_name, s.ID, s.name, s.tot_cred
FROM   student s
WHERE  s.tot_cred = (SELECT MAX(tot_cred)
                     FROM   student s2
                     WHERE  s2.dept_name = s.dept_name);


-- ============================================================
-- Question 55: Student IDs and grades for any course taken in Spring-2009.
-- ============================================================

SELECT ID, grade
FROM   takes
WHERE  semester = 'Spring' AND year = 2009;


-- ============================================================
-- Question 56: Building(s) where the student takes the course 'Image Processing'.
-- ============================================================

SELECT DISTINCT sec.building
FROM   section sec
       JOIN course c ON c.course_id = sec.course_id
WHERE  c.title = 'Image Processing';


-- ============================================================
-- Question 57: Room number and building for courses that a student from Fall-2009
-- can take (i.e. sections offered in Fall-2009).
-- ============================================================

SELECT DISTINCT sec.building, sec.room_number
FROM   section sec
WHERE  sec.semester = 'Fall'
       AND sec.year     = 2009;
