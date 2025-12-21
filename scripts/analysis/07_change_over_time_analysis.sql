/*
==========================================================================================
Exploratory Data Analysis: Change over time Analysis
==========================================================================================

Script Purpose:
	This script tracks how sales, customers, and quantities change over time.
	It shows yearly and monthly trends to identify growth patterns and seasonality.

Usage:
	- Compare performance across different years.
	- Identify which months have highest/lowest sales.
	- Track customer growth and product demand over time.

==========================================================================================
*/

-- =======================================================================================
-- Calculate the total sales, total customers and total quantity per year
-- =======================================================================================
SELECT
	YEAR(order_date) AS order_year,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date) ASC;

-- =======================================================================================
-- Calculate the total sales, total customers and total quantity per month
-- =======================================================================================
SELECT
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date) ASC;
ORDER BY MONTH(order_date) ASC;












