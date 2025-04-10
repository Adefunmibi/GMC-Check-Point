-- Created a database
CREATE DATABASE Gomycode_1;

USE Gomycode_1
-- Creating a table
CREATE TABLE Employees(
     EmployeeID INT PRIMARY KEY,
	 FirstName VARCHAR(100),
	 LastName VARCHAR(100),
	 Department VARCHAR(100),
	 Salary DECIMAL(10, 2)
	 );

-- Inserting Data into the table
INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
   VALUES (1, 'John', 'Doe', 'HR', 55000.00),
          (2, 'Jane', 'Smith', 'Marketing', 60000.00),
		  (3, 'Bob', 'Johnson', 'IT', 65000.00);

-- View the structure of the table
SP_HELP Employees

-- Retrieve all employee from the Employee table
SELECT EmployeeID, FirstName FROM Employees;

-- Retrieve employee in the HR department
SELECT * FROm Employees WHERE Department = 'HR';

-- Retrieve employee with a salary greater than 60000
SELECT * FROm Employees WHERE Salary > 60000;

-- Updating employeeID column
UPDATE Employees
SET Salary = 58000.00
WHERE EmployeeID = 1;

INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
   VALUES (4, 'Ayo', 'dopeclass', 'DS', 180000.00)

UPDATE Employees
SET Department = 'IT',
    LastName = 'Nikky'
WHERE EmployeeID = 4;

-- Delete employee with ID 4
DELETE FROM Employees
WHERE EmployeeID = 4

SELECT * FROM Employees

--Create another table
CREATE TABLE Departments(
		DepartmentID INT PRIMARY KEY,
		DepartmentName VARCHAR (100)
		);
SELECT * FROM Departments

-- insert data into the 'Department' table
INSERT INTO Departments (DepartmentID, DepartmentName)
       VALUES (1, 'HR'),
	           (2, 'Marketing'),
			   (3, 'IT');

SELECT * FROM Employees
SELECT * FROM Departments


-- INNER JOIN
SELECT * FROM Employees
	INNER JOIN Departments
	ON Employees.Department = Departments.DepartmentName;

-- Adding more values on the Employees's table
INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
   VALUES (4, 'Andy', 'Fineboy', 'HR', 75000.00),
          (5, 'Joseph', 'Smith', 'Marketing', 80000.00),
		  (6, 'Dopeclass', 'Johnson', 'IT', 90000.00);

-- LEFT JOIN 
SELECT * FROM Employees
     RIGHT JOIN Departments
	ON Employees.EmployeeID = Departments.DepartmentID

SELECT * FROM Employees
SELECT * FROM Departments

SELECT * FROM Employees
     FULL JOIN Departments
	ON Employees.EmployeeID = Departments.DepartmentID

-- Aggregate function
-- Calculate the average salary of employees in the IT department
SELECT AVG(Salary) As Average_salary
 FROM Employees
 WHERE Department = 'IT'

 -- Calculate maximum salary of the employees 
 SELECT MAX(Salary) AS Maximum_salary
  FROM Employees
 -- Get the first two records
 SELECT TOP 2 *
 FROM Employees
 
SELECT DISTINCT(FirstName)
 FROM Employees

 -- Counting records in the table
 SELECT FirstName, LastName, COUNT(*) IT_Employee
  FROM Employees
  WHERE Department = 'IT' 
  GROUP BY FirstName, LastName

--- Subqueries
SELECT AVG(Salary) FROM Employees

SELECT EmployeeID, FirstName, LastName, Salary
 FROM Employees
 WHERE Salary > (SELECT AVG(Salary) FROM Employees)

 -- Using Contraints In SQL Server
 CREATE TABLE Customer(
         CustomerID INT PRIMARY KEY,
		 FirstName VARCHAR(100),
		 LastName VARCHAR(100)
		 );
-- Creating a foreign Key
CREATE TABLE Orders(
        OrderID INT PRIMARY KEY,
		CustomerID INT,
		OrderDate DATE,
		ProductName VARCHAR (100),
		FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
		);

-- Creating a table with a Unique constraint
CREATE TABLE Products(
	ProductID INT,
	ProductName VARCHAR(100)
	);
INSERT INTO Products(ProductID, ProductName)
  VALUES(1, 'Electronics'),
        (2, 'Appliances'),
		(3, 'Furnitures'),
		(4, 'Cooking Utentils'),
		(5, 'Toiletries');

ALTER TABLE Products
ADD Price DECIMAL(10, 2)

SELECT * FROM Products

UPDATE TABLE Products
SET Price
WHERE  



-- Creating a table with a check constraint
CREATE TABLE Students(
		StudentID INT PRIMARY KEY,
		Age INT,
		CHECK (Age >= 18)
		);

INSERT INTO Students( StudentID, Age)
   VALUES (001, 16);

-- Creating a table with a Default Constaint
CREATE TABLE Orders_1(
      OrderID INT PRIMARY KEY,
	  OrderDate DATE DEFAULT GETDATE()
	  )
SELECT * FROM Orders_1
INSERT INTO Orders_1(OrderID)
	VALUES (1);

CREATE TABLE Parties(
      Party_id INT,
	  Party_name VARCHAR(100),
	  Candidate_name VARCHAR (100) DEFAULT 'NOT AVAILABLE',
	  Position VARCHAR(100)
	  );
INSERT INTO Parties( Party_id, Party_name,Position)
  VALUES(001, 'PDP', 'Presidency');

select * from Parties

-- Adding a primary key constraint to an existing table
ALTER TABLE Parties
ALTER COLUMN Party_id INT NOT NULL;

ALTER TABLE Parties
ADD PRIMARY KEY (Party_id);

--Logical Operators
-- AND example
SELECT * FROM Employees
   WHERE Salary >= 55000 AND Department = 'IT';

INSERT INTO Products(Price)
 VALUES(200.00),
       (300.00),
	   (150.00),
	   (500.00),
	   (600.00);

DROP TABLE Products

SELECT * FROM Products


ALTER TABLE Products
DROP CONSTRAINT  UC_ProductID;
 
UPDATE Products
SET Price = 200.00
WHERE ProductID = 1

UPDATE Products
SET Price = 300.00
WHERE ProductID = 2

UPDATE Products
SET Price = 150.00
WHERE ProductID = 3

UPDATE Products
SET Price = 500.00
WHERE ProductID = 4

UPDATE Products
SET Price = 600.00
WHERE ProductID = 5

DELETE FROM Products
WHERE ProductID IS NULL;

UPDATE Products
SET Price (200, 300, 150, 500, 600)
WHERE productID IN(1, 2, 3, 4, 5)

-- Remember to update rows during case lecture

-- Using the NOT operator
SELECT * FROM Products
WHERE NOT productName = 'Electronics'

-- Using the IN operator
SELECT * FROM Products
	WHERE ProductName IN ('Electronics', 'Cooking utentils')

-- Using the Between operator
SELECT * FROM Products
WHERE Price NOT BETWEEN 200 AND 500

-- Using the LIKE operator
SELECT * FROM Products
  WHERE ProductName LIKE 'F%' OR ProductName IN ('Electronics', 'Cooking utentils')

-- CASE Statement
SELECT * FROM Students

INSERT INTO Students(StudentID, Age)
  VALUES( 001, 25),
        (002, 35),
		(003, 29),
		(004, 32),
		(005, 30)
SELECT Age,
  CASE
    WHEN Age  <=29 THEN 'Consider marriage'
	WHEN Age  <= 32 THEN 'Marry already !!!'
	ELSE 'You might consider going your pastor'
  END AS Marital_status
FROM Students;

-- Another CASE example
SELECT COUNT(*) AS count_all,
  CASE
    WHEN Age  <=29 THEN 'Consider marriage'
	WHEN Age  <= 32 THEN 'Marry already !!!'
	ELSE 'You might consider going your pastor'
  END AS Marital_status
FROM Students
GROUP BY
 CASE
    WHEN Age  <=29 THEN 'Consider marriage'
	WHEN Age  <= 32 THEN 'Marry already !!!'
	ELSE 'You might consider going your pastor'
  END;

-- GROUP BY Statement
SELECT * FROM Employees
SELECT Department, AVG(Salary) AS AVG_Salary
  FROM Employees
  GROUP BY Department
  ORDER BY AVG_Salary;

SELECT FirstName, Department, AVG(Salary) AS AVG_Salary
  FROM Employees
  WHERE FirstName LIKE 'J%' 
  GROUP BY FirstName, Department
  ORDER BY AVG_Salary;

SELECT EmployeeID, FirstName, Department, AVG(Salary) AS AVG_Salary
  FROM Employees 
  GROUP BY EmployeeID,FirstName, Department
  HAVING EmployeeID > 4
  ORDER BY AVG_Salary;

UPDATE Products
SET Price =
   CASE productID
   WHEN 1 THEN 200
   WHEN 2 THEN 300
   WHEN 3 THEN 150
   WHEN 4 THEN 500
   WHEN 5 THEN 600
   END;
SELECT * FROM Employees
UPDATE Employees
SET Salary =
  CASE 
   WHEN Department = 'IT' OR FirstName LIKE 'J%' THEN Salary * 2
   WHEN Department = 'HR' AND FirstName LIKE 'A%' THEN Salary * 2.5
  END;

-- SET operator
SELECT * FROM Employees
SELECT * FROM Departments

SELECT EmployeeID, Department FROM Employees
    EXCEPT
SELECT  DepartmentID, DepartmentName FROM Departments

--Add more values to Department Table
INSERT INTO Departments (DepartmentID, DepartmentName)
       VALUES (7, 'Software development'),
	           (8, 'Admin'),
			   (9, 'Product Management');

-- Import dataset
-- Houses that are in perfect condition(4 & 5) from 1990-present
SELECT  yr_built, condition, city, COUNT(*) Number_of_houses
FROM house_pricing_dataset
  WHERE condition >= 4 and yr_built >= 1990
  GROUP BY yr_built, condition, city
  ORDER BY condition DESC


-- An 3 bedroom apartment, 2 bathroom, that has condition(4) and price below 500,000
-- Houses that have only been renovated and have atleast 2 views, should 3 bedroom above and should be in (seattle, kent, maple valley, and lake forest park)
-- SP_help house_pricing_dataset # Checking table structure

SELECT * FROM house_pricing_dataset


