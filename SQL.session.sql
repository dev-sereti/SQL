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

INSERT INTO Books(BookNumber,BookTitle,AuthorId,PublicationYear,BuyDate)
VALUES
('Things Fall Apart',3,'17 June 1958.','12-06-2015'),
('Pride and Prejudice',4,'28-01-1813','10-09-2020'),
('Sense and Sensibility',4,'30-10-1811','03-11-2020'),
(' Great Expectations',5,'1-12-1860','12-05-2022'),
('A Tale of Two Cities',5,''),
('The Great Gatsby',6,),
('The Time of the Hero, Death in the Andes',7,)


