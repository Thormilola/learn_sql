--BASIC SQL
--select statement, select *, Top, Distinct, count, as, max, min, avg

SELECT *
FROM EmployeeDemographics;

SELECT TOP 5 *
FROM EmployeeDemographics;

SELECT DISTINCT(Gender)
FROM EmployeeDemographics;

SELECT COUNT(Last_Name) AS LastNameCount
FROM EmployeeDemographics;

SELECT MAX(Salary) AS MaximumSalary
FROM EmployeeSalary;

SELECT MIN(Salary) AS MinimumSalary
FROM EmployeeSalary;

SELECT AVG(Salary) AS AverageSalary
FROM EmployeeSalary;

--FROM STATEMENT
SELECT *
FROM [Practising SQL ].dbo.EmployeeSalary;

SELECT TOP 5 *
FROM [Practising SQL ].dbo.EmployeeDemographics;

--WHERE CLAUSE
-- =, <>, <, >, And, Or, Like, IN, IS NULL, IS NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE First_Name = 'Jim';

SELECT *
FROM EmployeeDemographics
WHERE First_Name <> 'Jim';

SELECT *
FROM EmployeeDemographics
WHERE Age > 30;

SELECT *
FROM EmployeeDemographics
WHERE Age < 30 ;

SELECT *
FROM EmployeeDemographics
WHERE Age >= 30;

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 ;

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 AND Gender = 'Male';

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 OR Gender = 'Male';

SELECT *
FROM EmployeeDemographics
WHERE First_Name LIKE '%m' ;

SELECT *
FROM EmployeeDemographics
WHERE First_Name LIKE 'P%' ;

SELECT *
FROM EmployeeDemographics
WHERE Last_Name LIKE 'S%' ;

SELECT *
FROM EmployeeDemographics
WHERE Last_Name LIKE '%S%' ;

SELECT *
FROM EmployeeDemographics
WHERE Last_Name LIKE 'S%ott%' ;

SELECT *
FROM EmployeeDemographics
WHERE Last_Name is NULL ;

SELECT *
FROM EmployeeDemographics
WHERE Last_Name is NOT NULL ;

SELECT *
FROM EmployeeDemographics
WHERE Age IN (30,32) ;

--GROUP BY, ORDER BY
SELECT Gender, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
GROUP BY Gender;

SELECT Gender,COUNT(Gender) as GenderCount
FROM EmployeeDemographics
GROUP BY Gender;

SELECT Gender, Age, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
GROUP BY Gender, Age;

SELECT Gender,COUNT(Gender) as GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender;

SELECT Gender,COUNT(Gender) as GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY 1 DESC, 5 DESC;

SELECT gender, count(gender) as Count_of_gender
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
ORDER BY Gender DESC;

SELECT*
FROM EmployeeDemographics
ORDER BY 5 ASC, 4 DESC;

SELECT *
FROM EmployeeDemographics
WHERE Age >= 30 OR Gender = 'Female';

--INTERMEDIATE
--JOINS
--CASE STATEMENTS
--UPDATING/DELETING DATA
--PARTITION BY
--DATA TYPES
--ALIASING
--CREATING VIEWS
--HAVING VS GROUP BY
--GETDATE()
--PRIMARY KEY VS FOREIGN KEY
--Inner joins, full/left/right outer joins


INSERT INTO EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(' ', 'Holly', 'Flax', ' ' , ' '),
(1013, 'Darryl', 'Philbin', ' ', 'Male');

INSERT INTO EmployeeSalary VALUES
(1010, 'NULL ', 47000 ),
(' ', 'Salesman',43000 );

SELECT *
FROM [Practising SQL ].dbo.EmployeeDemographics;

SELECT *
FROM [Practising SQL ].dbo.EmployeeSalary;

SELECT d.EmployeeID, First_Name, Last_Name, salary
FROM [Practising SQL ].dbo.EmployeeDemographics d
INNER JOIN [Practising SQL ].dbo.EmployeeSalary s
ON d.EmployeeID = s.EmployeeID
WHERE First_Name <> 'Michael'
ORDER BY salary DESC;

SELECT AVG(Salary) as avg_salary, JobTitle
FROM EmployeeDemographics 
INNER JOIN EmployeeSalary 
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle;

--UNION(Unique), UNION ALL(shows even duplicates)
CREATE TABLE WareHouseEmployeeDemographics 
(EmployeeID int,
First_Name varchar(50),
Last_Name varchar(50),
Age int,
Gender varchar(50));

INSERT INTO WareHouseEmployeeDemographics VALUES
(1015, 'Roy', 'Anderson', 39, 'Male'),
(1016, 'Val', 'Johnson', 37, 'Female'),
(1017, 'Darryl', 'Simon', 39, 'Male'),
(1018, 'Rachael', 'Sanders', 39, 'Male');

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN WareHouseEmployeeDemographics
ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

SELECT *
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics;

--using a union to combine two different tables
SELECT EmployeeID, First_Name, Age
FROM EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary

--CASE - helps you to specify a condition and what should be returned when the condition is met
SELECT First_Name, Last_Name, Age,
CASE
   WHEN Age > 30 THEN 'Old'
   ELSE 'Young'
END
FROM [Practising SQL ].dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

SELECT First_Name, Last_Name, Age,
CASE
   WHEN Age > 30 THEN 'Old'
   WHEN Age BETWEEN 27 AND 30 THEN 'Young'
   ELSE 'Baby'
END
FROM [Practising SQL ].dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

--IF a case statement statement meets two conditions, it returns the first 
SELECT First_Name, Last_Name, Age,
CASE
   WHEN Age = '32' THEN '32 and kicking'
   WHEN Age > 30 THEN 'Old'
   ELSE 'Baby'
END
FROM [Practising SQL ].dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

SELECT First_Name, Last_Name, JobTitle, salary,
CASE  
  WHEN JobTitle = 'Salesman' THEN salary + (salary * .10)
  WHEN JobTitle = 'Accountant' THEN salary + (salary * .05)
  WHEN JobTitle = 'HR' THEN salary + (salary * .000001)
  ELSE salary + (Salary * .03)
END AS Salary_After_Raise
FROM [Practising SQL ].dbo.EmployeeDemographics
JOIN [Practising SQL ].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Having Clause
SELECT JobTitle, count(JobTitle) as Number_of_people_with_that_job_title
FROM [Practising SQL ].dbo.EmployeeDemographics
JOIN [Practising SQL ].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING count(JobTitle) > 1;

SELECT JobTitle, AVG(salary) as Avg_Salary_for_each_job_title
FROM [Practising SQL ].dbo.EmployeeDemographics
JOIN [Practising SQL ].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING avg(salary) > 45000
ORDER BY avg(salary) DESC;


--Updating/Deleting Data
--difference between inserting/updating/deleting

--UPDATE

UPDATE [Practising SQL ].dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE First_Name = 'Holly';

UPDATE [Practising SQL ].dbo.EmployeeDemographics
SET Age = 41
WHERE First_Name = 'Holly';

UPDATE [Practising SQL ].dbo.EmployeeDemographics
SET Gender = 'Female'
WHERE First_Name = 'Holly' AND Last_Name = 'Flax';

--DELETE , The where clause must be included else all data will be deleted.
DELETE FROM [Practising SQL ].dbo.EmployeeSalary
WHERE EmployeeID = 0;

--ALIASING - enhances the readability of your code
SELECT First_Name AS F_NAME
FROM [Practising SQL ].dbo.EmployeeDemographics;

SELECT First_Name + ' ' + Last_Name AS Full_Name
FROM EmployeeDemographics;

--Aliasing the table name. This can be very useful especially when you have alot of joins
SELECT Demo.EmployeeID, Sal.salary
FROM [Practising SQL ].dbo.EmployeeDemographics AS Demo
JOIN [Practising SQL ].dbo.EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID;

SELECT Demo.First_Name + ' ' + Demo.Last_Name AS Full_Name, Sal.JobTitle, Sal.salary 
FROM [Practising SQL ].dbo.EmployeeDemographics Demo
LEFT JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [Practising SQL ].dbo.WareHouseEmployeeDemographics Ware
ON Demo.EmployeeID = Ware.EmployeeID

--Partition by
SELECT First_Name, Last_Name, Gender, salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS Total_Gender
FROM [Practising SQL ].dbo.EmployeeDemographics Demo
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID;

--see why it is different from a group by statement
SELECT First_Name, Last_Name, Gender, salary, COUNT(Gender) AS Total_Gender
FROM [Practising SQL ].dbo.EmployeeDemographics Demo
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY First_Name, Last_Name, Gender, salary;

SELECT Gender, COUNT(Gender) AS Total_Gender
FROM [Practising SQL ].dbo.EmployeeDemographics Demo
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender;