/*
==========================================================================================
Exploratory Data Analysis: Cumulative Analysis
==========================================================================================

Script Purpose:
	This script calculates the running totals and moving average over time.
	It shows cumulative sales growth and average price trend.

Usage:
	- Track cumulative revenue to see total sales growth over time.
	- Use moving averages to identify pricing trends.
	- Monitor how metrics accumulate across different periods.

==========================================================================================
*/

-- ====================================================================================
-- Calculate the total sales and average price per year
-- and the running total of sales and moving average of sales over time
-- =====================================================================================
SELECT
	order_date,
	total_sales,
	avg_price,
	SUM(total_sales) OVER(ORDER BY order_date ASC) AS running_total_sales,
	AVG(avg_price) OVER(ORDER BY order_date ASC) AS moving_average
FROM
(
SELECT
	DATETRUNC(year, order_date) AS order_date,
	SUM(sales_amount) AS total_sales,
	AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
)t












  
)t
