USE personal_library;

CREATE TABLE Books(
    BookNumber INT PRIMARY KEY AUTO_INCREEMENT,
    BookTitle VARCHAR(50) NOT NULL,
    AuthorFirstName VARCHAR(10),
    AuthorLastName VARCHAR(10),
    IssueDate DATE

);