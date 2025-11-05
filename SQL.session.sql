-- Use database
USE personal_library;

-- Drop dependent tables in correct order

--DROP TABLE IF EXISTS ReadingStatus;
--DROP TABLE IF EXISTS Books;
--DROP TABLE IF EXISTS authors;

-- Create the authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INT,
    country VARCHAR(50)
);

-- Create the books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    pages INT,
    isbn VARCHAR(13),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create the reading_status table
CREATE TABLE reading_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    status VARCHAR(20) NOT NULL,
    start_date DATE,
    finish_date DATE,
    rating INT,
    notes TEXT,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
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
(4,'Completed',STR_TO_DATE('27-12-2020','%d-%m-%Y'),8,'Ok'),
(2,'Completed',STR_TO_DATE('07-12-2021','%d-%m-%Y'),5,'Ok');



--  