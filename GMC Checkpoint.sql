--Create the Employee Table
CREATE TABLE Employee (Num_E INT Primary Key,
Name VARCHAR(255),
Position VARCHAR(255),
Salary DECIMAL(10, 2),
--Foreign Key
Department_Num_S INT 
);
--Create the Department Table
CREATE TABLE Department( Num_S INT Primary Key,
Label VARCHAR(255),
Manager_Name VARCHAR(255));

SELECT * FROM Department

--Create the table Project
CREATE TABLE Project(
Num_P INT Primary Key, 
Title VARCHAR(255),
Start_Date DATE,
End_Date DATE,
--Foreign Key
Department_Num_S INT);

--Create an Employee_Project table
CREATE TABLE Employee_Project
--Foreign Key
(Employee_Num_E INT ,
--Foreign Key
Project_Num_P  INT ,
Role VARCHAR(255));

--Insert data into department table
INSERT INTO DEPARTMENT (Num_S,Label ,Manager_Name)
              VALUES(1,'IT','Alice Johnson'),
			        (2,'HR','Bob Smith'),
					(3,'Marketing','Clara Bennett');

					SELECT * FROM Department

ALTER TABLE EMPLOYEE
DROP COLUMN Department_Num_s;
					
ALTER TABLE EMPLOYEE 
ADD Num_S INT;

INSERT INTO EMPLOYEE(Num_E,Name,Position,Salary,Num_S)
				VALUES(101,'John Doe','Developer',60000.00,1),
						(102,'Jane Smith','Analyst',55000.00,2),
						(103,'Mike Brown','Designer',50000.00,3),
						(104,'Sarah Johnson','Data Scientist',70000.00,1),
						(105,'Emma Wilson','HR Specialist',52000.00,2);
						SELECT * FROM EMPLOYEE
						 
					
ALTER TABLE PROJECT 
ADD Num_S INT;
ALTER TABLE PROJECT
DROP COLUMN Department_Num_s;


INSERT INTO PROJECT(Num_P,Title,Start_Date,End_Date,Num_S)
  VALUES(201, 'Website Redesign',  '2024-01-15', '2024-06-30', 1),
        (202, 'Employee Onboarding', '2024-03-01','2024-09-01' ,2),
        (203, 'Market Research', '2024-02-01',  '2024-07-31', 3),
        (204,  'IT Infrastructure Setup', '2024-04-01','2024-12-31', 1);

		SELECT * FROM Project

ALTER TABLE Employee_Project
DROP COLUMN Employee_Num_E;
					
ALTER TABLE Employee_Project 
ADD Num_E INT;

ALTER TABLE Employee_Project
DROP COLUMN Project_Num_P;
					
ALTER TABLE Employee_Project 
ADD Num_P INT;

INSERT INTO Employee_Project(Num_E,Num_P,Role)
   VALUES( 101, 201, 'Frontend Developer'),
         ( 104,  201,  'Backend Developer'),
         ( 102,  202,  'Trainer'),
         ( 105,  202,  'Coordinator'),
         ( 103,  203, 'Research Lead'),
         ( 101,  204, 'Network Specialist');


SELECT * FROM Employee_Project

--Update A Record
UPDATE Employee_Project
SET Role = 'Full Stack Developer'
WHERE Num_E=101;

--Delete a Record
DELETE FROM Employee_Project
WHERE Num_E=103;

	--1)Write a query to retrieve the names of employees who are assigned to more than one project,
--including the total number of projects for each employee.
SELECT  Name
FROM 
    Employee e 
JOIN 
    Employee_Project ep ON e.Num_E = ep.Num_E
GROUP BY 
    e.Name
HAVING 
    COUNT(ep.Num_P) > 1;
--2)Write a query to retrieve the list of projects managed by each department, 
--including the department label and manager’s name.
	SELECT 
    d.Label, 
    d.Manager_Name,
	p.Title
  
FROM 
    Department d

JOIN 
    Project p ON d.Num_S = p.Num_S

ORDER BY 
    d.Label, 
    d.Manager_Name;


--3)*Write a query to retrieve the names of employees working on the project 
--"Website Redesign," including their roles in the project.

SELECT 
Name,
ep.role
FROM
Employee e
JOIN
Employee_Project ep ON ep.Num_E =e.Num_E
JOIN 
Project p ON p.Num_P=ep.Num_P
WHERE p.Title ='Website Redesign';

--4)Write a query to retrieve the department with the highest number of employees, 
--including the department label, manager name, and the total number of employees.
SELECT TOP(1)d.label, d.Manager_Name,
 COUNT(e.NUM_E) AS Total_employees
FROM 
Department AS d
JOIN 
employee AS e ON d.Num_S = e.NUM_S
GROUP BY 
    d.label, d.Manager_name;

--5)Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, 
--including their department names.
SELECT Name,Position,Salary
FROM Employee As e
JOIN 
Department d ON e.Num_S=d.Num_S
WHERE Salary>60000;
--6)Write a query to retrieve the number of employees assigned to each project,
--including the project title.
SELECT 
    p.title,
    COUNT(ep.Num_E) AS total_employees
FROM 
    project AS p
JOIN 
    Employee_Project AS ep ON p.Num_P = ep.	Num_P
GROUP BY 
    p.Title;

	--7)Write a query to retrieve a summary of roles employees have across different projects, 
	--including the employee name, project title, and role.
	SELECT ep.Role,
	e.name,
	p.title
	FROM
	Employee AS e
	JOIN 
	Employee_Project AS ep ON ep.Num_E=e.Num_E
	JOIN
	Project AS p ON p.Num_P=ep.Num_P;

	--8)Write a query to retrieve the total salary expenditure for each department,
	--including the department label and manager name.
	SELECT 
	d.Label,
	d.Manager_Name,
	SUM (e.salary ) as Total_Salary_Expenditure
	FROM Department d 
	JOIN
	employee e ON e. Num_S=d.Num_S
	GROUP BY 
    d.label, d.Manager_name;


