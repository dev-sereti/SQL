DROP TABLE IF EXISTS students;

CREATE TABLE students (
    StudentId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(6),
    Age INT,
    EnrollmentDate DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO students (FirstName, LastName, Gender, Age, EnrollmentDate)
VALUES ('John', 'Doe', 'Male', 20, '2025-01-15'),
       ('Jane', 'Smith', 'Female', 22, '2025-02-03'),
       ('Kelvin' , 'Sereti', 'Male', 23, '2002-08-30');

