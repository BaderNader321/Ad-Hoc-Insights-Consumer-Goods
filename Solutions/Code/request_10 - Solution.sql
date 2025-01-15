-- Solution to the Request 10

/*
Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
division
product_code
product
total_sold_quantity
rank_order
*/

WITH top_3_products AS (
	SELECT p.division, s.product_code, p.product, 
		SUM(s.sold_quantity) AS total_quantity_sold, 
		DENSE_RANK() OVER(PARTITION BY p.division ORDER BY SUM(s.sold_quantity) DESC) AS rank_order
	FROM fact_sales_monthly s 
    JOIN dim_product p 
    USING (product_code)
    WHERE fiscal_year = 2021
		GROUP BY p.division, s.product_code, p.product
		ORDER BY p.division ASC, total_quantity_sold DESC
)
SELECT * 
FROM top_3_products
WHERE rank_order <= 3;