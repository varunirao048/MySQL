#-------STANDARDIZE THE DATA---------


SELECT company,TRIM(company)
FROM layoffs_staging2;

update layoffs_staging2
set company = TRIM(company);

SELECT DISTINCT industry
from layoffs_staging2
order by 1;

SELECT *
FROM layoffs_staging2
WHERE industry like 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry like 'Crypto%';

UPDATE layoffs_staging2
SET country = 'United States'
WHERE country LIKE 'United States%';

#OR

SELECT DISTINCT country,TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country )
WHERE country LIKE 'United States%';

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;
