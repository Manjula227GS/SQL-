-- STRING FUNCTION:=

-- 21. Convert the first name to uppercase
SELECT UPPER(first_name) FROM hr.employees;

-- 22. Convert the last name to lowercase
SELECT LOWER(last_name) FROM hr.employees;

-- 23. Concatenate first and last names
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM hr.employees;
select first_name || '--' || last_name from hr.EMPLOYEES;

-- 24. Find the length of first name
SELECT LENGTH(first_name) FROM hr.employees;

-- 25. Trim spaces from the first name
SELECT TRIM(first_name) FROM hr.employees;

-- 26. Find the first three characters of the last name
SELECT SUBSTR(last_name, 1, 3) FROM hr.employees;

-- 27. Replace all instances of 'a' with 'A' in first names
SELECT REPLACE(first_name, 'a', 'A') FROM hr.employees;

-- 28. Locate the position of 'a' in the first name
SELECT POSITION('a' IN first_name) FROM hr.employees;

-- 29. Repeat the first name three times
SELECT REPEAT(first_name, 3) FROM hr.employees;

-- 30. Reverse the last name
SELECT REVERSE(last_name) FROM hr.employees;

-- DATE or TIME BASE FUNCTION:=

-- 31. Get the current date
select current_date from hr.EMPLOYEES;

-- 32. Get the current timestamp
select current_timestamp from hr.EMPLOYEES;

-- 33. Extract the year from hire_date
select extract(year from hire_date) from hr.EMPLOYEES;

-- 34. Extract the month from hire_date
select extract(month from hire_date) from hr.EMPLOYEES;

-- 35. Extract the day from hire_date
select extract(day from hire_date) from hr.EMPLOYEES;

-- 36. Add 1 year to hire_date
select hire_date, hire_date + interval '1' year from hr.EMPLOYEES;

-- 37. Subtract 6 months from hire_date
-- select hire_date, hire_date - interval '6 months' FROM hr.EMPLOYEES;

-- 38. Find the difference in days between hire_date and current date
select hire_date, current_date - hire_date as difference_in_days from hr.EMPLOYEES;

-- 39. Format the hire_date as 'YYYY-MM-DD'
select to_char(hire_date, 'YYYY-MM-DD') from hr.employees;

-- 40. Find employees hired in the last 30 days
select * from hr.employees where hire_date >= (current_date - interval '30 days');

-- CONDITIONAL FUNCTION

-- 41. Select employees with 'Manager' in the job title and mark them as 'Senior' or 'Junior'
select first_name,last_name,
    case 
        when job_id like '%Manager%' then 'Senior'
        else 'Junior'
    end as employee_level
from hr.employees;

-- 42. Use COALESCE to display 'No Commission' if commission_pct is NULL
SELECT first_name, last_name, COALESCE(commission_pct, 'No Commission') FROM hr.employees;

-- 43. Use NULLIF to return NULL when salary equals 50000
select first_name,last_name, salary, nullif(salary, 50000) from hr.employees;

-- 44. Use GREATEST to find the highest value among salary and commission
select first_name, last_name, greatest(salary,commission_pct) from hr.employees;

-- 45. Use LEAST to find the lowest salary in a list
select least(10000, 60000, salary) from hr.EMPLOYEES;

-- WINDOW FUNCTIONS

-- 46. Rank employees by salary
select employee_id, first_name, last_name, salary, rank() over (order by salary) as rank_salary from hr.employees;

-- 47. Find the cumulative(SUM) salary sum
select first_name, last_name, salary, sum(salary) over(order by hire_date) as cumulative_sum from hr.employees;

-- 48. Find the average salary partitioned by department
select first_name, last_name, salary, avg(salary) over(partition by department_id) as avg_salary from hr.employees;

-- 49. Use LAG to get the previous employee's salary
select first_name, last_name, salary, lag(salary) over(order by hire_date) as previous_salary from hr.employees;

-- 50. Use LEAD to get the next employee's salary
select first_name, last_name, salary, lead(salary) over(order by hire_date) as next_salary from hr.employees;

