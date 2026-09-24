#----REMOVE NULL VALUES/BLANK --------

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry='';

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry ='';

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
  on t1.company = t2.company
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
  on t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


