## Importing CSV file in Database
create database Sales;
use Sales;
select * from Sales_Data;

## Which category generated the highest total revenue?
SELECT 
    category, SUM(`Total Revenue`) AS Highest_Revenue
FROM
    Sales_Data
GROUP BY category
ORDER BY Highest_Revenue DESC;

## Find the average age of customers for each gender.
SELECT 
    gender, ROUND(AVG(age)) AS Average_Age
FROM
    Sales_Data
GROUP BY gender

## Calculate total revenue per month. 

SELECT 
    Month, SUM(`Total Revenue`) AS Monthly_Revenue
FROM
    Sales_Data
GROUP BY Month;

## Find the top 5 customers by total_sale.

SELECT 
    customer_id, SUM(total_sale) AS Highest_Sales
FROM
    Sales_Data
GROUP BY customer_id
ORDER BY Highest_Sales DESC
LIMIT 5

## Calculate profit per category.

SELECT 
    category, SUM(total_sale - cogs) AS profit
FROM
    Sales_Data
GROUP BY category


## Find the top 3 categories contributing the most to revenue for each month.

WITH monthly_category_revenue AS (
    SELECT 
        Month,
        category,
        SUM(`Total Revenue`) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY Month ORDER BY SUM(`Total Revenue`) DESC) AS rn
    FROM Sales_Data
    GROUP BY Month, category
)
SELECT 
    Month,
    category,
    revenue
FROM monthly_category_revenue
WHERE rn <= 3
ORDER BY Month, revenue DESC limit 3;



## Top 3 Categories according to Total Sales.

select category, total_sale, rank_category
from (
    select category,
           sum(total_sale) as total_sale,
           rank() over (order by sum(total_sale) desc) as rank_category
    from Sales_Data
    group by category
) t
where rank_category <= 3;
 by category





