SELECT * FROM 
"Business_Questions" 
Limit 10;



-- 1 . Which department has the highest employee attrition rate?

SELECT 
    "Department",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM "Business_Questions"
GROUP BY "Department"
ORDER BY attrition_rate DESC
LIMIT 1;


-- 2. Which JobRole has the highest average MonthlyIncome?

SELECT 
    "JobRole",
    ROUND(AVG("MonthlyIncome"), 2) AS average_income
FROM "Business_Questions"
GROUP BY "JobRole"
ORDER BY average_income DESC
LIMIT 1;

-- 3. What is the attrition rate based on Gender and MaritalStatus?

SELECT 
    "Gender",
    "MaritalStatus",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM "Business_Questions"
GROUP BY "Gender", "MaritalStatus"
ORDER BY attrition_rate DESC;


--- 4. Does OverTime have an impact on employee attrition?

SELECT 
    "OverTime",
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM "Business_Questions"
GROUP BY "OverTime"
ORDER BY attrition_rate DESC;


--- 5. Which AgeGroup has the highest number of employees who left?

SELECT 
    "AgeGroup",
    COUNT(*) AS employees_left
FROM "Business_Questions"
WHERE "Attrition" = 'Yes'
GROUP BY "AgeGroup"
ORDER BY employees_left DESC
LIMIT 1;


--- 6. Which department has the highest average JobSatisfaction and EnvironmentSatisfaction?

SELECT 
    "Department",
    ROUND(AVG("JobSatisfaction"), 2) AS avg_job_satisfaction,
    ROUND(AVG("EnvironmentSatisfaction"), 2) AS avg_environment_satisfaction
FROM "Business_Questions"
GROUP BY "Department"
ORDER BY 
    avg_job_satisfaction DESC,
    avg_environment_satisfaction DESC
LIMIT 1;


--- 7. How does MonthlyIncome vary across JobLevel and TotalExperience(Years)?

SELECT 
    "JobLevel",
    "TotalExperience(Years)",
    COUNT(*) AS employees,
    ROUND(AVG("MonthlyIncome"), 2) AS average_income
FROM "Business_Questions"
GROUP BY "JobLevel", "TotalExperience(Years)"
ORDER BY "JobLevel", "TotalExperience(Years)";


--- 8. Which employees have not received a promotion for the longest time?

SELECT 
    "EmpID",
    "JobRole",
    "Department",
    "YearsSincePromotion",
    "TotalExperience(Years)",
    "MonthlyIncome"
FROM "Business_Questions"
ORDER BY "YearsSincePromotion" DESC
LIMIT 10;

--- 9. Rank departments based on their average MonthlyIncome.

SELECT 
    "Department",
    ROUND(AVG("MonthlyIncome"), 2) AS average_income,
    RANK() OVER (
        ORDER BY AVG("MonthlyIncome") DESC
    ) AS department_rank
FROM "Business_Questions"
GROUP BY "Department"
ORDER BY department_rank;

--- 10. What factors are commonly associated with employees who left?

SELECT 
    "OverTime",
    "JobSatisfaction",
    "WorkLifeBalance",
    "DistanceFromHome(KM)",
    "TotalExperience(Years)",
    COUNT(*) AS employees_left
FROM "Business_Questions"
WHERE "Attrition" = 'Yes'
GROUP BY 
    "OverTime",
    "JobSatisfaction",
    "WorkLifeBalance",
    "DistanceFromHome(KM)",
    "TotalExperience(Years)"
ORDER BY employees_left DESC;




