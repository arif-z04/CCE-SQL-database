-- Question 11: Names of instructors in Biology who have taught some course,
-- with the courses they taught.
SELECT DISTINCT i.name, t.course_id
FROM   instructor i
       JOIN teaches t ON t.ID = i.ID
WHERE  i.dept_name = 'Biology';