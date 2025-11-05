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
    BookRating INT CHECK (BookRating BETWEEN 0 AND 10),
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

INSERT INTO Books (BookTitle, AuthorId, PublicationYear, BuyDate)
VALUES
('Things Fall Apart', 3, 1958, STR_TO_DATE('12-06-2015', '%d-%m-%Y')),
('Pride and Prejudice', 4, 1813, STR_TO_DATE('10-09-2020', '%d-%m-%Y')),
('Sense and Sensibility', 4, 1811, STR_TO_DATE('03-11-2020', '%d-%m-%Y')),
('Great Expectations', 5, 1860, STR_TO_DATE('12-05-2022', '%d-%m-%Y')),
('A Tale of Two Cities', 5, 1859, STR_TO_DATE('17-03-2023', '%d-%m-%Y')),
('The Great Gatsby', 6, 1925, STR_TO_DATE('24-08-2019', '%d-%m-%Y')),
('The Time of the Hero', 7, 1996, STR_TO_DATE('12-09-2024', '%d-%m-%Y'));


-- Insert values into ReadingStatus table

INSERT INTO ReadingStatus(BookNumber,ReadingStatus,FinishDate,BookRating,Notes)
VALUES
(1,'Completed',STR_TO_DATE('11-05-2024','%d-%m-%Y'),9,'Great'),
(4,'Completed',STR_TO_DATE('27-12-2020','%d-%m-%Y'),8,'Ok');



--  