-- Library Management System Database

-- 1. Members table (general info about all members)
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255),
    MembershipDate DATE DEFAULT CURRENT_DATE
);

-- 2. Students table (extra info specific to students, one-to-one with Members)
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL UNIQUE, -- One-to-one relation with Members
    UniversityID VARCHAR(50) UNIQUE NOT NULL,
    Course VARCHAR(100),
    YearOfStudy INT CHECK (YearOfStudy BETWEEN 1 AND 6),
    CONSTRAINT fk_Students_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE
);

-- 3. Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Bio TEXT
);

-- 4. Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE NOT NULL,
    Description TEXT
);

-- 5. Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedYear YEAR,
    CategoryID INT NOT NULL,
    CopiesAvailable INT DEFAULT 1 CHECK (CopiesAvailable >= 0),
    CONSTRAINT fk_Books_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 6. BookAuthors table (many-to-many relation between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT fk_BookAuthors_Books FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    CONSTRAINT fk_BookAuthors_Authors FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- 7. Loans table (tracks books borrowed by members)
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LoanDate DATE DEFAULT CURRENT_DATE,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    CONSTRAINT fk_Loans_Books FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_Loans_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Sample Index for performance on Loans 
CREATE INDEX idx_Loans_MemberID ON Loans(MemberID);
CREATE INDEX idx_Loans_BookID ON Loans(BookID);

