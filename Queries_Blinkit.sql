select * from Blinkit_Grocery;

UPDATE Blinkit_Grocery
SET Item_Fat_Content =
CASE
WHEN item_fat_content = 'LF' THen 'Low Fat'
WHEN Item_Fat_Content = 'low fat' THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE item_fat_content
END;


-- Find the total Revenue.
SELECT ROUND(SUM(total_sales)/1000000,3) AS Revenue_in_Mn from Blinkit_Grocery;

-- Find The average sales
SELECT ROUND(AVG(Blinkit_Grocery.Total_Sales),1) as Average_Sales FROM Blinkit_Grocery;

-- Number of items
SELECT COUNT(*) As Number_of_Items FROM Blinkit_Grocery;

-- Average of Rating
SELECT ROUND(AVG(Rating),2) AS Average_Rating FROM Blinkit_Grocery;


-- Avg Sales, Total sales, Count, Avg rating By "Fat_content"
SELECT Blinkit_Grocery.Item_Fat_Content, 
		ROUND(SUM(total_sales),2) AS Revenue ,
		ROUND(AVG(total_sales),2) AS Avg_Revenue,
		ROUND(AVG(rating),2) AS Avg_rating,
		COUNT(*) AS No_of_items
FROM Blinkit_Grocery
GROUP BY Item_Fat_Content;

-- Avg Sales, Total sales, Count, Avg rating By "Item_Type"
SELECT Blinkit_Grocery.Item_Type,
		ROUND(SUM(total_sales),2) AS Revenue,
		ROUND(AVG(total_sales),2) AS Avg_Revenue,
		ROUND(AVG(rating),2) AS Avg_Rating,
		COUNT(*) AS No_of_Items
FROM blinkit_grocery
GROUP BY Item_type
ORDER BY Revenue DESC;

-- Fat content by outlet by total sales
SELECT item_fat_content, outlet_location_type,
		ROUND(SUM(total_sales),2) AS Revenue
FROM blinkit_grocery
GROUP BY Item_Fat_Content, Outlet_Location_Type
ORDER BY Revenue DESC;

-- Total Sales  by outlet establishment
SELECT outlet_establishment_year, SUM(Total_sales) AS Revenue
FROM blinkit_grocery
GROUP BY outlet_establishment_year
ORDER BY Outlet_Establishment_Year ;

-- Percentage of sales by outlet size
SELECT outlet_size, SUM(Total_sales),
ROUND(((SUM(total_sales)/
(SELECT SUM(Total_sales) as Revenue_Overall FROM Blinkit_Grocery))*100),2) AS Revenue_percentage
FROM Blinkit_Grocery
GROUP BY Outlet_Size
ORDER BY Revenue_percentage DESC
;

-- Sales by outlet location
SELECT Blinkit_Grocery.Outlet_Location_Type, ROUND(SUM(total_sales),2) AS Revenue
FROM Blinkit_Grocery
GROUP BY Outlet_Location_Type
ORDER BY Revenue
;

-- All metrics by outlet type
SELECT Blinkit_Grocery.Outlet_Type,
		ROUND(SUM(total_sales),2) AS Revenue,
		ROUND(AVG(total_sales),2) AS Avg_Revenue,
		ROUND(AVG(rating),2) AS Avg_Rating,
		COUNT(*) AS No_of_Items
FROM blinkit_grocery
GROUP BY Outlet_Type
ORDER BY Revenue DESC;
