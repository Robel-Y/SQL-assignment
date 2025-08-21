-- Library Management System Database

-- Table for storing book information
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category_id INT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publish_year YEAR,
    copies INT DEFAULT 1,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Table for storing authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- Junction table for many-to-many relationship between Books and Authors
CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table for book categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Table for library members
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    membership_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Table to track book loans
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date DATE,
    CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
