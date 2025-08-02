
-- 1. View the menu_items table.

Select * 
From PortfolioProject..menu_items


-- 2. Find the number of items on the menu.

Select COUNT(*)
From PortfolioProject..menu_items



-- 3. What are the least and most expensive items on the menu.

Select *
From PortfolioProject..menu_items
Order By price

Select *
From PortfolioProject..menu_items
Order By price Desc


-- 4. How many Italian dishes are on the menu?

Select COUNT(*)
From PortfolioProject..menu_items
Where category = 'Italian'


-- 5. What are the least and most expensive Italian dishes on the menu?

Select *
From PortfolioProject..menu_items
Where category = 'Italian'
Order By price 

Select *
From PortfolioProject..menu_items
Where category = 'Italian'
Order By price Desc


-- 6. How many dishes are in each category?

Select category, COUNT(menu_item_id)
From PortfolioProject..menu_items
Group By category


-- 7. What is the average dish price within each category?

Select category, ROUND(AVG(price),2) AS avg_price
From PortfolioProject..menu_items
Group By category

