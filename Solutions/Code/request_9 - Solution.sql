-- Solution to the Request 9

/*
Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
-- channel
-- gross_sales_mln
-- percentage
*/

WITH formatted_gross_sales_amount AS (
	SELECT c.channel, 
		ROUND(SUM(gross_price * sold_quantity), 2) AS gross_sales_amount 
	FROM fact_sales_monthly s 
	JOIN fact_gross_price g
		ON s.product_code = g.product_code
		AND s.fiscal_year = g.fiscal_year
	JOIN dim_customer c
		ON s.customer_code = c.customer_code
	WHERE s.fiscal_year = 2021
		GROUP BY c.channel
		ORDER BY gross_sales_amount DESC
)
SELECT channel, 
	CONCAT(FORMAT(gross_sales_amount / 1000000, 2), " M") AS gross_sales_in_mln,
    CONCAT(FORMAT(gross_sales_amount / SUM(gross_sales_amount) OVER() * 100, 2), "%") AS percentage
FROM formatted_gross_sales_amount;
