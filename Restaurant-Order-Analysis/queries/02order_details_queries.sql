
-- 1. View the order_details table.

Select *
from PortfolioProject..order_details


-- 2. What is the data range of the table?

Select MIN(order_date), MAX(order_date)
From PortfolioProject..order_details


-- 3. How many orders were made within this date range?

Select COUNT(Distinct order_id)
From PortfolioProject..order_details


-- 4. How many items were ordered within this date range?

Select COUNT(*)
From PortfolioProject..order_details


-- 5. Which orders had the most number of items?

Select order_id, Count(item_id) AS num_items
From PortfolioProject..order_details
Group By order_id
Order By num_items DESC


-- 6. How many orders had more than 12 items?

Select *
From 
(Select order_id, Count(item_id) AS num_items
From PortfolioProject..order_details
Group By order_id) AS num_orders
Where num_items > 12