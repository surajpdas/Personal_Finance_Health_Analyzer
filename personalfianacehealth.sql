
Show databases;

CREATE DATABASE Personal_Finance_Health;
USE Personal_Finance_Health;

use personal_finance_health;

CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Role ENUM('Admin', 'User') NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Income (
    Income_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Source VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Expenses (
    Expense_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Category VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Savings (
    Saving_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Account_type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);


CREATE TABLE Investments (
    Investment_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Return_rate DECIMAL(5,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Debts (
    Debt_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Interest_rate DECIMAL(5,2) NOT NULL,
    Due_date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE FinancialHealth (
    Health_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Score INT NOT NULL CHECK (Score BETWEEN 0 AND 100),
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

INSERT INTO Users (Username, Role, Password) VALUES
('Alice', 'Admin', 'password123'),
('Bob', 'User', 'securepass'),
('Charlie', 'User', 'charliepass'),
('David', 'User', 'davidpass'),
('Emma', 'User', 'emmapass'),
('Frank', 'User', 'frankpass'),
('Grace', 'User', 'gracepass'),
('Hannah', 'User', 'hannahpass'),
('Isaac', 'User', 'isaacpass'),
('Jack', 'User', 'jackpass');


INSERT INTO Income (User_ID, Source, Amount, Date) VALUES
(2, 'Salary', 5000, '2025-01-01'),
(3, 'Freelance', 2000, '2025-01-10'),
(4, 'Business', 8000, '2025-01-15'),
(5, 'Salary', 6000, '2025-01-20'),
(6, 'Freelance', 3000, '2025-01-25'),
(7, 'Business', 9000, '2025-01-28'),
(8, 'Salary', 5500, '2025-02-01'),
(9, 'Freelance', 2500, '2025-02-05'),
(10, 'Business', 7000, '2025-02-10'),
(3, 'Salary', 4800, '2025-02-15');

INSERT INTO Expenses (User_ID, Category, Amount, Date) VALUES
(2, 'Rent', 1200, '2025-01-05'),
(3, 'Groceries', 500, '2025-01-08'),
(4, 'Transport', 300, '2025-01-12'),
(5, 'Shopping', 800, '2025-01-18'),
(6, 'Healthcare', 400, '2025-01-22'),
(7, 'Entertainment', 600, '2025-01-26'),
(8, 'Rent', 1300, '2025-02-02'),
(9, 'Groceries', 550, '2025-02-06'),
(10, 'Transport', 350, '2025-02-11'),
(3, 'Shopping', 900, '2025-02-16');

INSERT INTO Savings (User_ID, Account_type, Amount, Date) VALUES
(2, 'Bank Savings', 5000, '2025-01-07'),
(3, 'Fixed Deposit', 7000, '2025-01-14'),
(4, 'Bank Savings', 6000, '2025-01-20'),
(5, 'Mutual Funds', 8000, '2025-01-25'),
(6, 'Bank Savings', 7500, '2025-01-30'),
(7, 'Fixed Deposit', 9000, '2025-02-03'),
(8, 'Mutual Funds', 8500, '2025-02-07'),
(9, 'Bank Savings', 7000, '2025-02-10'),
(10, 'Fixed Deposit', 9500, '2025-02-15'),
(3, 'Mutual Funds', 8800, '2025-02-18');

INSERT INTO Investments (User_ID, Type, Amount, Return_rate, Date) VALUES
(2, 'Stocks', 5000, 8.5, '2025-01-09'),
(3, 'Bonds', 3000, 6.2, '2025-01-16'),
(4, 'Real Estate', 10000, 10.0, '2025-01-22'),
(5, 'Mutual Funds', 7000, 7.5, '2025-01-27'),
(6, 'Stocks', 6000, 9.0, '2025-02-01'),
(7, 'Bonds', 4000, 5.8, '2025-02-04'),
(8, 'Real Estate', 12000, 11.2, '2025-02-08'),
(9, 'Mutual Funds', 7500, 7.0, '2025-02-12'),
(10, 'Stocks', 5500, 8.0, '2025-02-17'),
(3, 'Bonds', 3500, 6.5, '2025-02-19');

INSERT INTO Debts (User_ID, Type, Amount, Interest_rate, Due_date) VALUES
(2, 'Credit Card', 2000, 15.0, '2025-02-01'),
(3, 'Student Loan', 5000, 5.5, '2025-06-01'),
(4, 'Home Loan', 15000, 7.0, '2025-12-01'),
(5, 'Car Loan', 10000, 6.5, '2025-09-01'),
(6, 'Credit Card', 2500, 14.0, '2025-02-20'),
(7, 'Student Loan', 6000, 5.8, '2025-07-01'),
(8, 'Home Loan', 14000, 7.2, '2025-11-01'),
(9, 'Car Loan', 9500, 6.0, '2025-08-01'),
(10, 'Credit Card', 1800, 16.0, '2025-03-01'),
(3, 'Personal Loan', 4000, 9.0, '2025-04-01');

INSERT INTO FinancialHealth (User_ID, Score, Date) VALUES
(2, 85, '2025-01-31'),
(3, 75, '2025-01-31'),
(4, 90, '2025-01-31'),
(5, 80, '2025-01-31'),
(6, 70, '2025-01-31'),
(7, 95, '2025-01-31'),
(8, 78, '2025-01-31'),
(9, 88, '2025-01-31'),
(10, 83, '2025-01-31'),
(3, 76, '2025-02-01');

SELECT 
    Users.Username, 
    (COALESCE(SUM(Income.Amount), 0) - COALESCE(SUM(Expenses.Amount), 0)) AS Net_Monthly_Income
FROM Users
LEFT JOIN Income ON Users.User_ID = Income.User_ID 
    AND Income.Date BETWEEN '2025-01-01' AND '2025-01-31'
LEFT JOIN Expenses ON Users.User_ID = Expenses.User_ID 
    AND Expenses.Date BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY Users.User_ID, Users.Username;


