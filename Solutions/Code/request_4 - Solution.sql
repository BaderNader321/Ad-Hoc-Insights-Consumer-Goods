-- Solution to the Request 4

/*
Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
- segment
- product_count_2020
- product_count_2021
- difference
*/
WITH cte_2020 AS (
	SELECT p.segment, COUNT(DISTINCT s.product_code) AS unique_product_2020
	FROM dim_product p 
		JOIN fact_sales_monthly s 
			USING (product_code)
	WHERE s.fiscal_year = 2020
		GROUP BY segment  
), cte_2021 AS (
	SELECT p.segment, COUNT(DISTINCT s.product_code) AS unique_product_2021
	FROM dim_product p 
    JOIN fact_sales_monthly s 
		USING (product_code)
	WHERE s.fiscal_year = 2021
		GROUP BY segment
)
SELECT segment, unique_product_2020, unique_product_2021,
	(unique_product_2021 - unique_product_2020) AS difference
FROM cte_2020 
	JOIN cte_2021 
		USING (segment)
ORDER BY segment;