-- 1. Count total employees
select count(*) as total_employee from hr.employees;

-- 2. Count distinct job roles
select count(distinct job_id) as unique_jobs from hr.employees;

-- 3. Sum of salaries of all employees
select sum(salary) from hr.employees;

-- 4. Average salary of all employees
select avg(salary) from hr.employees;

-- 5. Minimum salary in the company
select min(salary) as min_salary from hr.employees;

-- 6. Maximum salary in the company
select max(salary) as max_salary from hr.employees;

select max(salary) as max_salary,min(salary)as min_salary from hr. employees;

-- 7. Median salary of all employees
select median(salary) from hr.employees;

-- 8. Mode of salaries
select mode() within group (order by salary) as mode_salary from hr.employees;

-- 9. Variance of salaries
select variance(salary) as salary_variance from hr.employees;

-- 10. Standard deviation of salaries
select stddev(salary) as salary_stddev from hr.employees;

-- ==============================
-- 2. Aggregate Functions with GROUP BY
-- ==============================

-- 11. Total employees per department
select department_id, count(*) as total_emp from hr.employees group by department_id;

-- 12. Total salary per department
select department_id,sum(salary) as sum_salary from hr.employees group by department_id;

-- 13. Average salary per department
select department_id, avg(salary) as avg_salary from hr.employees group by department_id;

-- 14. Minimum salary per department
select department_id, min(salary) as min_salary from hr.employees group by department_id;

-- 15. Maximum salary per department
select department_id, max(salary) as max_salary from hr.employees group by department_id;

-- 16. Count employees per job role
select job_id, count(*) as total_employees from hr.employees group by job_id;

-- 17. Departments where total salary > 100,000
select department_id, sum(salary) as total_salary from hr.employees group by department_id having sum(salary) > 100000;

-- 18. Departments where average salary > 50,000
select department_id, avg(salary) as avg_salary from hr.employees group by department_id having avg(salary) > 50000;

-- 19. Departments with more than 5 employees
select department_id, count(*) as total_employees from hr.employees group by department_id having count(*) > 5;

-- 20. Job roles with more than 10 employees
select job_id, count(*) as total_employees from hr.employees group by job_id having count(*) > 10;

