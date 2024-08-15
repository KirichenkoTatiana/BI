SELECT * 
FROM employee_demographics;
SELECT * 
FROM employee_salary;
SELECT first_name, last_name, birth_date
FROM employee_demographics;
SELECT distinct first_name, gender
FROM employee_demographics;
SELECT * 
FROM employee_salary
Where first_name = 'Leslie';
SELECT * 
FROM employee_salary
Where salary> 50000;
SELECT * 
FROM employee_demographics
Where (gender = 'Male'
AND birth_date > '1985-01-01') or age > 35;
SELECT * 
FROM employee_demographics
Where birth_date LIKE '1989%';

SELECT gender, AVG(age), MAX(age)
FROM employee_demographics
group by gender;
SELECT occupation, salary
FROM employee_salary
group by occupation, salary;

SELECT *
FROM employee_demographics
ORDER BY first_name asc;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation Like '%manager%'
group by occupation
HAVING AVG(salary)> 60000 ;

SELECT *
FROM employee_demographics
Order by age desc
LIMIT 3,1;

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40;

SELECT * 
FROM employee_demographics;
SELECT * 
FROM employee_salary;

SELECT dem.employee_id, dem.first_name, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
;

SELECT dem.employee_id, dem.first_name, age, occupation
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
;

SELECT *
FROM employee_salary  emp1
JOIN employee_salary  emp2
	ON emp1.employee_id  =emp2.employee_id
   
    ;
    
    
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
INNER JOIN parks_departments AS dp
	ON sal.dept_id = dp.department_id
;

SELECT *
FROM parks_departments;

SELECT age, gender
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Female' as Label
From employee_demographics
WHERE gender != 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid' as Label
From employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;


SELECT first_name,trim(first_name), substring(birth_date,6,2) , left(first_name,4), length(first_name), upper(last_name), lower(last_name)
From employee_demographics
order by 2;

SELECT first_name, replace(first_name, 'C', 'k')
From employee_demographics
;
SELECT first_name, locate('An', first_name)
From employee_demographics
;

SELECT first_name, last_name, CONCAT(first_name,' ', last_name) AS full_name
From employee_demographics
;

SELECT first_name, last_name, age,
CASE 
	WHEN age<=30 THEN 'Y' 
    WHEN age BETWEEN 31 and 55 THEN 'M' 
    WHEN age> 55 THEN 'R'
END
From employee_demographics
;

SELECT first_name, last_name, salary,
CASE
	WHEN salary <= 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE 
	WHEN dept_id = 6 THEN salary * 0.1
END AS Bonus
From employee_salary
;

SELECT *
From employee_demographics
WHERE employee_id IN 
					(
                    SELECT employee_id
                    From employee_salary
                    WHERE dept_id = 1
                    )
;

SELECT first_name, salary, AVG(salary)
From employee_salary
GROUP BY first_name, salary
;


SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
From employee_salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
From employee_demographics
Group by gender;

Select *, AVG(max_age)
FROM 
(
SELECT gender, AVG(age), MAX(age) as max_age, MIN(age), COUNT(age)
From employee_demographics
Group by gender
) AS Agg_table
Group by gender
;

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(partition by gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
;


SELECT dem.first_name, dem.last_name, gender, salary, SUM(salary) OVER(partition by gender order by dem.employee_id) AS Rolling_Total
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
 ROW_NUMBER() OVER(partition by gender order by salary desc) as row_num,
 RANK() OVER(partition by gender order by salary desc) as rank_num,
  Dense_RANK() OVER(partition by gender order by salary desc) as dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON  dem.employee_id =sal.employee_id
;

WITH CTE_Salary_samp AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal , MIN(salary) min_sal, COUNT(salary) count_sal
From employee_demographics dem
Join employee_salary sal
	ON dem.employee_id=sal.employee_id
Group by gender
)
SELECT AVG(avg_sal)
FROM CTE_Salary_samp
;

WITH CTE_Salary_samp (Gender,Avg_sal, Max_sal, Min_sal, Count_sal)  AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal , MIN(salary) min_sal, COUNT(salary) count_sal
From employee_demographics dem
Join employee_salary sal
	ON dem.employee_id=sal.employee_id
Group by gender
)
SELECT *
FROM CTE_Salary_samp
;

SELECT AVG(avg_sal)
FROM 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal , MIN(salary) min_sal, COUNT(salary) count_sal
From employee_demographics dem
Join employee_salary sal
	ON dem.employee_id=sal.employee_id
Group by gender
) sal_subquery
;


WITH CTE_Q AS
(
SELECT employee_id, gender, birth_date
From employee_demographics 
Where birth_date > '1985-01-01'
),
CTE_Q2 AS
(
SELECT employee_id , salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Q
JOIN CTE_Q2
	ON CTE_Q.employee_id =CTE_Q2.employee_id
;


CREATE TEMPORARY TABLE temp_table
( first_name varchar(50),
last_name varchar(50),
info varchar(100)
);

Select *
From temp_table;

INSERT INTO temp_table
VALUES
('Leslie', 'Knope', 'Riga'),
('Tom', 'Haverford', 'Vienna'),
('April', 'Ludgate','Sigulda'),
('Jerry', 'Gergich', 'Tallinn')
;

CREATE TEMPORARY TABLE salary_over_50K
select *
From employee_salary
Where salary >=50000;

Select *
From  salary_over_50K;

SELECT *
From parks_and_recreation.employee_salary
WHERE salary>=50000;

use  parks_and_recreation;

SELECT *
From employee_salary
WHERE salary>=50000;

CREATE PROCEDURE large_salaries()
SELECT *
From employee_salary
WHERE salary>=50000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	From employee_salary
	WHERE salary>=50000;
	SELECT *
	From employee_salary
	WHERE salary>=10000;
END $$
DELIMITER $$ ;

USE `parks_and_recreation`;
DROP procedure IF EXISTS `new_procedure2`;

DELIMITER $$
USE `parks_and_recreation`$$
CREATE PROCEDURE new_procedure2(employee_id_requested INT)
BEGIN
SELECT salary
	From employee_salary
	WHERE employee_id  = employee_id_requested ;

END$$
DELIMITER ;

CALL new_procedure2(1);

-- TRIGGERS AND EVENT

SELECT * 
FROM employee_demographics;
SELECT * 
FROM employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Drop trigger  employee_insert;
USE `parks_and_recreation`;
INSERT INTO parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(13, 'Jean-Ralphio', 'Superstein', 'Exntertainment 720 CEO', 200000, NULL);

-- Event retirment

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW variables LIKE 'event%';