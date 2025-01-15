-- Solution to the Request 2

/*
What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
- unique_products_2020 
- unique_products_2021 
- percentage_chg 
*/

WITH unique_product_count_2020 AS (
	SELECT COUNT(DISTINCT product_code) AS product_count_2020 
	FROM fact_sales_monthly 
    WHERE fiscal_year = 2020
), unique_product_count_2021 AS (
	SELECT COUNT(DISTINCT product_code) AS product_count_2021 
	FROM fact_sales_monthly 
    WHERE fiscal_year = 2021
)
SELECT product_count_2020 AS unique_products_2020, 
	   product_count_2021 AS unique_products_2021, 
	   ROUND((product_count_2021 - product_count_2020) * 100 / product_count_2020, 2) AS percentage_chg
FROM unique_product_count_2020, 
	 unique_product_count_2021;