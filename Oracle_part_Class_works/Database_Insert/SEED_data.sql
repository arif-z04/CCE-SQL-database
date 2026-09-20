-- =============================================================================
-- SEED DATA for Oracle Part Class Works
-- Directory: Oracle_part_Class_works/
-- Database:  Oracle Database (compatible with Oracle 11g, 19c, 21c, 23ai / XE)
-- Author:    Murad Sir (MRD) Database Curriculum Synthesis
-- =============================================================================
-- NOTE:
--   1. Run DDL.sql first to create tables, views, and constraints.
--   2. Insertion order strictly satisfies Foreign Key dependencies:
--      - DEPARTMENTS before EMPLOYEES
--      - Managers before Subordinates
--   3. Explicit COMMIT is issued at the end to persist transactions.
-- =============================================================================

-- =============================================================================
-- MODULE 1: ADVANCED SQL CONCEPTS SEED DATA
-- Source: Advance SQL Concepts.txt
-- =============================================================================

-- 1. DEPARTMENTS
INSERT INTO DEPARTMENTS (dept_id, dept_name) VALUES (10, 'Administration');
INSERT INTO DEPARTMENTS (dept_id, dept_name) VALUES (20, 'Software Engineering');
INSERT INTO DEPARTMENTS (dept_id, dept_name) VALUES (30, 'Finance & Accounting');
INSERT INTO DEPARTMENTS (dept_id, dept_name) VALUES (40, 'Human Resources');
INSERT INTO DEPARTMENTS (dept_id, dept_name) VALUES (50, 'Marketing');

-- 2. EMPLOYEES (Hierarchical Organization)
-- 1. CEO (No manager)
INSERT INTO EMPLOYEES (emp_id, emp_name, salary, dept_id, manager_id)
VALUES (101, 'Rahim Chowdhury', 120000.00, 10, NULL);

-- 2. Software Lead (Manager: 101)
INSERT INTO EMPLOYEES (emp_id, emp_name, salary, dept_id, manager_id)
VALUES (102, 'Karim Hasan', 85000.00, 20, 101);

-- 3. Accounts Head (Manager: 101)
INSERT INTO EMPLOYEES (emp_id, emp_name, salary, dept_id, manager_id)
VALUES (103, 'Nusrat Jahan', 75000.00, 30, 101);

-- 4. Junior Developer (Manager: 102)
INSERT INTO EMPLOYEES (emp_id, emp_name, salary, dept_id, manager_id)
VALUES (104, 'Tanvir Ahmed', 45000.00, 20, 102);

-- 5. HR Executive (Manager: 101)
INSERT INTO EMPLOYEES (emp_id, emp_name, salary, dept_id, manager_id)
VALUES (105, 'Sultana Razia', 50000.00, 40, 101);


-- =============================================================================
-- MODULE 2: ANALYTICAL FUNCTIONS & PL/SQL CURSORS SEED DATA
-- Source: Analytical-Window Functions.txt, Implicit/Explicit Cursor files
-- =============================================================================

-- EMPLOYEES1 (IT, HR, Finance)
-- Employee 1 (IT Department)
INSERT INTO EMPLOYEES1 (ID, NAME, DEPARTMENT, SALARY)
VALUES (101, 'Rahim Islam', 'IT', 50000.00);

-- Employee 2 (IT Department)
INSERT INTO EMPLOYEES1 (ID, NAME, DEPARTMENT, SALARY)
VALUES (102, 'Karim Hassan', 'IT', 50000.00);

-- Employee 3 (HR Department)
INSERT INTO EMPLOYEES1 (ID, NAME, DEPARTMENT, SALARY)
VALUES (103, 'Nusrat Jahan', 'HR', 45000.00);

-- Employee 4 (HR Department)
INSERT INTO EMPLOYEES1 (ID, NAME, DEPARTMENT, SALARY)
VALUES (104, 'Tanvir Hossain', 'HR', 40000.00);

-- Employee 5 (Finance Department)
INSERT INTO EMPLOYEES1 (ID, NAME, DEPARTMENT, SALARY)
VALUES (105, 'Ayesha Siddiqua', 'Finance', 60000.00);


-- =============================================================================
-- MODULE 3: DATABASE TRIGGERS (EMPLOYEE BASE DATA)
-- Source: Trigger part2.txt, Trigger part4.txt
-- Note: Salary values satisfy minimum policy (>= 20000)
-- =============================================================================

INSERT INTO EMPLOYEE (emp_id, name, salary) VALUES (101, 'Rahim', 30000.00);
INSERT INTO EMPLOYEE (emp_id, name, salary) VALUES (102, 'Karim', 35000.00);
INSERT INTO EMPLOYEE (emp_id, name, salary) VALUES (103, 'Hasan', 40000.00);
INSERT INTO EMPLOYEE (emp_id, name, salary) VALUES (104, 'Jamal', 45000.00);
INSERT INTO EMPLOYEE (emp_id, name, salary) VALUES (105, 'Sakib', 50000.00);


-- =============================================================================
-- MODULE 4: DATABASE TRIGGERS (STUDENT BASE DATA)
-- Source: Trigger part1.txt
-- =============================================================================

-- Inserting into STUDENT automatically populates STUDENT_LOG if trg_student_insert is enabled
INSERT INTO STUDENT (student_id, name, age) VALUES (101, 'Arif Chowdhury', 22);
INSERT INTO STUDENT (student_id, name, age) VALUES (102, 'Rahim', 75);


-- =============================================================================
-- COMMIT TRANSACTION
-- =============================================================================
COMMIT;


-- =============================================================================
-- VERIFICATION QUERIES (Run to confirm seeded data)
-- =============================================================================
-- SELECT * FROM DEPARTMENTS;
-- SELECT * FROM EMPLOYEES;
-- SELECT * FROM EMPLOYEES1;
-- SELECT * FROM EMPLOYEE;
-- SELECT * FROM STUDENT;
-- SELECT * FROM STUDENT_LOG;
-- SELECT * FROM high_salary_emp;

-- =============================================================================
-- END OF SEED_data.sql
-- =============================================================================
