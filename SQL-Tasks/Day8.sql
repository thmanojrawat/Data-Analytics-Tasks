-- DAY 8
CREATE DATABASE data_analytics;
USE data_analytics;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(40)
);

CREATE TABLE academic (
    academic_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course VARCHAR(40),
    semester INT,
    percentage DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    total_fee DECIMAL(10,2),
    paid_fee DECIMAL(10,2),
    due_fee DECIMAL(10,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE library (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_name VARCHAR(100),
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students VALUES
(1,'Aman',21,'Male','Bareilly'),
(2,'Riya',22,'Female','Lucknow'),
(3,'Karan',20,'Male','Delhi'),
(4,'Neha',21,'Female','Haldwani'),
(5,'Vikas',23,'Male','Dehradun');

INSERT INTO academic (student_id,course,semester,percentage) VALUES
(1,'MCA',1,78.50),(2,'MCA',1,84.20),(3,'BCA',6,72.80),
(4,'MCA',1,81.40),(5,'BCA',6,69.50);

INSERT INTO fees (student_id,total_fee,paid_fee,due_fee) VALUES
(1,65000,50000,15000),(2,65000,65000,0),(3,55000,40000,15000),
(4,65000,45000,20000),(5,55000,55000,0);

INSERT INTO library (student_id,book_name,issue_date,return_date) VALUES
(1,'DBMS Fundamentals','2026-09-01','2026-09-10'),
(2,'Python Basics','2026-09-02','2026-09-12'),
(3,'Data Structures','2026-09-03',NULL),
(4,'SQL Complete Guide','2026-09-04','2026-09-14'),
(5,'Computer Networks','2026-09-05',NULL);

SELECT * FROM students;
SELECT * FROM academic;
SELECT * FROM fees;
SELECT * FROM library;

INSERT INTO students VALUES (6,'Sneha',22,'Female','Nainital');
