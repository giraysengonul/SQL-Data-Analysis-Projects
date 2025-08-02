# 🍽️ Restaurant Order Analysis

This SQL project explores insights from a restaurant's menu and customer orders using basic and intermediate SQL queries. The analysis is divided into three parts: menu exploration, order analysis, and combined insights for business understanding.

---

## 📁 Dataset Overview

This project is based on two datasets:
- `menu_items`: Contains details of the restaurant's dishes, their categories, and prices.
- `order_details`: Contains order-level data including order IDs, item IDs, and dates.

---

## 🔍 Analysis Sections

### 1. Menu Items Analysis

- View the entire `menu_items` table.
- Count total number of menu items.
- Find the least and most expensive dishes.
- Count the number of Italian dishes.
- List the most and least expensive Italian dishes.
- Count dishes per category.
- Calculate average price per category.

### 2. Order Details Analysis

- View the entire `order_details` table.
- Determine the date range of orders.
- Count total number of unique orders.
- Count total items ordered.
- Find which orders had the most items.
- Count how many orders had more than 12 items.

### 3. Combined Analysis (Menu + Orders)

- Join `order_details` and `menu_items` tables.
- Identify most and least frequently ordered items, along with their categories.
- Find top 5 orders with the highest spending.
- Break down the category details for the highest-spending order.
- Show item categories in the top 5 highest-spending orders.

---

## 🛠️ Technologies Used

- Microsoft SQL Server
- SSMS (SQL Server Management Studio)

---

## 📊 Key Insights

- Identified popular and unpopular dishes.
- Highlighted high-value orders and customer preferences.
- Explored category-wise trends and spending behaviors.

---

## 📂 File Structure

- `01_menu_items_queries.sql`: Menu data analysis
- `02_order_details_queries.sql`: Order data analysis
- `03_combined_analysis.sql`: Combined insights using JOIN operations

---

## 📎 Usage

You can open and execute the `.sql` files using any SQL client connected to your database. Make sure your tables are named:
- `PortfolioProject..menu_items`
- `PortfolioProject..order_details`

---

## 🙋‍♂️ Author

**Giray Şengönül**  
Data Analyst | SQL | Power BI | Python  
[LinkedIn](https://www.linkedin.com/in/giray-sengonul-168420318/) | [Portfolio](https://giraysengonul.cv/) 

---

## ⭐️ Feedback

If you find this project helpful, feel free to ⭐ the repo and share your thoughts!
