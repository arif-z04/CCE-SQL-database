# Murad Sir (MRD) Database Curriculum — Classroom Study Notes

This directory (`MRD_part_note/`) contains structured, production-grade study notes synthesized directly from the classroom lecture materials, SQL*Plus execution logs, Bangla explanations, and schemas in `MRD_part/`.

---

## Topic & File Mapping

| Study Note File | Core Classroom Topics Covered | Source Files in `MRD_part/` |
| :--- | :--- | :--- |
| [`01_Implicit_Cursors.txt`](file:///home/noir/Work/Database/MRD_part_note/01_Implicit_Cursors.txt) | PL/SQL introduction, `SET SERVEROUTPUT ON`, `Employees` table setup, 10% IT salary update, `SQL%FOUND`, `SQL%NOTFOUND`, `SQL%ROWCOUNT`, Windows UTF-8 encoding (`chcp 65001`, `NLS_LANG`). | `Implicit Cursor-Explicit Cursor 10-8-26.txt`, `Implicit_Cursor_Explicit_Cursor_এর_উদাহরণ_10_8_26.txt`, `Implicit Cursor-এর উদাহরণ 6-8-26.txt` |
| [`02_Explicit_Cursors.txt`](file:///home/noir/Work/Database/MRD_part_note/02_Explicit_Cursors.txt) | Multi-row queries, 4-step manual lifecycle (`DECLARE`, `OPEN`, `FETCH`, `CLOSE`), `%TYPE` variables, modern Cursor FOR Loop (`FOR rec IN cursor LOOP`). | `Implicit Cursor-Explicit Cursor 10-8-26.txt`, `Implicit_Cursor_Explicit_Cursor_এর_উদাহরণ_6_8_26.txt` |
| [`03_Database_Triggers_Overview.txt`](file:///home/noir/Work/Database/MRD_part_note/03_Database_Triggers_Overview.txt) | Trigger definition, events (INSERT, UPDATE, DELETE), timing (BEFORE, AFTER), `FOR EACH ROW`, `:NEW` vs `:OLD` pseudo-records matrix, audit workflows. | `Trigger part1.txt`, `Trigger part2.txt`, `Trigger part3.txt`, `Trigger part4.txt` |
| [`04_BEFORE_and_AFTER_Triggers.txt`](file:///home/noir/Work/Database/MRD_part_note/04_BEFORE_and_AFTER_Triggers.txt) | In-depth comparison: In-flight validation & correction (`BEFORE INSERT`, `BEFORE UPDATE`, `BEFORE DELETE`) vs historical audit logging (`AFTER UPDATE` into `salary_log`). | `Trigger part4.txt`, `2. AFTER Trigger.txt`, `Trigger part2.txt`, `Trigger part3.txt` |
| [`05_INSERT_Triggers.txt`](file:///home/noir/Work/Database/MRD_part_note/05_INSERT_Triggers.txt) | INSERT triggers exclusively: Console notifications (`DBMS_OUTPUT`), student audit logging (`student` -> `student_log`), minimum salary floor policy. | `4. INSERT Trigger.txt`, `Trigger part1.txt`, `Trigger part4.txt` |
| [`06_Analytical_and_Window_Functions.txt`](file:///home/noir/Work/Database/MRD_part_note/06_Analytical_and_Window_Functions.txt) | Oracle 23ai lab session: `Employees1` table, `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` with `PARTITION BY Department`, `LAG()`, real SQL*Plus error debugging (`ORA-00955`, `ORA-00904`). | `Analytical-Window Functions.txt` |
| [`07_Advanced_SQL_Concepts.txt`](file:///home/noir/Work/Database/MRD_part_note/07_Advanced_SQL_Concepts.txt) | `DEPARTMENTS` & `EMPLOYEES` hierarchy, scalar subqueries in `WHERE`, Joins (`INNER`, `LEFT OUTER`, `Self-Join`), Set operator (`UNION`), `GROUP BY`, Database Views (`CREATE VIEW`). | `Advance SQL Concepts.txt` |

---

## Schemas Used in Notes

1. **`Employees` / `Employees1` (5 Employees)**:
   - `ID`, `NAME`, `DEPARTMENT`, `SALARY`
   - Used for: Cursors and Analytical/Window Functions.

2. **`student` & `student_log`**:
   - `student (student_id, name, age)`
   - `student_log (student_id, name, log_date)`
   - Used for: Part 1 Simple Triggers.

3. **`employee` & `salary_log`**:
   - `employee (emp_id, name, salary)`
   - `salary_log (emp_id, old_salary, new_salary, change_date)`
   - Used for: Trigger Parts 2, 3, 4, AFTER Triggers, INSERT Triggers.

4. **`DEPARTMENTS` & `EMPLOYEES` (Managerial Hierarchy)**:
   - `DEPARTMENTS (dept_id, dept_name)`
   - `EMPLOYEES (emp_id, emp_name, salary, dept_id, manager_id)`
   - Used for: Advanced SQL Concepts (Subqueries, Joins, Self-Join, Views, UNION).
