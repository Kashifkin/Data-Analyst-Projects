## 🧑‍💼 HR Analytics SQL Project
## 📌 Overview

This project is an HR Analytics Database Management and Analysis System built using MySQL. The project focuses on managing employee, department, and salary data while performing SQL-based analytical queries to generate meaningful HR insights.

The database helps analyze:

Employee distribution
Department performance
Salary analysis
Hiring trends
Gender diversity
Workforce analytics

## 🎯 Project Objectives

Design a relational HR database
Manage employee and salary records
Perform HR data analysis using SQL queries
Generate workforce and salary insights
Apply advanced SQL concepts for business analysis

## 🛠️ Technologies Used
MySQL
SQL
Relational Database Management System (RDBMS)

## 🗂️ Database Structure

The project contains three main tables:

## 🏢 Departments Table

Stores department-related information:

Department ID
Department Name
Location

## 👨‍💼 Employees Table

Stores employee details:

Employee ID
Employee Name
Gender
Hire Date
Department ID
Job Title

## 💰 Salaries Table

Stores employee salary records:

Salary ID
Employee ID
Salary
Effective Date

## 🔗 Database Relationships
department_id connects Employees with Departments
employee_id connects Salaries with Employees
Foreign key constraints ensure data integrity

## 🧹 Database Operations Performed
Database creation
Table creation
Primary key implementation
Foreign key constraints
Data insertion
SQL joins
Aggregate functions
Window functions
Grouping and filtering

## 📊 SQL Analysis Performed

## 👥 Employee Analysis
Displayed all employees with department names and job titles
Counted employees in each department
Analyzed hiring trends by year
Counted male and female employees
Listed employees hired after 2020
Identified earliest and latest hires per department

## 💵 Salary Analysis
Displayed employee salaries with department information
Calculated average salary per department
Identified highest and lowest salary by department
Compared average salary by gender
Calculated department-wise salary expenses
Identified departments paying above average salaries

## 🏆 Ranking & Advanced Analysis
Ranked departments by average salary
Ranked departments by employee count
Identified top 5 highest-paid employees
Used SQL window functions for ranking analysis

## 📈 Key Insights
IT and Sales departments showed higher salary distributions.
Salary differences existed across departments and job roles.
Gender-based salary comparison provided workforce diversity insights.
Some departments had significantly higher employee counts.
Hiring trends revealed employee growth patterns over the years.

## 🚀 Business Problems Solved
Centralized employee and salary management
Improved HR reporting and analytics
Simplified workforce analysis
Enabled salary benchmarking across departments
Supported data-driven HR decision-making

## 🧠 SQL Concepts Demonstrated
SELECT Statements
INNER JOIN
GROUP BY
ORDER BY
HAVING Clause
Aggregate Functions
Window Functions
Foreign Keys
Ranking Functions
Subqueries

## 📌 Features of the Project
Relational database design
HR analytics reporting
Employee salary analysis
Department performance tracking
Advanced SQL querying
Data integrity management

## ✅ Conclusion

This project demonstrates strong SQL and database management skills through the creation of a complete HR Analytics system. The project showcases practical use of SQL for workforce analysis, salary insights, and business reporting while applying real-world relational database concepts and analytical querying techniques.
