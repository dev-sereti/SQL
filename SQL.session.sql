-- Use database
USE personal_library;

-- Drop dependent tables in correct order
DROP TABLE IF EXISTS ReadingStatus;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

-- Create Authors table
CREATE TABLE Authors (
    AuthorId INT PRIMARY KEY AUTO_INCREMENT,
    AuthorFirstName VARCHAR(50),
    AuthorLastName VARCHAR(50),
    Country VARCHAR(50)
);

-- Create Books table
CREATE TABLE Books (
    BookNumber INT PRIMARY KEY AUTO_INCREMENT,
    BookTitle VARCHAR(100) NOT NULL,
    AuthorId INT,
    PublicationYear INT,
    IssueDate DATE,
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);

-- Create ReadingStatus table
CREATE TABLE ReadingStatus (
    StatusId INT PRIMARY KEY AUTO_INCREMENT,
    BookNumber INT,
    ReadingStatus VARCHAR(20) NOT NULL,
    FinishDate DATE,
    BookRating INT,
    Notes TEXT,
    FOREIGN KEY (BookNumber) REFERENCES Books(BookNumber)
);

-- Insert values into Authors table
INSERT INTO Authors (AuthorFirstName, AuthorLastName, Country)
VALUES 
('Hellen', 'White', 'USA'),
('Tyron', 'Harrison', 'USA'),
('Chinua', 'Achebe', 'Nigeria'),
('Jane', 'Austen', 'UK'),
('Charles', 'Dickens', 'UK'),
('F. Scott', 'Fitzgerald', 'USA'),
('Mario', 'Vargas', 'Peru');

