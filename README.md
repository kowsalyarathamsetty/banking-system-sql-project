# 🏦 Banking System - DBMS Project
A complete Database Management System project designed to manage core banking operations securely and efficiently.
### Project Overview
This project manages Customers, Accounts, Transactions, Loans, Branches, and Employees. It includes table creation, data insertion, and 20 optimized SQL queries from basic to advanced level (JOINS, GROUP BY, Subqueries).
###  Repository Files
| File Name | Description |
| `BANKING_SSTEM.SQL` | Complete executable SQL file |
| `Banking_System.docx` | Project documentation (Word) |
| `ER_Diagram.png` | Entity Relationship Diagram |
| `README.md` | Project overview |
### Database Structure (6 Tables)
1.  **BRANCHES** - Branch details
2.  **CUSTOMERS** - Customer information
3.  **EMPLOYEES** - Employee data with Branch relation
4.  **ACCOUNTS** - Savings/Current accounts
5.  **TRANSACTIONS** - Credit/Debit history
6.  **LOANS** - Home, Car, Personal loans
### ER Diagram
![ER Diagram](ER_Diagram.png)
### Queries Covered (20)
- Basic: SELECT, WHERE, ORDER BY
- Aggregate: COUNT, SUM, AVG, MAX, MIN
- Advanced: GROUP BY, HAVING, INNER JOIN, Subquery

Example:
```sql
SELECT C.name, A.balance FROM CUSTOMERS C 
JOIN ACCOUNTS A ON C.customer_id = A.customer_id 
WHERE A.balance > (SELECT AVG(balance) FROM ACCOUNTS);
