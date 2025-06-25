-- Step 1: Display the entire dataset for review
SELECT * 
FROM world_life_expectancy;

-- Step 2: Find duplicated rows based on (Country + Year)
-- We use ROW_NUMBER() to identify duplicates (rows > 1)
SELECT * 
FROM(
	SELECT Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
	FROM world_life_expectancy
) AS Row_Table
WHERE row_num > 1;

-- Step 3: Delete duplicate rows based on Row_ID
DELETE FROM world_life_expectancy
WHERE Row_ID IN (
	SELECT Row_ID
	FROM (
		SELECT Row_ID,
		CONCAT(Country, Year),
		ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
		FROM world_life_expectancy
	) AS Row_Table
	WHERE row_num > 1
);

-- Step 4: Check unique values in the Status column (excluding empty)
SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> '';

-- Step 5: Find countries labeled as 'Developing'
SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing';

-- Step 6: Fill missing 'Status' values with 'Developing' for certain countries
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN (
	SELECT * 
	FROM (
		SELECT DISTINCT(Country)
		FROM world_life_expectancy
		WHERE Status = 'Developing'
	) AS Temp
);

-- Step 7: Find entries where 'Status' is empty
SELECT * 
FROM world_life_expectancy
WHERE Status = '';

-- Step 8: Fill missing 'Status' values with 'Developed' for certain countries
UPDATE world_life_expectancy
SET Status = 'Developed'
WHERE Country IN (
	SELECT * 
	FROM (
		SELECT DISTINCT(Country)
		FROM world_life_expectancy
		WHERE Status = 'Developed'
	) AS Temp
);

-- Step 9: Identify rows where Status is NULL
SELECT * 
FROM world_life_expectancy
WHERE Status IS NULL;

-- Step 10: Estimate missing 'Life expectancy' values
-- Using the average of the previous and next year's values for the same country
SELECT t1.Country, t1.Year, t1.`Life expectancy`,
       t2.`Life expectancy` AS t2_Life_expectancy,
       t3.`Life expectancy` AS t3_Life_expectancy,
       ROUND((t2.`Life expectancy` + t3.`Life expectancy`) / 2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2 ON t1.Country = t2.Country AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3 ON t1.Country = t3.Country AND t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = '';

-- Step 11: Update missing 'Life expectancy' using the average of neighboring years
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2 ON t1.Country = t2.Country AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3 ON t1.Country = t3.Country AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`) / 2,1)
WHERE t1.`Life expectancy` = '';
