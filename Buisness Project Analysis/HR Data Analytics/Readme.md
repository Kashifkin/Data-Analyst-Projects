# HR Analytics Dashboard

## Project Overview

This project focuses on analyzing HR data to understand employee demographics, attrition, job roles, departments, salaries, experience, and other workforce-related factors.

The project includes Exploratory Data Analysis (EDA), ETL using Python, SQL business insights, and an interactive Power BI dashboard.

## Dashboard Preview

<img width="1120" height="632" alt="HR Analytics Dashboard" src="https://github.com/user-attachments/assets/7c6ae2c8-2852-420b-ab3f-047d5bfb2939" />



## Tools and Technologies

- Python
- Pandas
- NumPy
- PostgreSQL
- SQL
- Power BI

## Project Workflow

CSV Dataset → EDA → Data Cleaning & Transformation → Feature Engineering → PostgreSQL → SQL Business Insights → Power BI Dashboard

## Exploratory Data Analysis

The EDA includes:

- Dataset overview and data types
- Descriptive statistics
- Missing value analysis
- Duplicate value analysis
- Age analysis
- Monthly income analysis
- Employee experience analysis
- High-income employee analysis
- Outlier detection using IQR
- Correlation analysis between age and income

## ETL Process

### Extract

- Loaded the HR dataset from a CSV file using Pandas.

### Transform

- Handled missing values.
- Created ExperienceGroup based on employee experience.
- Created AgeCategory based on employee age.
- Performed data transformation and analysis.

### Load

- Exported the transformed data into a new CSV file.
- Loaded the processed data into PostgreSQL.

## SQL Business Insights

SQL was used to answer important HR business questions and generate insights related to:

- Employee attrition
- Department-wise analysis
- Job role analysis
- Salary analysis
- Employee demographics
- Age and experience
- Business travel
- Workforce trends

## Power BI Dashboard

The HR Analytics Dashboard provides insights into:

- Total Employees
- Attrition Rate
- Average Monthly Salary
- Average Age
- Employees by Age Group and Gender
- Attrition Rate by Age
- Attrition Rate by Job Role
- Attrition Rate by Department

The dashboard also includes filters for:

- Gender
- Marital Status
- Business Travel
- Department





