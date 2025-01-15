-- Solution to the Request 7

/*
Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
- Month
- Year
- Gross sales Amount
*/

SELECT MONTH(date) AS month, YEAR(date) AS year,
	ROUND(SUM((s.sold_quantity * g.gross_price)), 2) AS gross_sales_amount
FROM fact_sales_monthly s
JOIN fact_gross_price g 
	ON s.product_code = g.product_code
	AND s.fiscal_year = g.fiscal_year
JOIN dim_customer c
	ON s.customer_code = c.customer_code
WHERE customer = "AtliQ Exclusive"
	GROUP BY year, month
	ORDER BY year, month;


-- Trying out this code 'Formatting gross sales amount'
WITH formatted_sales_amount AS (
	SELECT MONTH(date) AS month, YEAR(date) AS year,
		ROUND(SUM((s.sold_quantity * g.gross_price)), 2) AS gross_sales_amount
	FROM fact_sales_monthly s
	JOIN fact_gross_price g 
		ON s.product_code = g.product_code
		AND s.fiscal_year = g.fiscal_year
	JOIN dim_customer c
		ON s.customer_code = c.customer_code
	WHERE customer = "AtliQ Exclusive"
		GROUP BY year, month
		ORDER BY year, month
)
SELECT month, year, 
	CASE 
        WHEN gross_sales_amount >= 1000000 THEN 
            CONCAT(FORMAT(gross_sales_amount / 1000000.0, 2), 'M')
        WHEN gross_sales_amount >= 1000 THEN
            CONCAT(FORMAT(gross_sales_amount / 1000.0, 2), 'K')
        ELSE
            FORMAT(gross_sales_amount, 2)
	END AS gross_sales_amount_in_millions
FROM formatted_sales_amount;