/*
==========================================================================================
Exploratory Data Analysis: Part-to-whole Analysis
==========================================================================================

Script Purpose:
	This scripts analyzes category contribution to overall sales by calculating each
	category's total sales and its percentage of total company sales.

Usage:
	- Identify which categories contributes the most to overall sales.
	- Calculates percentage contribution of each category.
	- Rank categories by their sales performance.

===========================================================================================
*/

-- =========================================================================================
-- Which category contribute the most to overall sales
-- =========================================================================================
SELECT
	category,
	total_sales,
	SUM(total_sales) OVER() AS overall_sales,
	CONCAT(ROUND(CAST(total_sales AS FLOAT) / SUM(total_sales) OVER() * 100, 2), '%') AS percentage_of_total
FROM
(
SELECT
	category,
	SUM(sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY category
)t
ORDER BY percentage_of_total DESC;
