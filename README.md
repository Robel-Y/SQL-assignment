# 📚 Library Management System Database

This project implements a relational database for a **Library Management System** using MySQL. It includes tables for members, students, books, authors, loans, and categories.

---

## 🗂️ Features

- Manage books, categories, and authors
- Track which members borrow which books
- Maintain student-specific information
- Support many-to-many relationships between books and authors
- Enforce referential integrity using foreign keys

---

## 🛠️ Technologies

- **MySQL**
- ERD created using a diagramming tool

---

## ⚙️ How to Run the Project

1. Clone the repository or download the `.sql` file.
2. Open MySQL Workbench or any SQL-compatible environment.
3. Create a new database:
   ```sql
   CREATE DATABASE librarydb;
   USE librarydb;
4.Import and run the contents of library management.sql to create all the tables.

📊 Entity Relationship Diagram (ERD)

This diagram shows the structure and relationships between the tables:

[(https://github.com/Robel-Y/SQL-assignment/blob/main/library%20mnagement%20ERD.png)]

✅ Make sure the image file is saved in the same directory as this README file.

📄 Tables in the SQL File

- Members
- Students
- Authors
- Books
- Categories
- BookAuthors (many-to-many relationship)
- Loans (borrowing system)

🧱 Database Design Includes

✅ Primary Keys

✅ Foreign Keys

✅ Unique Constraints

✅ Indexes for performance

✅ 1-to-1 (Members → Students)

✅ 1-to-Many (Categories → Books)

✅ Many-to-Many (Books ↔ Authors)
