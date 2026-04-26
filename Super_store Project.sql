CREATE DATABASE superstore_project;
USE superstore_project;
SELECT COUNT(*) FROM samplesuperstore;
show tables;
describe samplesuperstore;
SELECT * FROM samplesuperstore LIMIT 10;

-- TOTAL SALES --
SELECT SUM(Sales) AS Total_Sales FROM samplesuperstore;

-- TOTAL PROFIT--
SELECT SUM(Profit) AS Total_Profit FROM samplesuperstore;

-- TOTAL ORDERS--
SELECT COUNT(*) AS Total_Orders 
FROM samplesuperstore;

-- sales by category--
SELECT Category, SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- profit by category--
SELECT Category, SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- sales by state--
SELECT State, SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;

-- sales by region--
SELECT Region, SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Region;

-- profit by sub-category--
SELECT 'Sub-Category', SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY 'Sub-Category'
ORDER BY Total_Profit DESC;

-- top 10 cities by sales--
SELECT City, SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- join--

CREATE TABLE sales_data AS
SELECT Category, Sales, Profit FROM samplesuperstore;

CREATE TABLE region_data AS
SELECT Region, Category FROM samplesuperstore;
show tables;

SELECT s.Category, s.Sales, r.Region
FROM sales_data s
INNER JOIN region_data r
ON s.Category = r.Category;

-- windows function--
SELECT Category, Sales,
RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM samplesuperstore;