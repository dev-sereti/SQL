-- Use database

USE personal_library;
DROP TABLE IF EXISTS Books;

-- Create Books table.

CREATE TABLE Books(
    BookNumber INT PRIMARY KEY AUTO_INCREMENT,
    BookTitle VARCHAR(50) NOT NULL,
    AuthorId INT,
    IssueDate DATE
);
-- Create Authors table.
DROP TABLE IF EXISTS Authors;

CREATE TABLE Authors(
    AuthorId INT PRIMARY KEY AUTO_INCREMENT,
    AuthorFirstName VARCHAR(10),
    AuthorLastName VARCHAR(10),
    Country VARCHAR(50)
);

-- Create reading status table
DROP TABLE IF EXISTS ReadingStatus;

CREATE TABLE ReadingStatus(
    StatusId INT PRIMARY KEY AUTO_INCREMENT;
    BookNumber INT,
    ReadingStatus VARCHAR(20) NOT NULL,
    FinishDate DATE,
    BookRating INT,
    Notes TEXT,
    FOREIGN KEY (BookNumber) REFERENCES Books(BookNumber)
);


