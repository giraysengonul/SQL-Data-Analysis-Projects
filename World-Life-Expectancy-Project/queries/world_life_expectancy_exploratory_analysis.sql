-- Step 1: View the full cleaned dataset (baseline check)
SELECT * 
FROM world_life_expectancy;

-- Step 2: Calculate the increase in life expectancy for each country
-- over the observed time period (15 years)
SELECT Country, 
       MIN(`Life expectancy`), 
       MAX(`Life expectancy`),
       ROUND((MAX(`Life expectancy`) - MIN(`Life expectancy`)),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
   AND MAX(`Life expectancy`) <> 0
ORDER BY Life_Increase_15_Years ASC;

-- Step 3: Calculate the global average life expectancy per year
-- This shows the overall trend of life expectancy over time
SELECT Year,
       ROUND(AVG(`Life expectancy`),2) AS Avg_Life_Expectancy
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;

-- Step 4: Compare average life expectancy and GDP for each country
-- This can help identify if GDP correlates with higher life expectancy
SELECT Country,
       ROUND(AVG(`Life expectancy`),1) AS Life_Exp,
       ROUND(AVG(GDP)) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0 
   AND GDP > 0 
ORDER BY GDP ASC;

-- Step 5: Compare life expectancy between countries with high vs low GDP
-- GDP threshold used: 1500
SELECT 
    SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
    AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) AS High_GDP_Life_Expectancy,
    SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
    AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) AS Low_GDP_Life_Expectancy
FROM world_life_expectancy;

-- Step 6: Calculate average life expectancy by country development status
-- (Developed vs Developing)
SELECT Status,
       ROUND(AVG(`Life expectancy`),1) AS Avg_Life_Expectancy
FROM world_life_expectancy
GROUP BY Status;

-- Step 7: Count countries per status and average their life expectancy
-- Gives insight into how many countries fall under each status
SELECT Status,
       COUNT(DISTINCT(Country)) AS Country_Count,
       ROUND(AVG(`Life expectancy`),1) AS Avg_Life_Expectancy
FROM world_life_expectancy
GROUP BY Status;

-- Step 8: Analyze the relationship between BMI and life expectancy
-- for each country. Useful for checking public health trends.
SELECT Country,
       ROUND(AVG(`Life expectancy`),1) AS Life_Exp,
       ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0 
   AND BMI > 0 
ORDER BY BMI DESC;

-- Step 9: Create a rolling total of adult mortality per country
-- to observe how mortality trends evolve over time
SELECT Country,
       Year,
       `Life expectancy`,
       `Adult Mortality`,
       SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy;
