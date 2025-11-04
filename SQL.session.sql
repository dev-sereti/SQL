USE personal_library;

CREATE TABLE Books(
    BookNumber INT PRIMARY KEY AUTO_INCREMENT,
    BookTitle VARCHAR(50) NOT NULL,
    AuthorId INT,
    IssueDate DATE
);
-- Create Authors table.

CREATE TABLE Authors(
    AuthorId INT PRIMARY KEY AUTO_INCREMENT,
    AuthorFirstName VARCHAR(10),
    AuthorLastName VARCHAR(10),
    Country VARCHAR(50)
)

