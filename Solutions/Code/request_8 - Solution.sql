-- Solution to the Request 8

/*
In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
- Quarter
- total_sold_quantity
*/

WITH calculated_fiscal_month AS (
	SELECT *, 
		MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) AS fiscal_month
	FROM fact_sales_monthly
		WHERE fiscal_year = 2020
), calculated_quarter_column AS (
	SELECT *,
		CASE
			WHEN fiscal_month IN (1, 2, 3) THEN "Q1"
			WHEN fiscal_month IN (4, 5, 6) THEN "Q2"
			WHEN fiscal_month IN (7, 8, 9) THEN "Q3"
			WHEN fiscal_month IN (10, 11, 12) THEN "Q4"
		END AS quarter
	FROM calculated_fiscal_month
)
SELECT quarter, 
	SUM(sold_quantity) AS total_quantity_sold
FROM calculated_quarter_column
	GROUP BY quarter
	ORDER BY total_quantity_sold DESC;