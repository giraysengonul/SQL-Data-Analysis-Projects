# 🌍 World Life Expectancy Project

This project is a structured SQL-based analysis on global life expectancy data using **MySQL**. It focuses on **data cleaning** and **exploratory data analysis (EDA)** to extract insights from the dataset.

---

## 🧼 Data Cleaning Steps

The dataset initially contained duplicates, missing values, and inconsistent `Status` labels. The following cleaning steps were applied:

- ✅ **Removed duplicates** using `ROW_NUMBER()` over `(Country, Year)`
- ✅ **Standardized 'Status' values** (e.g., correcting blank entries)
- ✅ **Imputed missing `Life expectancy` values** using a 2-year average from previous and following years
- ✅ Validated cleaned entries using filtered queries

📌 Example:
```sql
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2 ON t1.Country = t2.Country AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3 ON t1.Country = t3.Country AND t1.Year = t3.Year + 1
SET  t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`) / 2,1)
WHERE t1.`Life expectancy` = '';

```


📊 Exploratory Data Analysis (EDA)
After cleaning the data, various analyses were performed, such as:

📈 Life expectancy change over 15 years per country

📊 Global average life expectancy trend by year

💸 GDP vs Life expectancy correlations

🏥 BMI and Adult Mortality metrics analysis

🌐 Life expectancy by development status (Developed vs Developing)

```sql
SELECT Country,
MIN(`Life expectancy`), 
MAX(`Life expectancy`),
ROUND((MAX(`Life expectancy`) - MIN(`Life expectancy`)),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
ORDER BY Life_Increase_15_Years ASC;
```

💡 Key Insights
Countries with higher GDP tend to have significantly higher life expectancy.

Developing countries show a more rapid increase in life expectancy over time.

BMI and adult mortality have observable correlations with life expectancy trends.


🛠️ Tools Used
- MySQL – for writing and executing SQL queries

- SQL Window Functions – e.g., ROW_NUMBER(), OVER()

- Data cleaning & transformation techniques


📂 How to Use

1- Import the dataset into your MySQL environment (e.g., using MySQL Workbench).

2- Run the SQL files in the queries/ folder:

- world_life_expectancy_data_cleaning.sql

- world_life_expectancy_exploratory_analysis.sql

3- Visualize or further explore the insights as needed.


📜 License

- This project is licensed under the MIT License. Feel free to use or modify it for learning or portfolio purposes.

🤝 Connect

- If you found this project helpful or want to collaborate, feel free to connect on LinkedIn or check out more on my GitHub profile.