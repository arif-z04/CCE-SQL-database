-- =============================================================================
-- DDL for Oracle Part Class Works
-- Directory: Oracle_part_Class_works/
-- Database:  Oracle Database (compatible with Oracle 11g, 19c, 21c, 23ai / XE)
-- Author:    Murad Sir (MRD) Database Curriculum Synthesis
-- =============================================================================
-- Analyzed Source Materials:
--   1. Advance SQL Concepts.txt
--   2. Analytical-Window Functions.txt
--   3. Implicit Cursor-Explicit Cursor 10-8-26.txt
--   4. Implicit_Cursor_Explicit_Cursor_এর_উদাহরণ_10_8_26.txt
--   5. Implicit_Cursor_Explicit_Cursor_এর_উদাহরণ_6_8_26.txt
--   6. Implicit Cursor-এর উদাহরণ 6-8-26.txt
--   7. 2. AFTER Trigger.txt
--   8. 4. INSERT Trigger.txt
--   9. Trigger part1.txt
--  10. Trigger part2.txt
--  11. Trigger part3.txt
--  12. Trigger part4.txt
-- =============================================================================
-- Schemas Defined:
--   Module 1: Advanced SQL Concepts (Managerial Hierarchy & Joins)
--             - DEPARTMENTS
--             - EMPLOYEES
--             - View: high_salary_emp
--   Module 2: Analytical & Window Functions / PL/SQL Cursors
--             - EMPLOYEES1 (also aliases/mirrors EMPLOYEES for windowing & cursors)
--   Module 3: Database Triggers (Employee Lifecycle & Salary Audit)
--             - EMPLOYEE
--             - SALARY_LOG
--   Module 4: Database Triggers (Student Registration Audit)
--             - STUDENT
--             - STUDENT_LOG
-- =============================================================================

-- =============================================================================
-- 0. CLEANUP EXISTING OBJECTS (Safe Drop)
-- =============================================================================
BEGIN
    FOR t IN (
        SELECT table_name FROM user_tables 
        WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS', 'EMPLOYEES1', 'EMPLOYEE', 'SALARY_LOG', 'STUDENT', 'STUDENT_LOG')
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
    END LOOP;
END;
/

BEGIN
    FOR v IN (
        SELECT view_name FROM user_views 
        WHERE view_name IN ('HIGH_SALARY_EMP')
    ) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW ' || v.view_name;
    END LOOP;
END;
/


-- =============================================================================
-- MODULE 1: ADVANCED SQL CONCEPTS (DEPARTMENTS & HIERARCHICAL EMPLOYEES)
-- Source: Advance SQL Concepts.txt
-- Purpose: Subqueries, Inner/Left Joins, Self-Joins, Group By, Views, Union
-- =============================================================================

CREATE TABLE DEPARTMENTS (
    dept_id   NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE EMPLOYEES (
    emp_id     NUMBER PRIMARY KEY,
    emp_name   VARCHAR2(50) NOT NULL,
    salary     NUMBER(10, 2),
    dept_id    NUMBER,
    manager_id NUMBER,
    CONSTRAINT fk_department FOREIGN KEY (dept_id) REFERENCES DEPARTMENTS(dept_id) ON DELETE SET NULL,
    CONSTRAINT fk_manager    FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(emp_id) ON DELETE SET NULL
);

-- Classroom View: High Salary Employees (> 50,000)
CREATE OR REPLACE VIEW high_salary_emp AS
SELECT emp_id, emp_name, salary
FROM EMPLOYEES
WHERE salary > 50000;


-- =============================================================================
-- MODULE 2: ANALYTICAL & WINDOW FUNCTIONS / PL/SQL CURSORS
-- Source: Analytical-Window Functions.txt, Implicit/Explicit Cursor files
-- Purpose: ROW_NUMBER(), RANK(), DENSE_RANK() PARTITION BY, LAG(),
--          Implicit Cursors (SQL%FOUND, SQL%ROWCOUNT), Explicit Cursors (%TYPE, FOR loop)
-- Note: Named EMPLOYEES1 to prevent name collision with EMPLOYEES in Oracle schema.
-- =============================================================================

CREATE TABLE EMPLOYEES1 (
    ID         NUMBER(5) PRIMARY KEY,
    NAME       VARCHAR2(50) NOT NULL,
    DEPARTMENT VARCHAR2(30),
    SALARY     NUMBER(10, 2)
);


-- =============================================================================
-- MODULE 3: DATABASE TRIGGERS (EMPLOYEE & SALARY AUDIT)
-- Source: Trigger part2.txt, Trigger part3.txt, Trigger part4.txt,
--         2. AFTER Trigger.txt, 4. INSERT Trigger.txt
-- Purpose: BEFORE INSERT, BEFORE UPDATE, BEFORE DELETE, AFTER UPDATE, AFTER INSERT
-- =============================================================================

CREATE TABLE EMPLOYEE (
    emp_id NUMBER PRIMARY KEY,
    name   VARCHAR2(50) NOT NULL,
    salary NUMBER(10, 2)
);

CREATE TABLE SALARY_LOG (
    emp_id      NUMBER,
    old_salary  NUMBER(10, 2),
    new_salary  NUMBER(10, 2),
    change_date DATE DEFAULT SYSDATE
);


-- =============================================================================
-- MODULE 4: DATABASE TRIGGERS (STUDENT & REGISTRATION AUDIT)
-- Source: Trigger part1.txt
-- Purpose: Simple AFTER INSERT audit logging
-- =============================================================================

CREATE TABLE STUDENT (
    student_id NUMBER PRIMARY KEY,
    name       VARCHAR2(50) NOT NULL,
    age        NUMBER
);

CREATE TABLE STUDENT_LOG (
    student_id NUMBER,
    name       VARCHAR2(50),
    log_date   DATE DEFAULT SYSDATE
);


-- =============================================================================
-- CLASSROOM PL/SQL TRIGGERS IMPLEMENTATION
-- (Uncomment and execute in SQL*Plus / Oracle SQL Developer as needed)
-- =============================================================================

-- 1. Student Registration Audit Trigger (Trigger part1.txt)
CREATE OR REPLACE TRIGGER trg_student_insert
AFTER INSERT ON STUDENT
FOR EACH ROW
BEGIN
    INSERT INTO STUDENT_LOG (student_id, name, log_date)
    VALUES (:NEW.student_id, :NEW.name, SYSDATE);
END;
/

-- 2. Enforce Minimum Salary Policy (Trigger part4.txt)
-- If salary < 20000 on INSERT, set to 20000 automatically
CREATE OR REPLACE TRIGGER trg_before_employee
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.salary < 20000 THEN
        :NEW.salary := 20000;
    END IF;
END;
/

-- 3. Prevent Negative Salary Updates (Trigger part4.txt)
-- If salary < 0 on UPDATE, reset to 0
CREATE OR REPLACE TRIGGER trg_before_salary_update
BEFORE UPDATE OF salary ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.salary < 0 THEN
        :NEW.salary := 0;
    END IF;
END;
/

-- 4. Pre-Deletion Console Notification (Trigger part4.txt)
CREATE OR REPLACE TRIGGER trg_before_delete
BEFORE DELETE ON EMPLOYEE
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee ' || :OLD.name || ' will be deleted.');
END;
/

-- 5. Salary Change Audit Logging (Trigger part2.txt, 2. AFTER Trigger.txt)
CREATE OR REPLACE TRIGGER trg_after_update
AFTER UPDATE OF salary ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO SALARY_LOG (emp_id, old_salary, new_salary, change_date)
    VALUES (:OLD.emp_id, :OLD.salary, :NEW.salary, SYSDATE);
END;
/

-- 6. Pre-Deletion Audit Record (Trigger part3.txt)
CREATE OR REPLACE TRIGGER trg_employee_delete
BEFORE DELETE ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO SALARY_LOG (emp_id, old_salary, new_salary, change_date)
    VALUES (:OLD.emp_id, :OLD.salary, NULL, SYSDATE);
END;
/

-- =============================================================================
-- END OF DDL.sql
-- =============================================================================
