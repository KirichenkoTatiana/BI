SELECT * FROM world_layoffs.layoffs;

-- Removing Duplicates--
-- Data Standardization --
-- Null/blank values --
-- Removing extra columns--

CREATE TABLE layoffs_backup AS TABLE layoffs;
 -- 2 way 
 -- CREATE TABLE  layoffs_backup AS SELECT * FROM layoffs;
 
 alter table layoffs rename column date to Date_lay;

ALTER TABLE layoffs ADD COLUMN temp_date DATE;

SET SQL_SAFE_UPDATES = 0;
 UPDATE layoffs SET temp_date = STR_TO_DATE(Date_lay, '%m/%d/%Y');
SET SQL_SAFE_UPDATES = 1;

 ALTER TABLE layoffs DROP COLUMN Date_lay;
ALTER TABLE layoffs CHANGE COLUMN temp_date date DATE;

ALTER TABLE layoffs
MODIFY COLUMN date DATE AFTER percentage_laid_off;

CREATE TABLE layoffs_staging AS TABLE layoffs;

SELECT * FROM layoffs_staging;



SELECT * ,
row_number() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off,'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;



WITH duplicates_CTE AS
(
SELECT * ,
row_number() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off,'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicates_CTE
WHERE row_num > 1;

WITH duplicates_CTE AS
(
SELECT * ,
row_number() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off,'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE
FROM duplicates_CTE
WHERE row_num > 1;

CREATE TABLE `world_layoffs`.`layoffs_staging2` (
`company` text,
`location`text,
`industry`text,
`total_laid_off` INT,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`funds_raised_millions` int,
row_num INT
);

SELECT * FROM layoffs_staging2;

INSERT INTO `world_layoffs`.`layoffs_staging2`
(`company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
`row_num`)
SELECT `company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		world_layoffs.layoffs_staging;

DELETE
 FROM layoffs_staging2
 where row_num > 1;        
        
SELECT *
 FROM layoffs_staging2
 where row_num > 1;
 
 

  
  SELECT company, TRIM(company)
  FROM layoffs_staging2 ;
  
  UPDATE layoffs_staging2 
  SET company = TRIM(company);
  
  SELECT distinct industry
  FROM layoffs_staging2
  ORDER BY 1;
  


UPDATE layoffs_staging2 
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

  
  SELECT distinct country, TRIM(TRAILING '.' FROM country)
  FROM layoffs_staging2 ;

UPDATE layoffs_staging2 
SET country =TRIM(TRAILING '.' FROM country) 
;

  SELECT *
  FROM layoffs_staging2
  WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
   ON t1.company = t2.company
   AND t1.location=t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE  layoffs_staging2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
   ON t1.company = t2.company
   AND t1.location=t2.location
SET t1.industry  = t2.industry 
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

  SELECT *
  FROM layoffs_staging2
  WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
  
  DELETE
  FROM layoffs_staging2
  WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
SELECT *
FROM layoffs_staging2;
  
SELECT max(total_laid_off), max(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
Group by company
ORDER BY 2 DESC;

SELECT MIN(date), MAX(date)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
Group by industry
ORDER BY 2 DESC;

SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
Group by YEAR(date)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
Group by stage
ORDER BY 1 DESC;

SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
Group by company
ORDER BY 1;

SELECT substring(date,1,7) AS 'MOUNTH', SUM(total_laid_off)
FROM layoffs_staging2
WHERE  substring(date,1,7) is not null
Group by MOUNTH
ORDER BY 1;

WITH Rolling_Total AS
(
SELECT substring(date,1,7) AS 'MOUNTH', SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE  substring(date,1,7) is not null
Group by MOUNTH
ORDER BY 1
)
SELECT MOUNTH,total_off, SUM(total_off) OVER(ORDER BY MOUNTH) as rolling_total
FROM  Rolling_Total;

SELECT company, YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
Group by company,YEAR(date)
ORDER BY 3 DESC;

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
Group by company,YEAR(date)
)
SELECT *, DENSE_RANK() OVER (partition by years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY Ranking ASC;



WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;


-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;

-- now use it in a CTE so we can query off of it
WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;