create database joindb;
use joindb;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT,
    city VARCHAR(50)
);
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    fees INT
);
INSERT INTO student VALUES
(1, 'Rahul', 101, 'Delhi'),
(2, 'Priya', 102, 'Mumbai'),
(3, 'Aman', 103, 'Kashipur'),
(4, 'Neha', 104, 'Bareilly'),
(5, 'Rohit', 105, 'Haldwani'),
(6, 'Sneha', 101, 'Delhi'),
(7, 'Karan', 106, 'Lucknow');

INSERT INTO course VALUES
(101, 'BCA', 50000),
(102, 'MCA', 65000),
(103, 'B.Tech', 80000),
(104, 'BBA', 45000),
(105, 'MBA', 70000),
(107, 'B.Sc', 40000);

select * from student;
select * from course;

-- select student.student_id,student.student_name,course.course_id,course.fees from student 
-- inner join course on student.course_id = course.course_id;

SELECT 
    student.student_name,
    course.course_name
FROM student
FULL JOIN course
ON student.course_id = course.course_id;

SELECT 
    student.student_id,
    student.student_name,
    course.course_name
FROM student
RIGHT JOIN course
ON student.course_id = course.course_id;

SELECT 
    student.student_id,
    student.student_name,
    course.course_name
FROM student
LEFT JOIN course
ON student.course_id = course.course_id;