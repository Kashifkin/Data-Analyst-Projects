## 📊 Sales SQL Analysis Project README

## 📌 Project Overview

This project focuses on Sales Data Analysis using SQL.
The dataset was imported into a MySQL database and analyzed using SQL queries to uncover valuable business insights such as:

Revenue generation by category
Customer demographics
Monthly revenue trends
Top-performing customers
Profit analysis
Category rankings using SQL Window Functions

The project demonstrates practical SQL skills for business intelligence, reporting, and sales analytics.

🛠️ Technologies Used
🗄️ MySQL
💻 SQL
📊 Analytical Queries
📁 CSV Data Import
🗂️ Database Setup
📥 Create Database

CREATE DATABASE Sales;
USE Sales;

##  📂 Import CSV File

The sales dataset was imported into the database table:

SELECT * FROM Sales_Data;

📊 SQL Analysis Performed

## 💰 1. Highest Revenue Generating Category

This query identifies which product category generated the highest total revenue.

SELECT 
    category, 
    SUM(`Total Revenue`) AS Highest_Revenue
FROM Sales_Data
GROUP BY category
ORDER BY Highest_Revenue DESC;

📈 Insight

Helps identify the most profitable business category.

## 👥 2. Average Customer Age by Gender

This query calculates the average customer age for each gender.

SELECT 
    gender, 
    ROUND(AVG(age)) AS Average_Age
FROM Sales_Data
GROUP BY gender;

📈 Insight
Useful for customer demographic analysis.

## 📅 3. Total Revenue Per Month

This query shows monthly revenue trends.

SELECT 
    Month, 
    SUM(`Total Revenue`) AS Monthly_Revenue
FROM Sales_Data
GROUP BY Month;

📈 Insight
Helps analyze seasonal sales performance.

## 🏆 4. Top 5 Customers by Total Sales

This query identifies the highest spending customers.

SELECT 
    customer_id, 
    SUM(total_sale) AS Highest_Sales
FROM Sales_Data
GROUP BY customer_id
ORDER BY Highest_Sales DESC
LIMIT 5;

📈 Insight
Helps identify loyal and high-value customers.

## 💹 5. Profit Per Category

This query calculates category-wise profit.

SELECT 
    category, 
    SUM(total_sale - cogs) AS profit
FROM Sales_Data
GROUP BY category;

📈 Insight
Evaluates profitability across categories.

## 🥇 6. Top 3 Revenue-Contributing Categories Per Month

This query uses CTE + Window Functions to rank categories monthly.

WITH monthly_category_revenue AS (
    SELECT 
        Month,
        category,
        SUM(`Total Revenue`) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Month 
            ORDER BY SUM(`Total Revenue`) DESC
        ) AS rn
    FROM Sales_Data
    GROUP BY Month, category
)

SELECT 
    Month,
    category,
    revenue
FROM monthly_category_revenue
WHERE rn <= 3
ORDER BY Month, revenue DESC;

📈 Insight
Identifies best-performing categories every month.

## 🏅 7. Top 3 Categories by Total Sales

This query ranks categories according to total sales using SQL ranking functions.

SELECT 
    category, 
    total_sale, 
    rank_category
FROM (
    SELECT 
        category,
        SUM(total_sale) AS total_sale,
        RANK() OVER (
            ORDER BY SUM(total_sale) DESC
        ) AS rank_category
    FROM Sales_Data
    GROUP BY category
) t
WHERE rank_category <= 3;

📈 Insight
Highlights the strongest business categories overall.

🧠 SQL Concepts Used
✅ Aggregate Functions
SUM()
AVG()
COUNT()
✅ Window Functions
RANK()
ROW_NUMBER()
✅ Common Table Expressions (CTE)
WITH clause
✅ Grouping & Sorting
GROUP BY
ORDER BY
✅ Filtering
LIMIT
📊 Key Business Insights

✔️ Identified top-performing product categories
✔️ Analyzed customer demographics
✔️ Tracked monthly revenue growth
✔️ Detected high-value customers
✔️ Measured category profitability
✔️ Ranked categories using advanced SQL functions

📁 Project Structure
Sales_SQL_Project/
│
├── Sales_Data.csv
├── sales_analysis.sql
├── README.md
🚀 Future Improvements
📊 Build Power BI / Tableau Dashboard
📈 Add Sales Forecasting
🧠 Perform Customer Segmentation
🔍 Add Advanced KPI Metrics
⚡ Optimize Queries for Large Datasets
🎯 Learning Outcomes

Through this project, you will learn:

SQL Data Analysis
Business Reporting Queries
Revenue & Profit Analysis
Window Functions
CTE Usage
Real-world Sales Analytics
⭐ Conclusion

This SQL Sales Analysis project demonstrates how SQL can be used to extract meaningful business insights from raw sales data. It covers beginner to intermediate SQL concepts and provides practical experience in sales analytics and reporting.
