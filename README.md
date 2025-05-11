# librarymanagementsystem.io
# Library Management System - Database Design

## Overview
This is a relational database design for a **Library Management System**. It handles the storage of information about books, authors, library members, and the loans of books to members.

## Tables and Relationships

### 1. **Authors**
Stores information about authors. One author can write multiple books.
- **author_id** (PK): Unique identifier for each author.
- **name**: Name of the author.
- **birth_date**: Birthdate of the author.
- **nationality**: Nationality of the author.

### 2. **Books**
Stores information about books in the library. One book is written by a single author (but authorship is handled with a many-to-many relationship).
- **book_id** (PK): Unique identifier for each book.
- **title**: Title of the book.
- **isbn**: Unique ISBN number for the book.
- **published_year**: Year the book was published.
- **genre**: Genre of the book.
- **stock**: Number of copies available in the library.
- **author_id** (FK): References the author who wrote the book.

### 3. **Members**
Stores information about the library members.
- **member_id** (PK): Unique identifier for each member.
- **first_name**: Member's first name.
- **last_name**: Member's last name.
- **email**: Unique email of the member.
- **phone_number**: Contact number of the member.
- **membership_date**: Date when the member joined.

### 4. **Loans**
Tracks the books checked out by members.
- **loan_id** (PK): Unique identifier for each loan.
- **book_id** (FK): References the book that is loaned.
- **member_id** (FK): References the member who borrowed the book.
- **loan_date**: Date when the book was borrowed.
- **due_date**: Date by which the book should be returned.
- **return_date**: Date when the book was actually returned.

### 5. **Book_Author**
Handles the many-to-many relationship between books and authors.
- **book_id** (FK): References a book.
- **author_id** (FK): References an author.

## SQL File
The `library_management.sql` file contains:
1. Table creation statements.
2. Sample data insertions.

## Usage
1. To use this database, simply execute the `library_management.sql` file in your MySQL environment.
2. The database will be created with all the tables and relationships set up.
3. You can then start querying the database for managing books, loans, and member details.

## Dependencies
- MySQL or MariaDB Database Server
- A MySQL Client (e.g., MySQL Workbench, phpMyAdmin)

## License
This project is open source and free to use. Feel free to adapt and modify it for your own purposes.
