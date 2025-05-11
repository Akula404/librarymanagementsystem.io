-- Create the database
CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    published_year INT,
    genre VARCHAR(50),
    stock INT DEFAULT 0,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    membership_date DATE NOT NULL
);

-- Create Loans table (for tracking book loans)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Create Book_Author table for the many-to-many relationship between Books and Authors
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Sample Data Insertions (optional)
INSERT INTO Authors (name, birth_date, nationality) VALUES 
('J.K. Rowling', '1965-07-31', 'British'),
('George Orwell', '1903-06-25', 'British');

INSERT INTO Books (title, isbn, published_year, genre, stock, author_id) VALUES 
('Harry Potter and the Sorcerer\'s Stone', '9780747532699', 1997, 'Fantasy', 10, 1),
('1984', '9780451524935', 1949, 'Dystopian', 5, 2);

INSERT INTO Members (first_name, last_name, email, phone_number, membership_date) VALUES 
('John', 'Doe', 'johndoe@example.com', '123-456-7890', '2025-05-01'),
('Jane', 'Smith', 'janesmith@example.com', '987-654-3210', '2025-05-02');

-- Sample Loan Record
INSERT INTO Loans (book_id, member_id, loan_date, due_date) VALUES 
(1, 1, '2025-05-01', '2025-05-15');

