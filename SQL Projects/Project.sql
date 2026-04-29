CREATE DATABASE HR_Analytics;
USE HR_Analytics;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    hire_date DATE,
    department_id INT,
    job_title VARCHAR(100),
    CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    salary DECIMAL(10,2),
    effective_date DATE,
    CONSTRAINT fk_emp FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


INSERT INTO Departments (department_name, location)
VALUES
('Human Resources', 'New York'),
('Finance', 'Chicago'),
('IT', 'San Francisco'),
('Marketing', 'Boston'),
('Sales', 'Los Angeles');


INSERT INTO Employees (first_name, last_name, gender, hire_date, department_id, job_title)
VALUES
('John', 'Doe', 'Male', '2018-03-15', 1, 'HR Manager'),
('Sarah', 'Smith', 'Female', '2019-07-22', 2, 'Accountant'),
('Michael', 'Brown', 'Male', '2020-01-10', 3, 'Data Engineer'),
('Emma', 'Johnson', 'Female', '2021-05-30', 4, 'Marketing Analyst'),
('David', 'Wilson', 'Male', '2017-09-18', 5, 'Sales Executive'),
('Olivia', 'Davis', 'Female', '2018-11-02', 3, 'Data Analyst'),
('James', 'Miller', 'Male', '2020-12-15', 2, 'Financial Analyst'),
('Sophia', 'Taylor', 'Female', '2022-04-09', 4, 'Content Strategist'),
('William', 'Anderson', 'Male', '2016-06-25', 5, 'Sales Manager'),
('Ava', 'Thomas', 'Female', '2023-01-12', 1, 'Recruiter');


INSERT INTO Salaries (employee_id, salary, effective_date)
VALUES
(1, 85000, '2024-01-01'),
(2, 78000, '2024-01-01'),
(3, 95000, '2024-01-01'),
(4, 67000, '2024-01-01'),
(5, 72000, '2024-01-01'),
(6, 88000, '2024-01-01'),
(7, 83000, '2024-01-01'),
(8, 60000, '2024-01-01'),
(9, 105000, '2024-01-01'),
(10, 65000, '2024-01-01');


## Show all employees with their department names and job titles.

Select e.first_name,e.last_name,e.job_title,d.Department_name 
from employees e join departments d on d.department_id=e.department_id 

## Count how many employees work in each department.

Select d.department_name,count(e.employee_id) from employees e
 join departments d on d.department_id=e.department_id 
 group by d.department_name
 
## Find the number of employees hired per year.

Select year(hire_date),count(employee_id) from employees group by year(hire_date)

## Count the total number of male and female employees.

Select gender, COUNT(*) AS total_employees
FROM Employees
GROUP BY gender;

## Find the most common job title in each department.

select d.department_name,count(e.department_id) from departments d join employees e 
on e.department_id=d.department_id group by d.department_name 
having count(e.department_id) > 1

## List employees who joined after 2020.

select first_name,last_name,year(hire_date) 
from employees where year(hire_date) > 2020

## Find the earliest and latest hire date in each department.

select d.department_name,min(e.hire_date),max(e.hire_date) from 
employees e join departments d on e.department_id=d.department_id
group by d.department_name

## Show each employee’s name, department, and salary.

select e.first_name,e.last_name,s.salary,d.department_name 
from employees e join departments d on d.department_id=e.department_id 
join salaries s on s.employee_id=e.employee_id


## Find the average salary in each department.

select d.department_name,round(avg(s.salary)) as average_salary from departments d join employees e on
e.department_id=d.department_id join salaries s on 
s.employee_id=e.employee_id group by d.department_name

## Find the highest and lowest salary in each department.

select d.department_name,min(s.salary),max(s.salary) from departments d join employees e on
e.department_id=d.department_id join salaries s on 
s.employee_id=e.employee_id group by d.department_name

## Find which departments pay above the average salary.

SELECT 
    d.department_name,
    ROUND(AVG(s.salary), 2) AS avg_department_salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Salaries s ON s.employee_id = e.employee_id
GROUP BY d.department_name
HAVING AVG(s.salary) > (SELECT AVG(salary) FROM Salaries)
ORDER BY avg_department_salary DESC;

## List the top 5 highest-paid employees with their department and job title.

select e.first_name,e.last_name,e.job_title,d.department_name,sum(s.salary) as Highest_paid from departments d join employees e on
e.department_id=d.department_id join salaries s on 
s.employee_id=e.employee_id group by d.department_name,
e.first_name,e.last_name,e.job_title order by sum(s.salary) desc limit 5

## Compare the average salary by gender.

select e.gender,round(avg(s.salary)) from employees e join 
salaries s on s.employee_id=e.employee_id group by e.gender

## Calculate the total salary expense per department.

SELECT d.department_name,SUM(s.salary) AS total_salary_expense FROM departments d
JOIN employees e ON d.department_id = e.department_id JOIN salaries s ON e.employee_id = s.employee_id 
GROUP BY d.department_name ORDER BY total_salary_expense DESC;

## Rank departments by average salary (highest to lowest).

select d.department_name,rank() over(order by avg(salary) desc) as highest_average_salary from departments d
JOIN employees e ON d.department_id = e.department_id JOIN salaries s 
ON e.employee_id = s.employee_id group by d.department_name

## Rank departments by employee count.

SELECT department_name,COUNT(employee_id) AS employee_count,RANK() OVER (ORDER BY COUNT(employee_id) DESC) AS 
department_rank FROM employees e JOIN departments d ON e.department_id = d.department_id GROUP BY department_name;





