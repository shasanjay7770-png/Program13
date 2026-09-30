USE CollegeDB;

-- 3NF Normalized Tables

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Sample Data

INSERT INTO Student VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Faculty VALUES
(101, 'Dr. Ravi', 1),
(102, 'Dr. Meena', 2);

INSERT INTO Course VALUES
(201, 'Database Systems', 101),
(202, 'Data Structures', 101),
(203, 'Mathematics', 102);

INSERT INTO StudentCourse VALUES
(1001, 201),
(1001, 202),
(1002, 203),
(1003, 201);

-- Display Normalized Data Using JOIN

SELECT
    S.StudentID,
    S.StudentName,
    C.CourseName,
    F.FacultyName,
    D.DepartmentName
FROM Student S
JOIN StudentCourse SC ON S.StudentID = SC.StudentID
JOIN Course C ON SC.CourseID = C.CourseID
JOIN Faculty F ON C.FacultyID = F.FacultyID
JOIN Department D ON F.DepartmentID = D.DepartmentID;
