/*
==========================================================================================
Exploratory Data Analysis: Measures Exploration
==========================================================================================

Script Purpose:
	This script looks at important business measures in the data warehouse.
	It calculates basic metrics to understand how big the business is.

	The exploration includes:
	- Financial metrics (total sales, average price)
	- Volume metrics (quantity sold, number of orders) 
	- Counts (total products, customers, active customers)
	- Summary of all key business numbers.

Usage:
	- Use these queries to get basic business numbers.
	- Understand the overall scale of business operations.
	- Validate data completeness across fact and dimension tables.

==========================================================================================
*/

-- =======================================================================================
-- Find the Total Sales
-- ========================================================================================
SELECT
	SUM(sales_amount) AS total_sales
FROM gold.fact_sales

  -- ========================================================================================
-- Find the average selling price
-- =========================================================================================
SELECT
	AVG(price) AS avg_price
FROM gold.fact_sales
  
--=========================================================================================
-- Find how many items are sold
-- ========================================================================================
SELECT
	SUM(quantity) AS total_quantity
FROM gold.fact_sales

-- =========================================================================================
-- Find the Total number of orders
-- ==========================================================================================
SELECT
	COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales

-- ==========================================================================================
-- Find the total number of products
-- ===========================================================================================
SELECT
	COUNT(product_name) AS total_product
FROM gold.dim_products

-- ===========================================================================================
-- Find the total number of customers
-- ===========================================================================================
SELECT
	COUNT(customer_key) AS total_customers
FROM gold.dim_customers

-- ============================================================================================
-- Find the total number of customers that has placed an order
-- ============================================================================================
SELECT
	COUNT(DISTINCT customer_key)
FROM gold.fact_sales

-- =============================================================================================
-- Generate a Report that shows all key metrics of the business
-- ==============================================================================================
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' AS measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' AS measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total num. Orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total num. Products' AS measure_name, COUNT(product_name) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total num. Customers' AS measure_name, COUNT(customer_key) AS measure_value FROM gold.dim_customers
