--DROP TABLE EmployeeDemographics;
--DROP TABLE  EmployeeSalary;
--CREATE TABLE EmployeeDemographics 
-- (EmployeeID int,
--FirstName varchar(50),
-- LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary 
--(EmployeeID int,
--JobTitle varchar(50), 
--Salary int)


--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')


--INSERT INTO EmployeeDemographics VALUES (1001, 'Jim', 'Halpert', 30, 'Male')
--Insert into EmployeeDemographics VALUES
--(1002, 'Pam', 'Beasley', 30, 'Female'), 
--(1003, 'Dwight', 'Schrute', 29, 'Male'), 
--(1004, 'Angela', 'Martin', 31, 'Female'), 
--(1005, 'Toby', 'Flenderson', 32, 'Male'), 
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'), 
--(1008, 'Stanley', 'Hudson', 38, 'Male'), 
--(1009, 'Kevin', 'Malone', 31, 'Male')

--INSERT INTO EmployeeDemographics VALUES 
--(1011, 'Ryan', 'Howard', 26, 'Male')
--INSERT INTO EmployeeDemographics VALUES
--('' , 'Holly', 'Flax','' ,'' )
--INSERT INTO EmployeeDemographics VALUES
--(NULL , 'Holly', 'Flax',NULL  ,NULL  )
--DELETE FROM EmployeeDemographics WHERE FirstName = 'Holly';
--INSERT INTO EmployeeDemographics VALUES
--(1013, 'Darryl', 'Philibin', NULL,'Male' )

--INSERT INTO EmployeeSalary VALUES 
--(1001, 'Salesman', 45000), 
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000), 
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--INSERT INTO EmployeeSalary VALUES 
--(1010, NULL , 47000)
--INSERT INTO EmployeeSalary VALUES (NULL, 'Salesman', 43000)

--SELECT *
--FROM WareHouseEmployeeDemographics 

--SELECT *
--FROM EmployeeDemographics

--SELECT FirstName
--FROM EmployeeDemographics
--SELECT FirstName, LastName
--FROM EmployeeDemographics
--SELECT TOP 5*
--FROM EmployeeDemographics
--SELECT DISTINCT (EmployeeID)
--FROM EmployeeDemographics
--SELECT DISTINCT (Gender)
--FROM EmployeeDemographics

--SELECT Count (LastName) AS LastNameCount
--FROM EmployeeDemographics

--SELECT *
--FROM EmployeeSalary

--SELECT *
--FROM SQLEmployee.dbo.EmployeeSalary
--SELECT MAX(Salary)
--FROM EmployeeSalary
--SELECT MIN(Salary)
--FROM EmployeeSalary
--SELECT AVG (Salary)
--FROM EmployeeSalary

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName = 'Jim'
--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName <> 'Jim'
--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 30
--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 30 AND Gender = 'Male'
--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 30 OR Gender = 'Male'
--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%'
--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE '%S%'
--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%o%'
--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName is NULL
--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName is NOT NULL
--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName IN ('Jim', 'Michael')

--SELECT Gender, COUNT(Gender)
--FROM EmployeeDemographics
--GROUP BY Gender

--SELECT Gender, Age, COUNT(Gender)
--FROM EmployeeDemographics
--GROUP BY Gender, Age

--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender ASC
--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender DESC

--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age
----SELECT *
----FROM EmployeeDemographics
----ORDER BY Age DESC
--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age, Gender
--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age DESC, Gender DESC
--SELECT *
--FROM EmployeeDemographics
--ORDER BY 4 DESC, 5 DESC

--SELECT *
--FROM SQLEmployee.dbo.EmployeeDemographics 
--INNER JOIN SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--   SELECT *
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Full Outer JOIN SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--    SELECT *
--FROM SQLEmployee.dbo.EmployeeDemographics 
-- Left Outer JOIN SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--   SELECT *
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Right Outer JOIN SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--    SELECT EmployeeDemographics.EmployeeID,  FirstName, LastName, JobTitle, Salary
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Right Outer JOIN SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--    SELECT EmployeeDemographics.EmployeeID,  FirstName, LastName, JobTitle, Salary
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Inner JOIN SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
-- SELECT *
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Full Outer Join SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--   SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Inner Join SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--   WHERE FirstName <> 'Michael'
--   ORDER BY Salary DESC

--   SELECT  JobTitle, AVG (Salary) 
--   FROM SQLEmployee.dbo.EmployeeDemographics 
--Inner Join  SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--   WHERE JobTitle = 'Salesman'
--   GROUP BY JobTitle


--   SELECT *
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Full Outer JOIN SQLEmployee.dbo.WareHouseEmployeeDemographics
--   ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

--SELECT *
--FROM EmployeeDemographics
--UNION
--SELECT *
--From WareHouseEmployeeDemographics

--UPDATE WareHouseEmployeeDemographics SET LastName = 'Philibin' WHERE FirstName='Darryl'

--SELECT *
--FROM EmployeeDemographics
--UNION ALL
--SELECT *
--From WareHouseEmployeeDemographics
--ORDER BY EmployeeID

--SELECT EmployeeID, FirstName, Age
--FROM EmployeeDemographics
--UNION
--SELECT EmployeeID, JobTitle, Salary
--From EmployeeSalary
--ORDER BY EmployeeID

--SELECT FirstName, LastName, Age,
--CASE 
--   WHEN Age > 30 THEN 'Old'
--   WHEN Age BETWEEN 27 and 30 THEN 'Young'
--   ELSE 'Very Young'
--END
--FROM EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age


--SELECT  FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	ELSE Salary + (Salary * .03)
--END AS SalaryAfterRaise
--   FROM SQLEmployee.dbo.EmployeeDemographics 
--Join  SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT   JobTitle, COUNT (JobTitle)
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Join  SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
-- GROUP BY  JobTitle
-- HAVING COUNT (JobTitle) > 1

--SELECT   JobTitle, AVG (Salary)
--FROM SQLEmployee.dbo.EmployeeDemographics 
--Join  SQLEmployee.dbo.EmployeeSalary
--   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
-- GROUP BY  JobTitle
-- HAVING AVG (Salary) > 45000
-- ORDER BY AVG (Salary)



--UPDATE--SELECT *
--FROM EmployeeDemographics
--WHERE EmployeeID = 10 EmployeeDemographics
--SET EmployeeID = 1012 
--WHERE FirstName = 'Holly' AND LastName = 'Flax'
 
--UPDATE EmployeeDemographics
--SET Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' AND LastName = 'Flax'

--DELETE FROM EmployeeDemographics
--WHERE EmployeeID = 1005

--SELECT *
--FROM EmployeeDemographics

--SELECT FirstName AS  Fname
--FROM EmployeeDemographics

--SELECT FirstName Fname
--FROM EmployeeDemographics

--SELECT FirstName + ' ' + LastName AS FullName
--FROM EmployeeDemographics

--SELECT Avg(Age) AS AvgAge
--FROM EmployeeDemographics

--SELECT Demo.EmployeeID,Sal.Salary
--FROM EmployeeDemographics AS Demo
--JOIN EmployeeSalary AS Sal
--   ON  Demo.EmployeeID = Sal.EmployeeID

--SELECT a.EmployeeID,a.FirstName, b.JobTitle, c.Age
--FROM EmployeeDemographics a
--LEFT JOIN EmployeeSalary b
--   ON  a.EmployeeID = b.EmployeeID
--LEFT JOIN WareHouseEmployeeDemographics c
--   ON  a.EmployeeID = c.EmployeeID

--SELECT Demo.EmployeeID,Demo.FirstName, Sal.JobTitle, Ware.Age
--FROM EmployeeDemographics Demo
--LEFT JOIN EmployeeSalary Sal
--   ON  Demo.EmployeeID = Sal.EmployeeID
--LEFT JOIN WareHouseEmployeeDemographics Ware
--   ON  Demo.EmployeeID = Ware.EmployeeID

--SELECT FirstName, LastName, Gender, Salary,
--COUNT (Gender) OVER (PARTITION BY Gender) AS TotalGender
--FROM EmployeeDemographics Dem
--JOIN EmployeeSalary Sal
--  ON Dem.EmployeeID = Sal.EmployeeID

--SELECT FirstName, LastName, Gender, Salary, COUNT (Gender)
--FROM EmployeeDemographics Dem
--JOIN EmployeeSalary Sal
--  ON Dem.EmployeeID = Sal.EmployeeID
--Group By FirstName, LastName, Gender, Salary

--SELECT Gender,  COUNT (Gender)
--FROM EmployeeDemographics Dem
--JOIN EmployeeSalary Sal
--  ON Dem.EmployeeID = Sal.EmployeeID
--Group By  Gender

--WITH CTE_Employee as 
--(SELECT FirstName, LastName, Gender, Salary,
--COUNT (Gender)  OVER (PARTITION BY Gender) AS TotalGender,
--AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--  ON emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000')
--Select *
--From CTE_Employee


--WITH CTE_Employee as 
--(SELECT FirstName, LastName, Gender, Salary,
--COUNT (Gender)  OVER (PARTITION BY Gender) AS TotalGender,
--AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--  ON emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000')
--Select FirstName, AvgSalary
--From CTE_Employee

--CREATE TABLE #temp_Employee
--(
--EmployeeID int,
--JobTitle varchar(100),
--Salary int
--)

--Select *
--From #temp_Employee

--INSERT INTO #temp_Employee VALUES
--('1001','HR','45000')

--INSERT INTO #temp_Employee
--SELECT *
--FROM EmployeeSalary

--DROP TABLE IF EXISTS #temp_Employee2
--CREATE TABLE #temp_Employee2
--(
--JobTitle varchar(50),
--EmployeePerJob int,
--AvgAge int,
--AvgSalary int
--)

--Select *
--From #temp_Employee2

--INSERT INTO #temp_Employee2
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--CREATE TABLE EmployeeErrors
--(
--EmployeeID varchar(50),
--FirstName varchar(50),
--LastName varchar(50)
--)

--INSERT INTO EmployeeErrors VALUES
--('1001 ','Jimbo','Halbert'),
--(' 1002','Pamela','Beasely'),
--('1005','TObi','Flenderson-Fired')


--DROP TABLE EmployeeErrors
--UPDATE EmployeeErrors SET FirstName = 'TObi' WHERE EmployeeID = '1005'

--SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
--FROM EmployeeErrors

--SELECT *
--FROM EmployeeErrors
--SELECT *
--FROM EmployeeDemographics

--INSERT INTO EmployeeDemographics VALUES
--('1005', 'Tobi', 'Flenderson', 26, 'Male')

--SELECT LastName, REPLACE(LastName, '-Fired', '') AS LastNameFixed
--FROM EmployeeErrors

--SELECT SUBSTRING(FirstName,1,3)
--FROM EmployeeErrors
--SELECT SUBSTRING(FirstName,3,3)
--FROM EmployeeErrors

--SELECT err.FirstName, dem.FirstName
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	ON err.FirstName = dem.FirstName

--SELECT SUBSTRING( err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	ON SUBSTRING( err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)


--SELECT err.FirstName,SUBSTRING( err.FirstName,1,3), dem.FirstName,SUBSTRING(dem.FirstName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	ON SUBSTRING( err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

--SELECT FirstName, LOWER(FirstName),UPPER(FirstName)
--FROM EmployeeErrors

/* STORED RPOCEDURES*/

--CREATE PROCEDURE TEST AS
--SELECT *
--FROM EmployeeDemographics

--EXEC TEST

--CREATE PROCEDURE Temp_Employee
--AS
----DROP TABLE IF EXISTS #temp_Employee
--CREATE TABLE #temp_employee
--(
--JobTitle varchar(100),
--EmployeePerJob int,
--AvgAge int,
--AvgSalary int
--)

--INSERT INTO #temp_employee
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT *
--FROM #temp_employee

--EXEC Temp_Employee @JobTitle = 'Salesman'


 --SELECT *
 --FROM EmployeeSalary

 --SELECT EmployeeID, Salary, Avg(Salary) over () as AllAvgSalary
 --FROM EmployeeSalary
 

 --SELECT  EmployeeID, Salary, (Select Avg(Salary) From EmployeeSalary) as AllAvgSalary
 --FROM EmployeeSalary

 --SELECT EmployeeID, Salary, Avg(Salary)  as AllAvgSalary
 --FROM EmployeeSalary
 --Group by EmployeeID, Salary
 --Order by 1,2

 --SELECT EmployeeID, Salary, Avg(Salary)  as AllAvgSalary
 --FROM EmployeeSalary
 --Group by EmployeeID, Salary
 --Order by EmployeeID, Salary

 --SELECT a.EmployeeID, AllAvgSalary
 --FROM (
 --SELECT EmployeeID, Salary, Avg(Salary) over () as AllAvgSalary
 --FROM EmployeeSalary) a

 --SELECT  EmployeeID, JobTitle, Salary
 --FROM EmployeeSalary
 --WHERE EmployeeID in
 --(
	--		Select EmployeeID
	--		From EmployeeDemographics
	--		Where Age > 30
 --)