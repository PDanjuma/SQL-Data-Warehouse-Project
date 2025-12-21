/*
==========================================================================================
Exploratory Data Analysis: Ranking Analysis
==========================================================================================

Script Purpose:
	This script ranks data to find top and bottom performers.
	It identifies best and worst products, and most valuable customers.

	The analysis includes:
	- Top 5 revenue-generating products.
	- Bottom 5 worst-performing products.
	- Top 10 customers with highest revenue..
	- Customers with fewest orders.

Usage:
	- Find star products vs. low performing products.
	- Identify VIP customers for retention.
	- Discover customers with low engagement.

==========================================================================================
*/


-- ============================================================================
-- Which 5 Products generate the highest revenue
-- ============================================================================
SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS rank_products
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- ============================================================================
-- What are the 5 worst-performing products in terms of sales
-- ============================================================================
SELECT TOP 5
	product_name,
	SUM(f.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) ASC) AS rank_products
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY product_name
ORDER BY total_revenue ASC;

-- ============================================================================
-- Find the top 10 customers who have generated the highest revenue
-- ============================================================================
SELECT TOP 10
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC;

-- ============================================================================
-- The 3 customers with the fewest orders placed
-- ============================================================================
SELECT TOP 3
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC;
