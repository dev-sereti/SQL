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
    BuyDate DATE,
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

-- Insert values into Books table

INSERT INTO Books(BookTitle,AuthorId,PublicationYear,BuyDate)
VALUES
('Things Fall Apart',3,1958,'2015-12-06'),
('Pride and Prejudice',4,1813,'2020-10-09'),
('Sense and Sensibility',4,1811,'2020-03-11'),
('Great Expectations',5,1860,'2022-12-05'),
('A Tale of Two Cities',5,1859,'2023-17-03'),
('The Great Gatsby',6,1925,'2019-24-08'),
('The Time of the Hero',7,1996,'2024-12-09');

-- Insert values into ReadingStatus table