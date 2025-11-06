-- Use database
USE personal_library;

-- Drop tables if exist.
DROP TABLE IF EXISTS reading_status;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS purchases;


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

-- Create purchases table
CREATE TABLE purchases(
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,purchase_date DATE,
    price DECIMAL(10,2),
    store VARCHAR(100),
    format VARCHAR(20),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
    );

-- Insert individual authors
INSERT INTO authors (first_name, last_name, birth_year, country)
VALUES 
('George', 'Orwell', 1903, 'United Kingdom'),
('Jane', 'Austen', 1775, 'United Kingdom'),
('Gabriel', 'García Márquez', 1927, 'Colombia'),
('Haruki', 'Murakami', 1949, 'Japan'),
('Chimamanda', 'Ngozi Adichie', 1977, 'Nigeria'),
('Leo', 'Tolstoy', 1828, 'Russia');

-- Insert books
INSERT INTO books (title, author_id, publication_year, genre, pages, isbn)
VALUES 
    ('1984', 1, 1949, 'Dystopian Fiction', 328, '9780451524935'),
    ('Animal Farm', 1, 1945, 'Political Satire', 112, '9780451526342'),
    ('Pride and Prejudice', 2, 1813, 'Romance', 432, '9780141439518'),
    ('One Hundred Years of Solitude', 3, 1967, 'Magical Realism', 417, '9780060883287'),
    ('Norwegian Wood', 4, 1987, 'Fiction', 296, '9780375704024'),
    ('Americanah', 5, 2013, 'Fiction', 477, '9780307455925');

-- Add purchase data
INSERT INTO purchases (book_id, purchase_date, price, store, format)
VALUES 
    (1, '2024-01-01', 14.99, 'Amazon', 'Paperback'),
    (3, '2024-01-28', 12.50, 'Local Bookstore', 'Hardcover'),
    (5, '2024-02-25', 9.99, 'Amazon', 'Kindle');

-- Insert reading status for books
INSERT INTO reading_status (book_id, status, start_date, finish_date, rating, notes)
VALUES 
    (1, 'Completed', '2024-01-05', '2024-01-20', 9, 'Thought-provoking and still relevant today'),
    (2, 'Completed', '2024-01-22', '2024-01-25', 8, 'Clever allegory'),
    (3, 'Currently Reading', '2024-02-01', NULL, NULL, 'Enjoying the wit and social commentary'),
    (4, 'To Read', NULL, NULL, NULL, 'Highly recommended by friends');

-- Retrieve only names from authors

SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM reading_status;

-- Find books published after 1950

SELECT title ,publication_year
FROM books
WHERE publication_year > 1950;

-- Find fiction books with more than 400 pages

SELECT title,genre,pages
FROM books
WHERE genre = 'FICTION' AND pages > 400;

-- Get all books sorted by publication year (newest first)

SELECT title,publication_year
FROM books
ORDER BY publication_year DESC;

-- List all authors from Japan
SELECT * FROM authors
WHERE country='Japan';

-- Get books with their author names

SELECT books.title, authors.first_name,authors.last_name,books.publication_year
FROM books 
JOIN authors ON books.author_id = authors.author_id;

-- Get completed books with author info and ratings

SELECT 
books.title,
authors.first_name,
authors.last_name,
reading_status.rating,
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN reading_status ON books.book_id = reading_status.book_id
WHERE reading_status ='Completed'
ORDER BY reading_status DESC;

--  Aggregate Functions.
-- Count 

SELECT COUNT * AS total_books FROM books;

-- AVG
-- Get average number of pages
SELECT AVG(pages) AS average_pages FROM books;

-- Find the earliest and latest publication years.
SELECT
MIN (publication_year AS earliest),
MAX (publication_year AS latest),
FROM books;

-- Count books by each author
SELECT 
    authors.first_name,
    authors.last_name,
    COUNT(books.book_id) AS book_count
FROM authors
LEFT JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_id, authors.first_name, authors.last_name
ORDER BY book_count DESC;

-- Find your average rating for completed books.
SELECT AVG(rating) AS average_ratings
FROM reading_status 
WHERE status = 'Completed';

-- Update data Add
