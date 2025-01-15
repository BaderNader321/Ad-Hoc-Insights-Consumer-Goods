# Ad-Hoc-Insights-Consumer-Goods

### Quick Links
  * [LinkedIn Post](https://www.linkedin.com/posts/badernader_business-insight-360-activity-7264969422296031232-T1a7?utm_source=share&utm_medium=member_desktop)
  * [Presentation Video]()
  * Presentation Files
    * [PDF]()
    * [PPT]() 

### Table of Contents
* [Company Details](#company-details)
* [Project Overview](#project-overview)
    * [Business Problem](#business-problem)
    * [Approach & Methodology](#approach-and-methodology)
    * [Solutions](#solutions)
    * [Key Insights & Outcomes](#key-insights-and-outcomes)
    * [Business Related Terms](#business-related-terms)
    * [Technical Details](#technical-details)
    * [Key Learnings](#key-learnings)
* [Understanding the Datasets](#understanding-the-datasets)
* [Data Modelling](#data-modelling)

## Company Details



## Project Overview



### Business Problem



### Approach and Methodology



### Solutions
1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

```SQL
SELECT market 
FROM dim_customer
WHERE customer = "Atliq Exclusive" 
  AND region = "APAC"
GROUP BY market
ORDER BY market;
```

2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
   - unique_products_2020
   - unique_products_2021
   - percentage_chg

```SQL
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
```

3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields,
   - segment
   - product_count

```SQL
SELECT segment, COUNT(DISTINCT product_code) AS unique_product_count 
FROM dim_product
	GROUP BY segment	
	ORDER BY unique_product_count DESC;
```

4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
   - segment
   - product_count_2020
   - product_count_2021
   - difference

```SQL
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
```

5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
   - product_code
   - product
   - manufacturing_cost

```SQL
SELECT m.product_code, 
	   p.product, 
	   m.manufacturing_cost
FROM fact_manufacturing_cost m 
	JOIN dim_product p 
		USING (product_code)
WHERE manufacturing_cost IN (
		(SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost), 
        (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
	)
ORDER BY manufacturing_cost DESC;
```

6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output    contains these fields,
   - customer_code
   - customer
   - average_discount_percentage

```SQL
SELECT pid.customer_code, c.customer, 
	ROUND(AVG(pre_invoice_discount_pct), 4) AS average_discount_percentage 
FROM dim_customer c
	JOIN fact_pre_invoice_deductions pid
		USING (customer_code)
WHERE c.market = "India" AND pid.fiscal_year = 2021
	GROUP BY pid.customer_code, c.customer
	ORDER BY average_discount_percentage DESC
LIMIT 5;
```

7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and     take strategic decisions. The final report contains these columns:
   - Month
   - Year
   - Gross sales Amount

```SQL
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

-- Trying out to Format gross sales amount
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
```

8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity,
   - Quarter 
   - total_sold_quantity

```SQL
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
```

9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
   - channel
   - gross_sales_mln
   - percentage

```SQL
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
```

10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
    - division
    - product_code
    - product
    - total_sold_quantity
    - rank_order

```SQL
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
```

### Key Insights and Outcomes



### Business Related Terms 



### Technical Details



### Key Learnings



## Understanding the Datasets



## Data Modelling
