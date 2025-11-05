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


-- Insert individual authors
INSERT INTO authors (first_name, last_name, birth_year, country)
VALUES 
('George', 'Orwell', 1903, 'United Kingdom');
('Jane', 'Austen', 1775, 'United Kingdom');
('Gabriel', 'García Márquez', 1927, 'Colombia');
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


-- Insert reading status for books
INSERT INTO reading_status (book_id, status, start_date, finish_date, rating, notes)
VALUES 
    (1, 'Completed', '2024-01-05', '2024-01-20', 9, 'Thought-provoking and still relevant today'),
    (2, 'Completed', '2024-01-22', '2024-01-25', 8, 'Clever allegory'),
    (3, 'Currently Reading', '2024-02-01', NULL, NULL, 'Enjoying the wit and social commentary'),
    (4, 'To Read', NULL, NULL, NULL, 'Highly recommended by friends');

--  