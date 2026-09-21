-- 1. DATABASE CREATION
CREATE DATABASE IF NOT EXISTS banking_system;
USE banking_system;

-- 2. TABLES CREATION

CREATE TABLE BRANCHES (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE CUSTOMERS (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50),
    email VARCHAR(100),
    dob DATE
);

CREATE TABLE EMPLOYEES (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    designation VARCHAR(50),
    salary INT,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES BRANCHES(branch_id)
);

CREATE TABLE ACCOUNTS (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCHES(branch_id)
);

CREATE TABLE TRANSACTIONS (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(10),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES ACCOUNTS(account_id)
);

CREATE TABLE LOANS (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    amount DECIMAL(10,2),
    interest_rate DECIMAL(4,2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- 3. INSERTION - Based on Your Screenshot Data

INSERT INTO BRANCHES VALUES
(1, 'Guntur Branch', 'Guntur'),
(2, 'Vijayawada Branch', 'Vijayawada'),
(3, 'Hyderabad Branch', 'Hyderabad');

INSERT INTO CUSTOMERS VALUES
(1, 'Rahul Kumar', '9876543210', 'Guntur', 'rahul@gmail.com', '1999-05-15'),
(2, 'Priya Sharma', '9123456789', 'Vijayawada', 'priya@gmail.com', '2000-08-20'),
(3, 'Arjun Reddy', '9988776655', 'Hyderabad', 'arjun@gmail.com', '1997-03-10'),
(4, 'Sneha Patel', '9876512345', 'Guntur', 'sneha@gmail.com', '2001-11-25'),
(5, 'Vikram Singh', '9123409876', 'Vizag', 'vikram@gmail.com', '1996-12-05');

INSERT INTO EMPLOYEES VALUES
(1, 'Anil Kumar', 'Manager', 60000, 1),
(2, 'Sunita Rao', 'Cashier', 35000, 2),
(3, 'Ravi Teja', 'Clerk', 45000, 3),
(4, 'Lakshmi Devi', 'Manager', 65000, 3);

INSERT INTO ACCOUNTS VALUES
(101, 1, 1, 'Savings', 75000),
(102, 2, 2, 'Current', 40000),
(103, 3, 3, 'Savings', 90000),
(104, 4, 1, 'Savings', 30000),
(105, 5, 3, 'Current', 60000);

INSERT INTO TRANSACTIONS VALUES
(1, 101, 'credit', 10000, '2024-01-10'),
(2, 103, 'debit', 5000, '2024-02-15'),
(3, 102, 'credit', 20000, '2024-03-20'),
(4, 105, 'credit', 15000, '2024-04-10');

INSERT INTO LOANS VALUES
(1, 1, 'Home Loan', 500000, 7.5),
(2, 3, 'Car Loan', 300000, 8.2),
(3, 5, 'Personal Loan', 100000, 11.0);
USE banking_system;

-- 1. Display all records from the Customers table.
SELECT * FROM CUSTOMERS;

-- 2. Display the name, phone number, and email of all customers.
SELECT name, phone, email FROM CUSTOMERS;

-- 3. Display all customers who are from Hyderabad.
SELECT * FROM CUSTOMERS WHERE city = 'Hyderabad';

-- 4. Display all accounts whose account_type is Savings.
SELECT * FROM ACCOUNTS WHERE type = 'Savings';
-- If your column is account_type:
-- SELECT * FROM ACCOUNTS WHERE account_type = 'Savings';

-- 5. Display all accounts having a balance greater than ₹50,000.
SELECT * FROM ACCOUNTS WHERE balance > 50000;

-- 6. Display all transactions where the transaction type is credit.
SELECT * FROM TRANSACTIONS WHERE transaction_type = 'credit';
-- or if column name is 'type':
-- SELECT * FROM TRANSACTIONS WHERE type = 'credit';

-- 7. Display all employees whose salary is greater than ₹40,000.
SELECT * FROM EMPLOYEES WHERE salary > 40000;

-- 8. Display all customers born after 1998-01-01.
SELECT * FROM CUSTOMERS WHERE dob > '1998-01-01';

-- 9. Display all accounts in descending order of their balance.
SELECT * FROM ACCOUNTS ORDER BY balance DESC;

-- 10. Find the total number of customers in the bank.
SELECT COUNT(*) AS total_customers FROM CUSTOMERS;

-- 11. Find the total balance of all accounts.
SELECT SUM(balance) AS total_balance FROM ACCOUNTS;

-- 12. Find the average account balance.
SELECT AVG(balance) AS average_balance FROM ACCOUNTS;

-- 13. Find the highest and lowest account balance.
SELECT MAX(balance) AS highest_balance, MIN(balance) AS lowest_balance FROM ACCOUNTS;

-- 14. Display the number of accounts for each account_type.
SELECT type, COUNT(*) AS number_of_accounts FROM ACCOUNTS GROUP BY type;

-- 15. Display each account type and its total balance, but show only account types whose total balance is greater than ₹80,000.
SELECT type, SUM(balance) AS total_balance FROM ACCOUNTS GROUP BY type HAVING SUM(balance) > 80000;

-- 16. Display the customer name, account ID, account type, and balance using Customers and Accounts.
SELECT C.name, A.account_id, A.type, A.balance FROM CUSTOMERS C JOIN ACCOUNTS A ON C.customer_id = A.customer_id;

-- 17. Display the customer name, transaction ID, transaction amount, and transaction type using Customers, Accounts, and Transactions.
SELECT C.name, T.transaction_id, T.amount, T.transaction_type FROM CUSTOMERS C JOIN ACCOUNTS A ON C.customer_id = A.customer_id JOIN TRANSACTIONS T ON A.account_id = T.account_id;

-- 18. Display the customer name, loan type, loan amount, and interest rate using Customers and Loans.
SELECT C.name, L.loan_type, L.amount, L.interest_rate FROM CUSTOMERS C JOIN LOANS L ON C.customer_id = L.customer_id;

-- 19. Display the employee name, designation, branch name, and branch location using Employees and Branches.
SELECT E.name, E.designation, B.branch_name, B.location FROM EMPLOYEES E JOIN BRANCHES B ON E.branch_id = B.branch_id;

-- 20. Display the names of customers whose account balance is greater than the average balance of all accounts.
SELECT C.name, A.balance FROM CUSTOMERS C JOIN ACCOUNTS A ON C.customer_id = A.customer_id WHERE A.balance > (SELECT AVG(balance) FROM ACCOUNTS);