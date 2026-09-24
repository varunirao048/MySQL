#------layoffs_staging- -------

#REMOVING DUPLICATE RECORDS
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,stage, country,funds_raised_millions) AS row_num
FROM layoffs_staging


#--Output will have row number listed as 1 if row number>1 then thats  a duplicate record

)
SELECT *
FROM duplicate_cte
WHERE row_num>1;


#----Delete statement won't work on CTEs so let's create a new table with row_number column and then delete the ones greater than 1
-- CREATE TABLE `layoffs_staging2` (
--   `company` varchar(100) DEFAULT NULL,
--   `location` varchar(100) DEFAULT NULL,
--   `industry` varchar(100) DEFAULT NULL,
--   `total_laid_off` int DEFAULT NULL,
--   `percentage_laid_off` decimal(4,2) DEFAULT NULL,
--   `date` varchar(50) DEFAULT NULL,
--   `stage` varchar(100) DEFAULT NULL,
--   `country` varchar(100) DEFAULT NULL,
--   `funds_raised_millions` int DEFAULT NULL,
--   `row_num` int
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,stage, country,funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1 ;

DELETE
FROM layoffs_staging2
WHERE row_num >1 ;

SELECT *
FROM layoffs_staging2;

