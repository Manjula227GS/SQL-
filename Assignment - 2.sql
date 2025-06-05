-- =====================
-- String Functions
-- =====================

-- 21. Convert the first name to uppercase
select upper(first_name) from hr.employees;

-- 22. Convert the last name to lowercase
select lower(last_name) from hr.employees;

-- 23. Concatenate first and last names
select concat(first_name, ' ', last_name) as full_name from hr.employees;
select (first_name || ' ' || last_name) as full_last from hr.employees;

-- 24. Find the length of first name
select length(first_name) from hr.employees;

-- 25. Trim spaces from the first name
select trim(first_name) from hr.employees;

-- 26. Find the first three characters of the last name
select substring(last_name, 1, 3) from hr.employees;

-- 27. Replace all instances of 'a' with 'A' in first names
select replace(first_name, 'a', 'A') from hr.employees;

-- 28. Locate the position of 'a' in the first name
-- select position('a' in first_name) from hr.employees;

-- 29. Repeat the first name three times
select repeat(first_name, 3) from hr.employees;

-- 30. Reverse the last name
select reverse(last_name) from hr.employees;

-- ======================
-- Date/ Time-base Functions
-- ======================

-- 31. Get the current date
select current_date;

-- 32. Get the current timestamp
select current_timestamp;

-- 33. Extract the year from hire_date
select extract(year from hire_date) from hr.employees;

-- 34. Extract the month from hire_date
select extract(month from hire_date) from hr.employees;

-- 35. Extract the day from hire_date
select extract(day from hire_date) from hr.employees;

-- 36. Add 1 year to hire_date
select hire_date, hire_date + interval '1' year from hr.employees;

-- 37. Subtract 6 months from hire_date
-- select hire_date, hire_date - interval '6 month' from hr.employees;

-- 38. Find the difference in days between hire_date and current date
select hire_date, current_date - hire_date as days_in_company from hr.employees;

-- 39. Format the hire_date as 'YYYY-MM-DD'
select to_char(hire_date, 'YYYY-MM-DD') from hr.employees;

-- 40. Find employees hired in the last 30 days
-- select * from hr.employees where hire_date >= (current_date - interval '30 days');

-- =========================
-- Conditional Functions
-- =========================

-- 41. Select employees with 'Manager' in the job title and mark them as 'Senior' or 'Junior'
select first_name, last_name, 
    case 
        when job_id like '%Manager%' then 'Senior'
        else 'Junior'
    end as employee_level
from hr.employees;

-- 42. Use COALESCE to display 'No Commission' if commission_pct is NULL
select first_name, last_name, coalesce(commission_pct, 'No Commission') from hr.employees;

-- 43. Use NULLIF to return NULL when salary equals 50000
select first_name, last_name, nullif(salary, 50000) from hr.employees;

-- 44. Use GREATEST to find the highest value among salary and commission
select first_name, last_name, greatest(salary, commission_pct) from hr.employees;

-- 45. Use LEAST to find the lowest salary in a list
select least(50000, 60000, salary) from hr.employees;

-- ===================
-- Window Functions
-- ===================

-- 46. Rank employees by salary
select first_name, last_name, salary, rank() over (order by salary desc) as salary_rank from hr.employees;

-- 47. Find the cumulative salary sum
select first_name, last_name, salary, sum(salary) over (order by hire_date) as cumulative_salary from hr.employees;

-- 48. Find the average salary partitioned/group by by department
select first_name, last_name, salary, avg(salary) over (partition by department_id) as avg_salary_per_dept from hr.employees;

-- 49. Use LAG to get the previous employee's salary
select first_name, last_name, salary, lag(salary) over (order by hire_date) as previous_salary from hr.employees;

-- 50. Use LEAD to get the next employee's salary
select first_name, last_name, salary, lead(salary) over (order by hire_date) as next_salary from hr.employees;

-- ===========================
-- Mathematical Functions
-- ===========================

-- ABS: Returns the absolute value of a number.
select abs(-10) from dual; 

-- CEIL: Rounds a number up to the nearest integer.
select ceil(3.14) from dual; 

-- FLOOR: Rounds a number down to the nearest integer.
select floor(3.14) from dual; 

-- MOD: Returns the remainder of division.
select mod(10, 3) from dual; 

-- POWER: Raises a number to a power.
select power(2, 3) from dual; 

-- SQRT: Calculates the square root of a number.
select sqrt(16) from dual; 

-- EXP: Calculates the exponential of a number (e raised to the power of x).
select exp(2) from dual; 

-- LOG: Calculates the logarithm of a number to a base.
select log(10, 100) from dual; 

-- LN: Calculates the natural logarithm of a number (logarithm to base e).
select ln(1) from dual; 

-- GREATEST: Returns the largest value from a list of values.
select greatest(10, 20, 4) from dual; 

-- LEAST: Returns the smallest value from a list of values.
select least(10, 20, 5) from dual; 

-- SIGN: Returns -1 if the number is negative, 1 if positive, and 0 if zero.
select sign(-10) from dual; 

-- SIN, COS, TAN: Calculate trigonometric functions (sine, cosine, tangent).
select sin(30), cos(60), tan(45) from dual;

-- PI: Returns the value of pi.
select pi() from dual;

-- ============================
-- Character-based Functions
-- ============================

-- LOWER: Converts a string to lowercase.
select lower('hello, world!') from dual; 

-- UPPER: Converts a string to uppercase.
select upper('hello, world') from dual; 

-- INITCAP: Capitalizes the first letter of each word.
select initcap('hello world') from dual; 

-- CONCAT: Concatenates two or more strings.
select concat('hello', ' ', 'world') from dual; 

-- SUBSTR: Extracts a substring from a string.
select substr('hello, world!', 7, 5) from dual; 

-- LENGTH: Returns the length of a string.
select length('hello, world!') from dual; 

-- INSTR: Finds the position of a substring within a string.
select instr('hello, world!', 'world') from dual; 

-- REPLACE: Replaces occurrences of a substring with another.
select replace('hello, world!', 'world', 'universe') from dual; 

-- TRIM: Removes leading and trailing whitespace from a string.
select trim('  hello, world!  ') from dual; 

-- LTRIM: Removes leading whitespace from a string.
select ltrim('  hello, world!') from dual; 

-- RTRIM: Removes trailing whitespace from a string.
select rtrim('hello, world!  ') from dual; 

-- LPAD: Pads a string with characters on the left.
select lpad('hello', 10, '*') from dual; 

-- RPAD: Pads a string with characters on the right.
select rpad('hello', 10, '*') from dual; 

-- ASCII: Returns the ASCII value of a character.
select ascii('a') from dual; 

-- CHR: Returns the character corresponding to an ASCII value.
select chr(65) from dual;


