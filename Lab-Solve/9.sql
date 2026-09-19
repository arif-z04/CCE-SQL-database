-- Question 9: Names of departments whose building name contains 'Watson'.
SELECT dept_name
FROM   department
WHERE  building LIKE '%Watson%';