# Ad Hoc Analysis Consumer Goods

### Quick Links
  * [LinkedIn Post](https://www.linkedin.com/posts/badernader_ad-hoc-analysis-project-presentation-bader-activity-7287506774687920128-Mndz?utm_source=share&utm_medium=member_desktop)
  * [Presentation Video](https://youtu.be/O5mqlPLlE4A)
  * Presentation Files
    * [PDF](https://github.com/BaderNader321/Ad-Hoc-Insights-Consumer-Goods/blob/3f84e6d48b4226af913702bf29d8fcb055c27a7d/Solutions/Ad%20Hoc%20Analysis%20Presentation.pdf)
    * [PPT](https://github.com/BaderNader321/Ad-Hoc-Insights-Consumer-Goods/blob/3f84e6d48b4226af913702bf29d8fcb055c27a7d/Solutions/Ad%20Hoc%20Analysis%20Presentation.pptx) 

### Table of Contents
* [Company Details](#company-details)
* [Project Overview](#project-overview)
    * [Business Problem](#business-problem)
    * [Approach & Methodology](#approach-and-methodology)
    * [Insights](#insights)
    * [Queries](#queries)
    * [Technical Details](#technical-details)
    * [Key Learnings](#key-learnings)
* [Understanding the Datasets](#understanding-the-datasets)
* [Data Modelling](#data-modelling)

## Company Details

**AtliQ Hardware** is a prominent electronics accessories company that specializes in providing a wide range of high-quality hardware solutions, including connectors, cables, circuit boards, and other essential components for electronic devices and systems. They cater to both individual consumers and businesses, emphasizing quality and performance to meet the evolving needs of their customers.

#### Channels and Platforms
- **Retail Stores:** Physical locations such as Croma and Staples where customers can purchase AtliQ Hardware products.
- **Distributors:** Third-party entities like Neptune that help distribute AtliQ Hardware products to various markets.
- **Exclusive Showrooms:** Dedicated spaces, both physical and online, showcasing AtliQ Hardware products.
- **Online Platforms:** E-commerce websites and platforms such as Amazon and Walmart where customers can buy AtliQ Hardware products.

#### Customers
- **Individual Consumers:** People purchasing hardware components for personal use.
- **Businesses: Companies:** buying hardware solutions for their operations and projects, including top customers like Amazon, Neptune, Staples, and Walmart

## Project Overview

This project focuses on deriving **ad hoc business insights** using SQL and Power BI. Starting with data import and cleaning in MySQL, the analysis involved writing efficient SQL queries to uncover trends and key metrics. The results were validated, visualized in Power BI, and presented with actionable recommendations to support data-driven decision-making.

### Business Problem

Atliq Hardwares is one of the leading computer hardware producers in India and well expanded in other countries too.

However, the management noticed that they do not get enough insights to make quick and smart data-informed decisions. They want to expand their data analytics team by adding several junior data analysts. Tony Sharma, their data analytics director wanted to hire someone who is good at both tech and soft skills. Hence, he decided to conduct a SQL challenge which will help him understand both the skills.

#### Task:  

Imagine yourself as the applicant for this role and perform the following task:

1. Check ‘ad-hoc-requests.pdf’ - there are 10 ad hoc requests for which the business needs insights.
2. You need to run a SQL query to answer these requests. 
3. The target audience of this dashboard is top-level management - hence you need to create a presentation to show the insights.
4. Be creative with your presentation, audio/video presentation will have more weightage.

### Approach and Methodology

To deliver ad hoc insights using SQL, a structured and systematic approach was followed:

1. **Understanding the Project Scope:**
   The project began by clearly understanding the requirements and objectives, focusing on uncovering key insights that could drive business decisions for AtliQ GDB023.

2. **Data Import and Setup:**
   The dataset was imported into the MySQL database to enable efficient querying and data analysis. The database schema and structure were reviewed to ensure readiness for 
   analysis.

3. **Data Quality Assessment and Cleaning:**
   Thoroughly assessed the dataset for potential issues, such as missing values, duplicates, and inconsistencies. Where necessary, performed data cleaning to improve accuracy 
   and ensure the integrity of the analysis.

4. **SQL Query Development:**
   Crafted and executed SQL queries to extract meaningful insights. The queries were designed to address the specific business questions posed during the requirement analysis 
   phase.

5. **Exporting Results:**
   After deriving the required insights, the results were exported in CSV format to enable further use in reporting and visualization tools.

6. **Database Integration with Power BI:**
   Connected the SQL database “AtliQ GDB023” to Power BI, allowing dynamic visualization of insights.
   
7. **Data Validation:**
   Cross-checked the exported and visualized data against the raw database to ensure accuracy and consistency. Conducted thorough validations to confirm the reliability of 
   findings.

8. **Visualization and Reporting:**
   Utilized Power BI to create clear, compelling visualizations that communicated the insights effectively. Focused on using appropriate chart types and layouts to highlight key 
   patterns and trends.

9. **Presentation and Recommendations:**
   Prepared a detailed presentation outlining the analysis, insights, and actionable recommendations. The presentation was structured to address the specific objectives and 
   provide strategic direction for decision-making.

### Insights

1. AtliQ Exclusive operates in eight APAC markets: **Australia, Bangladesh, India, South Korea, Indonesia, Japan, New Zealand, and the Philippines**.
2. Unique product offerings increased by **36.33%** in 2021 compared to 2020. This growth highlights **rising demand** and suggests focusing on **scaling production**.
3. The **Notebook segment leads** with 129 unique products, while **Networking ranks lowest** with just 9 products.
4. The **Accessories** segment experienced the most significant growth, **adding 34 new products**. **Networking** saw the smallest increase, with **only 3 new products**.
5. The product with **highest and lowest** manufacturing cost are **AQ Home Allinl Gen 2** (PC division) at ₹240.54 and **AQ Master Wired XL Ms** (P&A division) at **₹0.89**.
6. **Flipkart, Viveks, Ezone, Croma, and Amazon** received discounts ranging from **29.33% to 30.83%**.
7. The month with **highest and lowest** gross sales are **March 2020 at Rs. 0.77M** and **November 2020 at Rs. 32.25M**. The other **major insights** from gross sales trend visual are: 
   - The spike in **September 2019** could be because of **seasonal factors** such as back-to-school shopping or holiday sales.
   - The decline in **early 2020** might be linked to the **COVID-19 pandemic** and its impact on economic activity.
   - The company might have **implemented new strategies in 2020** that led to **increased sales**.
8. The **first quarter of 2020** saw the highest sales **(7.01 million units)**, followed by a **steady decline** throughout the year.
9. **Retailer** channels dominated sales, accounting for **73.22%** of total revenue. The **Direct** channel contributed **15.47%**, and the **Distributor** channel brought in **11.31%**.
10. The top selling product by total quantity sold are:
    - **AQ Digit leads** the **PC** Division in terms of quantity sold, with a total of **17.4K units**.
    - **AQ Maxima MS** is the top-selling product in the **P & A** Division, having sold **0.42M units**.
    - **AQ Pen Drive 2 IN 1** holds the top spot in the **N & S** Division with **1.16M units** sold.

### Queries

1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

	<br>

	```SQL
	SELECT market 
	FROM dim_customer
	WHERE customer = "Atliq Exclusive" 
	  AND region = "APAC"
	GROUP BY market
	ORDER BY market;
	```

<br>

2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
   - unique_products_2020
   - unique_products_2021
   - percentage_chg
  
	<br>

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

<br>

3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields,
   - segment
   - product_count

	<br>

	```SQL
	SELECT segment, COUNT(DISTINCT product_code) AS unique_product_count 
	FROM dim_product
		GROUP BY segment	
		ORDER BY unique_product_count DESC;
	```

<br>

4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
   - segment
   - product_count_2020
   - product_count_2021
   - difference

	<br>

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

<br>

5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
   - product_code
   - product
   - manufacturing_cost
  
	<br>

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

<br>

6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output    contains these fields,
   - customer_code
   - customer
   - average_discount_percentage

	<br>

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

<br>

7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and     take strategic decisions. The final report contains these columns:
   - Month
   - Year
   - Gross sales Amount

	<br>

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

<br>

8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity,
   - Quarter 
   - total_sold_quantity

	<br>

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

<br>

9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
   - channel
   - gross_sales_mln
   - percentage

	<br>

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

<br>

10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
    - division
    - product_code
    - product
    - total_sold_quantity
    - rank_order

	<br>

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

### Technical Details



### Key Learnings



## Understanding the Datasets

Understanding what data is available will be more helpful while doing analysis. before jumping on to the analysis get good understanding of what are data available.

- **Dimension table:** It will have the static data like details of customer and products

- **Fact table:** It will have the data about the transactions  

#### gdb023

  **dim_customer**

- **27** distinct markets (ex India, USA, spain)
- **75** distinct customers thorough out the market
- **2** types of platforms
  - Brick & Motors - Physical/offline store
  - E-commerce - Online Store (Amazon, flipkart)
        
**Three channels**
 - Retailer
 - Direct
 - Distributors

 - 7 sub-zones
 - 4 regions
    - APAC
    - EU
    - nan
    - LATAM
   
**dim_product**

  - Divisions
    - P & A
      - Peripherals
      - Accessories
    - PC
      - Notebook
      - Desktop
    - N & S
      - Networking
      - Storage
    - There are 14 different categories, Like Internal HDD, keyboard
    - There are different variants available for the same product

**fact_sales_monthly**

- it track the sales of the each customer. it has:
  - date (The date were the sale is made)
  - customer_code (connected to dim_customer table)
  - product_code (connected to dim_product table)
  - fiscal year of AtliQ Hardware
  - sold_quantity (quantity sold of a particular product)

**gross_price**

  - Has the details of gross prices with product code
    
**manufacturing_cost**

  - Has the details of manufacturing cost with product code with year

**Pre_invoice_dedutions**

  - Has the details of pre invoice deductions percentage for each cutomer with year

## Data Modelling

<br>

<img src="https://github.com/BaderNader321/Ad-Hoc-Insights-Consumer-Goods/blob/3f84e6d48b4226af913702bf29d8fcb055c27a7d/Solutions/Data%20Model.png" class="center">
