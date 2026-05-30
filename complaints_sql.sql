-- Consumer Financial Protection Bureau (CFPB) USA --
-- CFPB Consumer Complaint Jan & Feb 2023 Analysis --

-- USE consumer_complaints;
-- Total No of complaints: 2275

-- Q1.Count complaints for each product.
-- Result: Done
-- Insight: Highest no of complaints for 
-- product: Checking or savings account | Complains: 1029

-- SELECT 
-- 	product, COUNT(*) AS total_complaints
-- FROM  complaints
-- GROUP BY product
-- ORDER BY total_complaints DESC;

-- ======================================================
-- Q2.Find top 5 states with highest complaints.
-- Result: CA: 491 | FL: 237 | TX: 180 | NY: 155 | GA: 99.
-- SELECT 
-- 	state, count(*) AS counts
-- FROM complaints
-- GROUP BY state
-- ORDER BY counts DESC
-- LIMIT 5;

-- Insight: States with top major isssues
-- SELECT 
-- 	state, product, issue, COUNT(*) AS counts,
--     SUM(count(*)) OVER(PARTITION BY state) AS total_complaints
-- FROM complaints
-- GROUP BY state, product, issue
-- ORDER BY total_complaints DESC, counts DESC
-- ;


-- ========================================================
-- Q3.Show complaints(issues) submitted via each channel.
-- channel	|	complaints
-- Web		|	1972
-- Phone	|	169
-- Referral	|	97
-- Postal mail|	20
-- Web Referral|17
-- WITH cte AS (		-- just practicing cte
-- SELECT
-- 	submitted_via, issue
-- FROM complaints)

-- SELECT
-- 	*,COUNT(*) AS counts,
--     SUM(COUNT(*)) OVER(PARTITION BY submitted_via) AS total_complaints
-- FROM cte
-- GROUP BY submitted_via, issue
-- ORDER BY total_complaints DESC, counts DESC;


-- ======================================================
-- Q4.Count complaints where response was not timely.
-- Result: No timely response: 273 | Toatl complains: 2275

-- SELECT 
-- 	timely_response, COUNT(*) AS Y_N_counts,
--     SUM(COUNT(*)) OVER() as total_complaints
-- FROM complaints
-- GROUP BY timely_response
-- ORDER BY Y_N_counts DESC; -- for over all lookup


-- =========================================================
-- Q5. Which product has highest complaints?
-- Result: Checking or savings account | 1029

-- SELECT 
-- 	product, count(*) AS total_complains
-- FROM complaints
-- GROUP BY product
-- ORDER BY total_complains DESC;


-- ======================================================
-- Q6.Find top 4 most common issues.
-- Issue				| complaints
-- Managing an account	|	544
-- Opening an account	| 190
-- Incorrect information on your report	| 148
-- Closing an account	| 138
-- SELECT 
-- 	issue, COUNT(*) AS total_complains
-- FROM complaints
-- GROUP BY issue
-- ORDER BY total_complains DESC
-- LIMIT 4;


-- ============================================
-- Q7.Show issue count for each product.

-- SELECT
-- 	product, COUNT(*) as total_issues
-- FROM complaints
-- GROUP BY product
-- ORDER BY total_issues DESC;

-- SELECT
--     product,
--     COUNT(DISTINCT issue) AS unique_issues
-- FROM complaints
-- GROUP BY product; -- tells which product have how may issue types


-- ===============================================================
-- Q8.Find products having multiple sub-products.
-- "DISTINCT" with count:
-- Insight: Highest sub product count is for product: Money transfer, virtual currency, or money service | 10

-- SELECT
-- 	product,
-- 	COUNT(DISTINCT sub_product) AS sub_product_count
-- FROM complaints
-- GROUP BY product
-- HAVING COUNT(DISTINCT sub_product) > 1
-- ORDER BY sub_product_count DESC;


-- ==========================================
-- Q9.Which state has highest complaints for each product?
-- Result: State: CA | 491

-- SELECT
-- 	state, count(*) AS total_complaints
-- FROM complaints
-- GROUP BY state
-- ORDER BY total_complaints DESC;

-- Find states with poor timely response rates.
-- Result:  Poor timely reponse in 
-- State: CA | 64 | total delayed responces: 273

-- SELECT
-- 	state, COUNT(*) AS delayed_responses,
--     SUM(COUNT(*)) OVER() AS total_delayed_responses
-- FROM complaints
-- WHERE timely_response = 'No'
-- GROUP BY state
-- ORDER BY delayed_responses DESC;


-- ==============================================================
-- Q10.Compare Jan vs Feb complaints by state.
-- Results: sate CA had maximum complaints both months
-- Month	|complaints |complaints per day
-- January  | 1183	 	| 38.1613
-- February | 1092 		| 39.0000

-- SELECT
-- 	MONTHNAME(date_submitted) AS month_name, COUNT(*) AS monthly_complaints
-- FROM complaints
-- GROUP BY month_name
-- ORDER BY monthly_complaints DESC;

-- SELECT   -- tells complaints per day
--     MONTHNAME(date_submitted) AS month_name,
--     COUNT(*) AS total_complaints,
--     COUNT(*) / DAY(LAST_DAY(MIN(date_submitted))) AS complaints_per_day
-- FROM complaints
-- GROUP BY month_name;

-- SELECT
-- 	state, MONTHNAME(date_submitted) AS month_name, 
--     COUNT(*) AS monthly_complaints,
--     SUM(COUNT(*)) OVER(PARTITION BY state) AS state_complaints
-- FROM complaints
-- GROUP BY state, month_name
-- ORDER BY state_complaints DESC, monthly_complaints DESC;

-- Hilighting those complaints that too more then 2 days to receive
-- SELECT 
-- 	product, issue, days_to_receive, company_response,
--     SUM(COUNT(*)) OVER(PARTITION BY product) AS total_complaints
-- FROM complaints
-- WHERE days_to_receive > 2
-- GROUP BY product, issue, company_response, days_to_receive
-- ORDER BY total_complaints DESC, days_to_receive DESC;
-- SELECT * FROM complaints;