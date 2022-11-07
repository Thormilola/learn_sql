--BASIC SQL

--Already created my tables EmployeeDemographics and EmployeeSalary but I created another table in this script to demonstrate table creation
---SELECT STATEMENT 
---select *, Top, Distinct, count, as, max, min, avg

SELECT *
FROM EmployeeDemographics;

SELECT TOP 5 *
FROM EmployeeDemographics;

SELECT DISTINCT (Gender)
FROM EmployeeDemographics;

SELECT COUNT(Last_Name) AS LastNameCount
FROM EmployeeDemographics;

SELECT MAX(Salary) AS Maximum_Salary
FROM EmployeeSalary;

SELECT MIN(Salary) AS MinimumSalary
FROM EmployeeSalary;

SELECT AVG(Salary) AS AverageSalary
FROM EmployeeSalary;

---FROM STATEMENT
SELECT *
FROM [Practising SQL ].dbo.EmployeeSalary;

SELECT TOP 5 *
FROM [Practising SQL ].dbo.EmployeeDemographics;

---WHERE CLAUSE
-- =(greater than), <>(not equal to), <(less than>, >(greater than), >=(greater than or equal to), <=(less than or equal to) And, 
--Or, Like, IN, IS NULL, IS NOT NULL

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
WHERE Age < 30;

SELECT *
FROM EmployeeDemographics
WHERE Age >= 30;

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32;

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 AND Gender = 'Male';

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 OR Gender = 'Male';

--this query returns last_name that has the letter 'e' at any position
SELECT *
FROM EmployeeDemographics
WHERE Last_Name LIKE '%e%';

--this query returns first_name that starts with 'p' and has any number of characters
SELECT *
FROM EmployeeDemographics
WHERE First_Name LIKE 'P%';

--this query returns first_name that starts with 'p' and has two more characters after p
SELECT *
FROM EmployeeDemographics
WHERE First_Name LIKE 'p__' ;

--this query returns last names that starts with 's' and has the letter "t" at any position
SELECT *
FROM EmployeeDemographics
WHERE Last_Name LIKE 's%t%';

--this query returns any rows where the last name is null
SELECT *
FROM EmployeeDemographics
WHERE Last_Name is NULL ;

--this query returns any rows where the last name is not null
SELECT *
FROM EmployeeDemographics
WHERE Last_Name is NOT NULL;

-- To the best of my current understanding, IN is used to specify multiple conditions in a column.
SELECT *
FROM EmployeeDemographics
WHERE Age IN (30,32);

--GROUP BY, ORDER BY
---group by
SELECT Gender, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
GROUP BY Gender;

SELECT Gender, Age, COUNT(Gender)
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

--sorts the data by a particular column
SELECT *
FROM EmployeeDemographics
ORDER BY Age;

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

--INTERMEDIATE SQL
--Inserting more data into the table
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

--JOINS
--Inner_Join
SELECT *
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Inner Join and aliasing
SELECT *
FROM EmployeeDemographics demo
INNER JOIN EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID
WHERE First_Name <> 'Michael'
ORDER BY salary DESC;

SELECT AVG(Salary) as avg_salary, JobTitle
FROM EmployeeDemographics 
INNER JOIN EmployeeSalary 
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle;

--left join
SELECT *
FROM EmployeeDemographics 
LEFT JOIN EmployeeSalary 
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--right join
SELECT *
FROM EmployeeDemographics 
RIGHT JOIN EmployeeSalary 
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--full outer join
SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN WareHouseEmployeeDemographics
ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

--CREATING A NEW TABLE to demonstrate union
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

--UNION(Unique), UNION ALL(shows even duplicates)
SELECT *
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics;

--CASE
-- helps you to specify a condition and what should be returned when the condition is met
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

SELECT demo.EmployeeID, Last_Name, salary,
CASE 
    WHEN salary > 60000 THEN 'Good_Pay'
	WHEN salary BETWEEN 45000 AND 60000 THEN 'Average_Pay'
	WHEN salary > 40000 AND salary < 45000 THEN 'Below_Average_Pay'
	ELSE 'They_Need_To_Do_Better'
END AS 'Pay_Condition'
FROM EmployeeDemographics demo
INNER JOIN EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID

--Having Clause
SELECT JobTitle, count(JobTitle) as Number_of_people_with_that_job_title
FROM [Practising SQL ].dbo.EmployeeDemographics
JOIN [Practising SQL ].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING count(JobTitle) > 1;

SELECT JobTitle, AVG(salary) as Avg_Salary_for_each_job_title
FROM [Practising SQL ].dbo.EmployeeDemographics dem
JOIN [Practising SQL ].dbo.EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY JobTitle
HAVING avg(salary) > 45000
ORDER BY avg(salary) DESC;


--UPDATING AND DELETING
--The WHERE clause must be used with the UPDATE and DELETE statement unless your intention is to update or delete the whole records in the 
--table respectively.

--update
UPDATE [Practising SQL ].dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE First_Name = 'Holly';

UPDATE [Practising SQL ].dbo.EmployeeDemographics
SET Age = 41
WHERE First_Name = 'Holly';

UPDATE [Practising SQL ].dbo.EmployeeDemographics
SET Gender = 'Female'
WHERE First_Name = 'Holly' AND Last_Name = 'Flax';

UPDATE EmployeeDemographics
SET Age = 39
WHERE EmployeeID = 1013;

--delete 
DELETE FROM [Practising SQL ].dbo.EmployeeSalary
WHERE EmployeeID = 0;

--ALIASING - enhances the readability of your code
SELECT First_Name AS F_NAME
FROM [Practising SQL ].dbo.EmployeeDemographics;

SELECT First_Name + ' ' + Last_Name AS Full_Name
FROM EmployeeDemographics;

--Aliasing the table name. This can be very useful especially when you have alot of joins
SELECT demo.EmployeeID, sal.salary
FROM [Practising SQL ].dbo.EmployeeDemographics AS demo
JOIN [Practising SQL ].dbo.EmployeeSalary AS sal
ON demo.EmployeeID = sal.EmployeeID;

SELECT Demo.First_Name + ' ' + Demo.Last_Name AS Full_Name, Sal.JobTitle, Sal.salary 
FROM [Practising SQL ].dbo.EmployeeDemographics Demo
LEFT JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [Practising SQL ].dbo.WareHouseEmployeeDemographics Ware
ON Demo.EmployeeID = Ware.EmployeeID;

--PARTITION BY
SELECT First_Name, Last_Name, Gender, salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS Total_Gender
FROM [Practising SQL ].dbo.EmployeeDemographics Demo
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID;

SELECT First_Name + ' ' + Last_Name AS Full_Name, Gender,
COUNT(Gender) OVER (PARTITION BY Gender) AS Gender_Count
FROM EmployeeDemographics demo
JOIN EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID;

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

--ADVANCED SQL

--SUBQUERIES

---subquery in the select statement
SELECT EmployeeID, salary, (SELECT AVG(salary)  FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary;

SELECT EmployeeID, First_Name + ' ' + Last_Name AS Full_Name, Age,
(SELECT AVG(Age) FROM EmployeeDemographics) AS AllAvgAge
FROM EmployeeDemographics;

--using partition by
SELECT EmployeeID, salary,
AVG(salary) OVER () AS AllAvgSalary
FROM EmployeeSalary;

SELECT EmployeeID, First_Name + ' ' + Last_Name AS Full_Name, Age,
AVG(Age) OVER() AS AllAvgAge
FROM EmployeeDemographics;

--Why Group by doesnt work
SELECT EmployeeID, salary, AVG(salary) AS AllAvgSalary
FROM EmployeeSalary
Group By EmployeeID, salary
ORDER BY 1, 2;

--SUBQUERY IN THE FROM STATEMENT
SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, salary, AVG(salary) OVER () AS AllAvgSalary
FROM EmployeeSalary) a;

SELECT a.EmployeeID, Full_Name, AllAvgAge 
FROM 
(SELECT EmployeeID, First_Name + ' ' + Last_Name AS Full_Name, Age, AVG(Age) OVER () AS AllAvgAge 
FROM EmployeeDemographics) a;

--SUBQUERY IN THE WHERE STATEMENT --only one column can go into this.
--this script displays record of employees over the age of 30
SELECT EmployeeID, JobTitle, salary
FROM EmployeeSalary 
WHERE EmployeeID in (
               SELECT EmployeeID
			   FROM EmployeeDemographics
			   WHERE Age > 30);

--the above syntax can also be done with join
SELECT demo.EmployeeID, Age, JobTitle, salary
FROM EmployeeSalary sal
JOIN EmployeeDemographics demo
ON sal.EmployeeID = demo.EmployeeID
WHERE Age > 30;

--CTE Common Table Expressions
--acts very much like sub query
--the CTE Select statement  must come immediately after the CTE statement
WITH CTE_Employee as
(SELECT First_Name, Last_Name, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS Total_Gender,
AVG(salary) OVER (PARTITION BY Gender) AS Avg_Salary
FROM [Practising SQL ].dbo.EmployeeDemographics Dem
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
   ON Dem.EmployeeID = Sal.EmployeeID
WHERE salary > '45000'
)  
SELECT *
FROM CTE_Employee;

WITH CTE_salary AS
(SELECT dem.EmployeeID, JobTitle, Gender,
COUNT(Gender) OVER(PARTITION BY Gender) AS Gender_Count,
AVG(salary) OVER(PARTITION BY Gender) AS All_Salary
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
WHERE salary > 40000
)
SELECT *
FROM CTE_salary

--TEMP TABLES - TEMPORARY TABLES
CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(50),
salary int);

SELECT *
FROM #temp_Employee;

INSERT INTO #temp_Employee VALUES(
1001, 'H4', 45000);

INSERT INTO #temp_Employee
SELECT *
FROM EmployeeSalary

UPDATE #temp_Employee
SET JobTitle = 'HR'
WHERE salary = 45000;

UPDATE #temp_Employee
SET EmployeeID = 1011
WHERE salary = 45000;

CREATE TABLE #temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_Employee2
SELECT JobTitle,Count(JobTitle), Avg(Age), Avg(Salary)
FROM [Practising SQL ].dbo.EmployeeDemographics Dem
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Dem.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle;

SELECT *
FROM #temp_Employee2

DROP TABLE IF EXISTS #temp_Employee2
INSERT INTO #temp_Employee2
SELECT JobTitle,Count(JobTitle), Avg(Age), Avg(Salary)
FROM [Practising SQL ].dbo.EmployeeDemographics Dem
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Dem.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle;

--STORED PROCEDURE
CREATE PROCEDURE Test
AS
SELECT *
FROM EmployeeDemographics;

EXEC Test;

CREATE PROCEDURE Temp_Employee3
AS
CREATE TABLE #temp_Employee3 (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)
INSERT INTO #temp_Employee3
SELECT JobTitle,Count(JobTitle), Avg(Age), Avg(Salary)
FROM [Practising SQL ].dbo.EmployeeDemographics Dem
JOIN [Practising SQL ].dbo.EmployeeSalary Sal
ON Dem.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle;

SELECT *
FROM #temp_Employee3

EXEC Temp_Employee3 @JobTitle = 'Salesman'

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++