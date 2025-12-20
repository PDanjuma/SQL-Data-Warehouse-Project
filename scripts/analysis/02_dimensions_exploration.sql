/*
===========================================================================================
Exploratory Data Analysis: Dimensions Exploration
===========================================================================================

Script Purpose:
	This script explores the dimension tables in the gold layer of the data warehouse.
	It analyzes customer and product dimensions to understand and distribution,
	unique values, and data quality.

	The exploration covers:
	- Customer geographical distribution(countries).
	- Product categorization and hierarchy. 
	- Distinct values and data patterns.

Usage:
	- Use these queries to understand dimension cardinality.
	- Identify data quality issues before creating reports.

============================================================================================
*/

-- ==========================================================================================
-- Explore all countries our customers come from
-- ==========================================================================================

SELECT DISTINCT country
FROM gold.dim_customers 
ORDER BY country;

-- ==========================================================================================
-- Explore all product categories, subcategories and product names
-- ==========================================================================================

SELECT DISTINCT 
    	category,
    	subcategory,
    	product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
