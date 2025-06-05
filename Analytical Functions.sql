-- 21. Assign row numbers to employees ordered by salary
select employee_id, salary, row_number() over (order by salary desc) as row_no from hr.employees;

-- 22. Rank employees by salary
select employee_id, salary, rank() over (order by salary desc) as rank_no from hr.employees;

-- 23. Dense rank employees by salary
select employee_id, salary, dense_rank() over (order by salary desc) as drank_no from hr.employees;

-- 24. Divide employees into 4 salary quartiles
select employee_id, salary, ntile(4) over (order by salary desc) as quartile from hr.employees;

-- 25. Get previous salary for each employee
select employee_id, salary, lag(salary) over (order by salary) as lag_salary from hr.employees;

-- 26. Get next salary for each employee
select employee_id, salary, lead(salary) over (order by salary) as led_salary from hr.employees;

-- 27. First salary in the ordered set
select employee_id, salary, first_value(salary) over (order by salary) as first_salary from hr.employees;

-- 28. Last salary in the ordered set
select employee_id, salary, last_value(salary) over(order by salary rows between unbounded preceding and unbounded following) as high_salary from hr.employees;

-- 29. Calculate cumulative distribution of salaries
select employee_id, salary, cume_dist() over(order by salary) as commulative_distribution from hr.employees;

-- 30. Calculate percentage rank of salaries
select employee_id, salary, percent_rank() over (order by salary) as percentile from hr.employees;

-- =========================================
--  ORDER BY with Aggregate and Analytical Functions
-- =========================================

-- 31. Employees sorted by salary in descending order
select employee_id, first_name, salary from hr.employees order by salary desc;

-- 32. Employees sorted by department and salary
select employee_id, first_name, department_id, salary from hr.employees order by department_id asc, salary desc;

-- 33. Employees sorted by last name alphabetically
select employee_id, first_name, last_name from hr.employees order by last_name asc;

-- 34. Employees sorted by hire date
select employee_id, first_name, hire_date from hr.employees order by hire_date asc;

-- 35. Employees sorted by length of first name
select employee_id, first_name from hr.employees order by length(first_name) asc;

-- 36. Employees sorted by last two characters of last name
select employee_id, first_name, last_name from hr.employees order by substr(last_name, -2) asc;

-- 37. Employees with IT_PROG job role first
select employee_id, first_name, job_id from hr.employees order by case when job_id = 'IT_PROG' then 1 else 2 end;

-- 38. Employees sorted by highest salary ratio
select department_id, max(salary) / avg(salary) as salary_ratio from hr.employees group by department_id having max(salary) / avg(salary) > 1.5 order by salary_ratio desc;

-- 39. Employees sorted by highest commission first
select employee_id, first_name, commission_pct from hr.employees order by commission_pct desc nulls last;

-- 40. Employees sorted by salary, keeping those with no commission at the bottom
select employee_id, first_name, salary, commission_pct from hr.employees order by case when commission_pct is null then 2 else 1 end, salary desc;

