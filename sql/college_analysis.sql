-- Create Database
CREATE DATABASE college;
USE college;

-- Create Tables
CREATE TABLE students (
  StudentID INT,
  Name VARCHAR(50),
  Department VARCHAR(20),
  Year INT,
  Gender VARCHAR(10)
);

CREATE TABLE attendance (
  StudentID INT,
  Date DATE,
  Subject VARCHAR(30),
  Present INT
);

CREATE TABLE marks (
  StudentID INT,
  Subject VARCHAR(30),
  Marks INT
);

-- View Data
SELECT * FROM students LIMIT 10;
SELECT * FROM attendance LIMIT 10;
SELECT * FROM marks LIMIT 10;

-- Attendance Percentage
SELECT 
    StudentID,
    ROUND(SUM(Present) * 100.0 / COUNT(*), 2) AS Attendance_Percentage
FROM attendance
GROUP BY StudentID
ORDER BY StudentID;

-- Average Marks
SELECT 
    StudentID,
    ROUND(AVG(Marks), 2) AS Average_Marks
FROM marks
GROUP BY StudentID
ORDER BY StudentID;

-- HIGH-RISK STUDENTS
SELECT 
    a.StudentID,
    ROUND(SUM(a.Present) * 100.0 / COUNT(*), 2) AS Attendance_Percentage,
    ROUND(AVG(m.Marks), 2) AS Average_Marks
FROM attendance a
JOIN marks m 
    ON a.StudentID = m.StudentID
GROUP BY a.StudentID
HAVING Attendance_Percentage < 75 OR Average_Marks < 50;

