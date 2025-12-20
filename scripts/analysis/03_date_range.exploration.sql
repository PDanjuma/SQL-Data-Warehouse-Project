/*
==========================================================================================
Exploratory Data Analysis: Date Exploration
==========================================================================================

Script Purpose:
	This script explores the time-related aspect of the data warehouse by analyzing
	date range in both transaction data (fact_sales) and customer data (dim_customers).

	The exploration includes:
	- Order date ranges (first and last orders in the dataset).
	- Time span of business operations in years. 
	- Customer age demographics (young and oldest customers).
	- Customer age calculations based on birthdate.

Usage:
	- Use these queries to understand time-related aspect of the data.
	- Identify the time period covered by sales transactions.
	- Validate date data quality and identify potential outliers.

==========================================================================================
*/

-- =======================================================================================
-- Find the date of the first and last order
-- How many years gap betweeen the first order date and last order date
-- ========================================================================================

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_year
FROM gold.fact_sales

-- ==========================================================================================
-- Find the youngest and the oldest customer
-- ==========================================================================================

SELECT
	MIN(birthdate) AS oldest_birthdate,
	DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
	MAX(birthdate) AS youngest_birthdate,
	DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers
