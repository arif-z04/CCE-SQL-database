# Problem Set 1 — Solutions

This folder contains the SQL solutions for **Problem Set 1.docx**, split
into one file per question.

## Layout

| Files | Purpose |
| --- | --- |
| `1.sql` … `57.sql` | One query per file, numbered exactly like the exercises in the document. |

> Note: the docx has two lists — seven open-ended tasks (top of the
> document) followed by 57 numbered exercises. The 57 files here match
> the **numbered exercise list** (the one starting with
> *"Find out the ID and salary of the instructors"*).

## How to run

The queries are written for **SQLite** (compatible with the browser lab at
<https://www.db-book.com/db7/university-lab-dir/sqljs.html>).

```bash
# run a single question
sqlite3 large-university.db < 7.sql

# run all 57 questions at once
for f in $(seq 1 57); do echo "==== ${f}.sql ===="; sqlite3 large-university.db < ${f}.sql; done
```

## Schema reminder

```
department(dept_name, building, budget)
instructor(ID, name, dept_name, salary)
student(ID, name, dept_name, tot_cred)
course(course_id, title, dept_name, credits)
takes(ID, course_id, sec_id, semester, year, grade)
teaches(ID, course_id, sec_id, semester, year)
section(course_id, sec_id, semester, year, building, room_number)
classroom(building, room_number, capacity)
time_slot(time_slot_id, day, start_hr, start_min, end_hr, end_min)
prereq(course_id, prereq_id)
advisor(s_ID, i_ID)
```