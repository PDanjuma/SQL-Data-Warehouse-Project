/*
===========================================================================================
Exploratory Data Analysis: Database Exploration
===========================================================================================

Script Purpose:
	This script performs initial exploration of the data warehouse database.
	It helps understand the structure, tables, and columns for analysis.

	The exploration include:
	- Identifying all tables in the database
	- Examining column structures and data types
	- Understanding the schema organization

Usage:
	- Run this script first to get familiar with the database structure.
	- Use the results to inform subsequent analysis queries

============================================================================================
*/

-- ==========================================================================================
-- Explore All Objects in the Database
-- ==========================================================================================

SELECT *
FROM INFORMATION_SCHEMA.TABLES

-- ==========================================================================================
-- Explore All Customer Culumns in the Database
-- ==========================================================================================

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'

-- ==========================================================================================
-- Explore All Product Culumns in the Database
-- ==========================================================================================

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_products'

-- ==========================================================================================
-- Explore All Sales Culumns in the Database
-- ==========================================================================================

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'fact_sales'
