-- CREATE TABLES
CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(20) NOT NULL,
    section CHAR(1) NOT NULL,
    room_number VARCHAR(10)
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    class_id INT,
    admission_date DATE,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE marks (
    mark_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    exam_type VARCHAR(30),
    marks INT CHECK (marks BETWEEN 0 AND 100),
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    attendance_date DATE,
    status VARCHAR(10) CHECK (status IN ('Present', 'Absent')),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

SELECT * FROM classes
SELECT * FROM teachers

SELECT current_database();
SELECT * FROM classes;
INSERT INTO classes
(class_name, section, room_number)
VALUES
('Class 8', 'A', 'R101'),
('Class 8', 'B', 'R102'),
('Class 9', 'A', 'R201'),
('Class 9', 'B', 'R202'),
('Class 10', 'A', 'R301'),
('Class 10', 'B', 'R302'),
('Class 11', 'A', 'R401'),
('Class 12', 'A', 'R501');

TRUNCATE TABLE classes RESTART IDENTITY CASCADE;
INSERT INTO classes
(class_name, section, room_number)
VALUES
('Class 8', 'A', 'R101'),
('Class 8', 'B', 'R102'),
('Class 9', 'A', 'R201'),
('Class 9', 'B', 'R202'),
('Class 10', 'A', 'R301'),
('Class 10', 'B', 'R302'),
('Class 11', 'A', 'R401'),
('Class 12', 'A', 'R501');

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'students'
ORDER BY ordinal_position;


SELECT *
FROM classes
ORDER BY class_id;

INSERT INTO students
    (student_id, student_name, gender, date_of_birth, class_id, admission_date)
VALUES
    (1,  'Aarav Sharma',    'Male',   '2011-05-14', 1, '2023-04-05'),
    (2,  'Ananya Verma',    'Female', '2011-08-22', 1, '2023-04-05'),

    (3,  'Rohan Gupta',     'Male',   '2010-11-10', 2, '2023-04-06'),
    (4,  'Priya Singh',     'Female', '2010-03-18', 2, '2023-04-06'),

    (5,  'Aditya Kumar',    'Male',   '2009-07-25', 3, '2022-04-04'),
    (6,  'Sneha Yadav',     'Female', '2009-12-02', 3, '2022-04-04'),

    (7,  'Arjun Mehta',     'Male',   '2009-02-16', 4, '2022-04-05'),
    (8,  'Ishita Sharma',   'Female', '2009-09-11', 4, '2022-04-05'),

    (9,  'Vivek Mishra',    'Male',   '2008-06-20', 5, '2021-04-06'),
    (10, 'Kavya Patel',     'Female', '2008-10-15', 5, '2021-04-06'),

    (11, 'Rahul Joshi',     'Male',   '2007-04-12', 6, '2021-04-06'),
    (12, 'Neha Agarwal',    'Female', '2007-11-28', 6, '2021-04-06'),

    (13, 'Karan Malhotra',   'Male',   '2006-08-19', 7, '2020-04-07'),
    (14, 'Simran Kaur',      'Female', '2006-01-30', 7, '2020-04-07'),

    (15, 'Mohit Saxena',     'Male',   '2005-05-17', 8, '2019-04-08'),
    (16, 'Riya Kapoor',      'Female', '2005-09-24', 8, '2019-04-08');

SELECT *
FROM students
ORDER BY student_id;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'teachers'
ORDER BY ordinal_position;

INSERT INTO teachers
    (teacher_id, teacher_name, email, department)
VALUES
    (1, 'Rajesh Kumar',   'rajesh.kumar@school.com',   'Mathematics'),
    (2, 'Priya Sharma',   'priya.sharma@school.com',   'Science'),
    (3, 'Amit Verma',     'amit.verma@school.com',     'English'),
    (4, 'Neha Singh',     'neha.singh@school.com',     'Hindi'),
    (5, 'Sanjay Gupta',   'sanjay.gupta@school.com',   'Social Science'),
    (6, 'Pooja Mehta',    'pooja.mehta@school.com',    'Computer Science'),
    (7, 'Vikas Yadav',    'vikas.yadav@school.com',    'Physical Education'),
    (8, 'Anjali Kapoor',  'anjali.kapoor@school.com',  'Arts');
SELECT *
FROM teachers
ORDER BY teacher_id;


SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'subjects'
ORDER BY ordinal_position;


INSERT INTO subjects
    (subject_id, subject_name, teacher_id)
VALUES
    (1, 'Mathematics',       1),
    (2, 'Science',           2),
    (3, 'English',           3),
    (4, 'Hindi',             4),
    (5, 'Social Science',    5),
    (6, 'Computer Science',  6),
    (7, 'Physical Education',7),
    (8, 'Arts',              8);

SELECT *
FROM subjects
ORDER BY subject_id;


SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'enrollments'
ORDER BY ordinal_position;

INSERT INTO enrollments
    (enrollment_id, student_id, subject_id, enrollment_date)
VALUES
    (1,  1, 1, '2024-04-10'),
    (2,  1, 2, '2024-04-10'),
    (3,  2, 1, '2024-04-10'),
    (4,  2, 2, '2024-04-10'),

    (5,  3, 3, '2024-04-10'),
    (6,  3, 4, '2024-04-10'),
    (7,  4, 3, '2024-04-10'),
    (8,  4, 4, '2024-04-10'),

    (9,  5, 1, '2024-04-10'),
    (10, 5, 3, '2024-04-10'),
    (11, 6, 1, '2024-04-10'),
    (12, 6, 3, '2024-04-10'),

    (13, 7, 2, '2024-04-10'),
    (14, 7, 5, '2024-04-10'),
    (15, 8, 2, '2024-04-10'),
    (16, 8, 5, '2024-04-10'),

    (17, 9, 1, '2024-04-10'),
    (18, 9, 5, '2024-04-10'),
    (19, 10, 1, '2024-04-10'),
    (20, 10, 5, '2024-04-10'),

    (21, 11, 6, '2024-04-10'),
    (22, 11, 2, '2024-04-10'),
    (23, 12, 6, '2024-04-10'),
    (24, 12, 2, '2024-04-10'),

    (25, 13, 6, '2024-04-10'),
    (26, 13, 7, '2024-04-10'),
    (27, 14, 6, '2024-04-10'),
    (28, 14, 7, '2024-04-10'),

    (29, 15, 8, '2024-04-10'),
    (30, 15, 6, '2024-04-10'),
    (31, 16, 8, '2024-04-10'),
    (32, 16, 6, '2024-04-10');


SELECT *
FROM enrollments
ORDER BY enrollment_id;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'marks'
ORDER BY ordinal_position;



INSERT INTO marks
    (mark_id, student_id, subject_id, exam_type, marks, exam_date)
VALUES
    (1,  1, 1, 'Mid Term',    82, '2024-09-15'),
    (2,  1, 2, 'Mid Term',    76, '2024-09-15'),
    (3,  2, 1, 'Mid Term',    91, '2024-09-15'),
    (4,  2, 2, 'Mid Term',    88, '2024-09-15'),

    (5,  3, 3, 'Mid Term',    79, '2024-09-16'),
    (6,  3, 4, 'Mid Term',    84, '2024-09-16'),
    (7,  4, 3, 'Mid Term',    92, '2024-09-16'),
    (8,  4, 4, 'Mid Term',    89, '2024-09-16'),

    (9,  5, 1, 'Mid Term',    74, '2024-09-17'),
    (10, 5, 3, 'Mid Term',    81, '2024-09-17'),
    (11, 6, 1, 'Mid Term',    87, '2024-09-17'),
    (12, 6, 3, 'Mid Term',    90, '2024-09-17'),

    (13, 7, 2, 'Mid Term',    68, '2024-09-18'),
    (14, 7, 5, 'Mid Term',    73, '2024-09-18'),
    (15, 8, 2, 'Mid Term',    85, '2024-09-18'),
    (16, 8, 5, 'Mid Term',    91, '2024-09-18'),

    (17, 9, 1, 'Final',       88, '2024-12-10'),
    (18, 9, 5, 'Final',       79, '2024-12-10'),
    (19, 10, 1, 'Final',      94, '2024-12-10'),
    (20, 10, 5, 'Final',      86, '2024-12-10'),

    (21, 11, 6, 'Final',      72, '2024-12-11'),
    (22, 11, 2, 'Final',      81, '2024-12-11'),
    (23, 12, 6, 'Final',      89, '2024-12-11'),
    (24, 12, 2, 'Final',      93, '2024-12-11'),

    (25, 13, 6, 'Final',      95, '2024-12-12'),
    (26, 13, 7, 'Final',      88, '2024-12-12'),
    (27, 14, 6, 'Final',      91, '2024-12-12'),
    (28, 14, 7, 'Final',      94, '2024-12-12'),

    (29, 15, 8, 'Final',      78, '2024-12-13'),
    (30, 15, 6, 'Final',      83, '2024-12-13'),
    (31, 16, 8, 'Final',      90, '2024-12-13'),
    (32, 16, 6, 'Final',      96, '2024-12-13');
SELECT *
FROM marks
ORDER BY mark_id;


SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'attendance'
ORDER BY ordinal_position;



INSERT INTO attendance
    (attendance_id, student_id, attendance_date, status)
VALUES
    (1,  1,  '2024-08-01', 'Present'),
    (2,  1,  '2024-08-02', 'Present'),

    (3,  2,  '2024-08-01', 'Present'),
    (4,  2,  '2024-08-02', 'Absent'),

    (5,  3,  '2024-08-01', 'Present'),
    (6,  3,  '2024-08-02', 'Present'),

    (7,  4,  '2024-08-01', 'Absent'),
    (8,  4,  '2024-08-02', 'Present'),

    (9,  5,  '2024-08-01', 'Present'),
    (10, 5,  '2024-08-02', 'Present'),

    (11, 6,  '2024-08-01', 'Present'),
    (12, 6,  '2024-08-02', 'Present'),

    (13, 7,  '2024-08-01', 'Absent'),
    (14, 7,  '2024-08-02', 'Present'),

    (15, 8,  '2024-08-01', 'Present'),
    (16, 8,  '2024-08-02', 'Present'),

    (17, 9,  '2024-08-01', 'Present'),
    (18, 9, '2024-08-02', 'Absent'),

    (19, 10, '2024-08-01', 'Present'),
    (20, 10, '2024-08-02', 'Present'),

    (21, 11, '2024-08-01', 'Absent'),
    (22, 11, '2024-08-02', 'Present'),

    (23, 12, '2024-08-01', 'Present'),
    (24, 12, '2024-08-02', 'Present'),

    (25, 13, '2024-08-01', 'Present'),
    (26, 13, '2024-08-02', 'Present'),

    (27, 14, '2024-08-01', 'Present'),
    (28, 14, '2024-08-02', 'Absent'),

    (29, 15, '2024-08-01', 'Present'),
    (30, 15, '2024-08-02', 'Present'),

    (31, 16, '2024-08-01', 'Absent'),
    (32, 16, '2024-08-02', 'Present');


	SELECT *
FROM attendance
ORDER BY attendance_id;






select * from students
select * from classes

🟢 Question 1 — Basic JOIN
                Task: Display the following details for every student:
                Student ID
                Student Name
                Class Name
                Section

 🟢 Answer 1  select st.student_id,st.student_name,cl.class_name,cl.section from Students st
            inner join classes cl
            on st.class_id = cl.class_id



🟢 Question 2 — JOIN + WHERE
    Let's level up a little.
    Task:
    Display only the students from Class 10.
    The output should contain these 4 columns:
    student_id
    student_name
    class_name
    section

🟢 Answer2 -  select st.student_id,st.student_name,cl.class_name,cl.section from Students st
               inner join classes cl
               on st.class_id = cl.class_id
               where cl.class_name = 'Class 10'

🟢 Question 3 — JOIN + WHERE + ORDER BY
    Let's practice a little more.
    Task:Display the students from Class 8 and arrange them in alphabetical order (A → Z) by student name.
    Output:
    student_id
    student_name
    class_name
    section

🟢  Answer3   select st.student_id,st.student_name,cl.class_name,cl.section from students st
     inner join classes cl
     on st.class_id = cl.class_id
     where cl.class_name = 'Class 8'
     order by student_name asc

🟡 Question 4 — JOIN + GROUP BY
    Now let's practice an important SQL concept: GROUP BY.
    Task:Find the number of students in each class.
    Output should contain only:
    class_name
    student_count
    Expected result:
    Class 8 → 4 students
    Class 9 → 4 students
    Class 10 → 4 students
    Class 11 → 2 students
    Class 12 → 2 students

🟢  Answer4  select cl.class_name, count(st.student_name) from students st
    inner join classes cl 
    on st.class_id = cl.class_id
    group by cl.class_name
    order by cl.class_name desc


🟡 Question 5 — GROUP BY + HAVING
    Task:Display only those classes that have 4 or more students.
    Output:
    class_name
    student_count
    Expected result:
    Class 8 → 4 students
    Class 9 → 4 students
    Class 10 → 4 students

🟢  Answer 5 select cl.class_name,count(st.student_name) from students st
     inner join classes cl
     on st.class_id = cl.class_id
     group by cl.class_name
     having count(st.student_name)>=4

🟠 Question 6 — 3-Table JOIN
    Task:Display each student's subject and marks.
    Output:
    student_name
    subject_name
    marks
    Tables involved:students → marks → subjects

🟢  Answer 6
    select * from students
    select * from  subjects
    select * from marks
    select st.student_name,sub.subject_name,m.marks from students st
    inner join marks m
    on st.student_id = m.student_id
    inner join subjects sub
    on m.subject_id = sub.subject_id
    order by student_name asc

🟠 Question 7 — Average Marks
    Task: Calculate the average marks for each student.
    Output:
    student_name
    average_marks
    Display the results in descending order, from the highest average to the lowest average.

🟢  Answer 7
    select sub.subject_name,avg(m.marks) from students st
    inner join marks m
    on st.student_id = m.student_id
    inner join subjects sub
    on m.subject_id = sub.subject_id
    group by (sub.subject_name)
    order by avg(m.marks) desc

🟠 Question 8 — Subject-wise Average Marks
   Task: Calculate the average marks for each subject.
   Output:
   subject_name
   average_marks

 
🟢 Answer 8 
   select sub.subject_name,avg(m.marks) from students st 
   inner join marks m on st.student_id = m.student_id inner join subjects sub 
   on m.subject_id = sub.subject_id 
   group by (sub.subject_name) 
   order by avg(m.marks) desc



🟠 Question 9 — Students Above Average
    Task: Find the students whose average marks are greater than 85.
    Output:
    student_name
    average_marks
    Display the results in descending order, from the highest average to the lowest average.

🟢 Answer 9 
    select st.student_name,avg(m.marks) from students st
    inner join marks m
    on st.student_id = m.student_id
    inner join subjects sub
    on m.subject_id = sub.subject_id
    group by (st.student_name)
    HAVING AVG(m.marks) > 85
    order by avg(m.marks) desc


🟠 Question 10 — Highest Marks
    Now let's practice another important use of aggregate functions.
    Task: Find the highest marks achieved in each subject.
    Output:
    subject_name
    highest_marks
    Display the results in descending order, from the highest marks to the lowest marks.

🟢 Answer 10
   select sub.subject_name,max(m.marks) from students st
   inner join marks m
   on st.student_id = m.student_id
   inner join subjects sub
   on m.subject_id = sub.subject_id
   group by (sub.subject_name)
   order by max(m.marks) desc














