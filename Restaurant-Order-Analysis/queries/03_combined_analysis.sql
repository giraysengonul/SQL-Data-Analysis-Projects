
-- 1. Combine the menu_items and order_details tables into a single table.

Select * 
From PortfolioProject..order_details od
LEFT JOIN PortfolioProject..menu_items mi
	ON od.item_id = mi.menu_item_id


-- 2. What were least and most ordered items? What categories were they in?

Select mi.item_name, mi.category, COUNT(od.order_details_id) AS num_purchases 
From PortfolioProject..order_details od
LEFT JOIN PortfolioProject..menu_items mi
	ON od.item_id = mi.menu_item_id
Group By mi.item_name, mi.category
Order By num_purchases Desc



-- 3. What were top orders that spent the most money?

Select Top 5 od.order_id, SUM(mi.price) AS total_sepend
From PortfolioProject..order_details od
LEFT JOIN PortfolioProject..menu_items mi
	ON od.item_id = mi.menu_item_id
Group By od.order_id
Order By total_sepend Desc


-- 4. View the details of the order with the highest spend amount. Find the highest spend amount for orders with order_id 440 by grouping them.

Select mi.category, COUNT(od.item_id) AS num_items
From PortfolioProject..order_details od
LEFT JOIN PortfolioProject..menu_items mi
	ON od.item_id = mi.menu_item_id
Where od.order_id = 440
Group By mi.category


-- 5. View the details of the top 5 highest spend orders.

Select od.order_id,mi.category, COUNT(od.item_id) AS num_items
From PortfolioProject..order_details od
LEFT JOIN PortfolioProject..menu_items mi
	ON od.item_id = mi.menu_item_id
Where od.order_id IN(440,2075,1957,330,2675)
Group By od.order_id,mi.category