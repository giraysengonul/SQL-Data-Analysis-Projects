# COVID-19 Data Analysis with SQL

This project is an exploratory SQL analysis of the global impact of the COVID-19 pandemic. The data comes from [Our World in Data](https://ourworldindata.org/coronavirus), and includes two main datasets: **CovidDeaths** and **CovidVaccinations**.

## 🎯 Objective

- Analyze global trends in cases, deaths, and vaccinations
- Calculate death rates and infection rates relative to population
- Track vaccination progress over time
- Extract meaningful insights using SQL queries

---

## 📁 Datasets Used

- **CovidDeaths**: Includes daily confirmed cases, deaths, and population data by location  
- **CovidVaccinations**: Contains vaccination-related data, including daily new vaccinations

> Records where `continent` is NULL are excluded to focus only on country-level data.

---

## 📊 Analyses Performed

### 1. Total Cases vs Total Deaths
- Calculated death percentages by comparing total cases and total deaths
- Focused analysis on specific countries like Turkey

### 2. Total Cases vs Population
- Calculated what percentage of each country's population was infected
- Identified countries with the highest infection rate relative to their population

### 3. Death Counts by Country and Continent
- Ranked countries by total deaths
- Compared total deaths by continent

### 4. Global Summary Statistics
- Calculated total cases, deaths, and overall global death rate

### 5. Vaccination Progress
- Analyzed daily and cumulative vaccination numbers
- Tracked rolling totals of vaccinated people using window functions

---

## 🧠 SQL Skills Applied

- **JOINs** to combine datasets  
- **Window Functions** (`OVER`, `PARTITION BY`) for cumulative calculations  
- **Common Table Expressions (CTEs)** to simplify complex queries  
- **Temporary Tables** to store and manipulate interim results  
- **Views** to save reusable queries for future visualizations  
- **Filtering and Grouping** for summarizing large datasets

---

## 📌 About the Developer

**Giray Şengönül**  
iOS Developer turned Data Analyst, passionate about data-driven insights.  
📫 giraysengonul@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/giray-sengonul-168420318/) | 🌐 [Portfolio Website](https://giraysengonul.cv/)

---

> This project was created to practice real-world SQL analysis and demonstrate analytical thinking using COVID-19 data.
