-- Use database

USE personal_library;

-- Create Authors table.
DROP TABLE IF EXISTS Authors;
CREATE TABLE Authors(
    AuthorId INT PRIMARY KEY AUTO_INCREMENT,
    AuthorFirstName VARCHAR(10),
    AuthorLastName VARCHAR(10),
    Country VARCHAR(50)
);

-- Create Books table.
DROP TABLE IF EXISTS Books;

CREATE TABLE Books(
    BookNumber INT PRIMARY KEY AUTO_INCREMENT,
    BookTitle VARCHAR(50) NOT NULL,
    AuthorId INT,
    PublicationYear INT,
    IssueDate DATE
);

-- Create reading status table
DROP TABLE IF EXISTS ReadingStatus;

CREATE TABLE ReadingStatus(
    StatusId INT PRIMARY KEY AUTO_INCREMENT,
    BookNumber INT,
    ReadingStatus VARCHAR(20) NOT NULL,
    FinishDate DATE,
    BookRating INT,
    Notes TEXT,
    FOREIGN KEY (BookNumber) REFERENCES Books(BookNumber)
);


-- Insert values to Authours Table.
INSERT INTO Authors (AuthorId,AuthorFirstName,AuthorLastName,Country)
VALUES 
('Hellen','White', 'USA'),
('Tyron', 'Harrison','USA'),
('Chinua','Achebe','Nigeria'),
('Jane','Austen ','UK'),
('Charles ','Dickens ','UK'),
('F. Scott', 'Fitzgerald ','USA'),
('Mario ','Vargas ','Peru');

