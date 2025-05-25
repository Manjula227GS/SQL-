-- 1. Select all columns from employees table
select * from hr.EMPLOYEES;

-- 2. Select employee's first and last names
select first_name,last_name from hr.EMPLOYEES;
select concat(first_name, last_name) from hr.EMPLOYEES;
select first_name || ' ' || last_name from hr.EMPLOYEES;

-- 3. Select distinct job titles from employees
select count(DEPARTMENT_ID), count(distinct DEPARTMENT_ID) from hr.EMPLOYEES;
select distinct job_id from hr.EMPLOYEES;

-- 4. Select employees with salary greater than 5000
select salary from hr.EMPLOYEES where salary > 5000;

--  5. Select employees hired after January 1, 2020
SELECT HIRE_DATE FROM hr.employees WHERE hire_date > TO_DATE('01-01-2020', 'DD-MM-YYYY');
select hire_date from hr.EMPLOYEES where hire_date > date '2020-01-01';  

-- 6. Select employees in department ID 10
select department_id from hr.employees where department_id = 10;

-- 7. Select employees with the first name starting with 'A'
select first_name from hr.EMPLOYEES where first_name like 'A%';

-- 8. Select employee details ordered by hire date
select employee_id,first_name from hr.employees order by hire_date;

-- 9. Select the top 5 highest paid employees
select * from (select * from HR.EMPLOYEES order by salary desc) where rownum <= 5;
select salary from (select SALARY from HR.EMPLOYEES order by SALARY desc) where ROWNUM <= 5;

-- 10. Select employees with salary between 40000 and 60000
select * from hr.EMPLOYEES where salary between 4000 and 60000;

-- 11. Count the number of employees
select count(*) from hr.EMPLOYEES;

-- 12. Count the number of employees in department 20
select count(DEPARTMENT_ID) from hr.EMPLOYEES where department_id = 20;

-- 13. Find the minimum salary in the employees table
select min(salary) from hr.EMPLOYEES;

-- 14. Find the maximum salary in the employees table
select max(salary) from hr.employees;

-- 15. Find the average salary of employees
select avg(salary) from hr.EMPLOYEES;

-- 16. Sum the total salaries of all employees
select sum(salary) from hr.EMPLOYEES;

-- 17. Count employees grouped by department_id
select count(*) from hr.EMPLOYEES group by DEPARTMENT_ID;

-- 18. Find the average salary per department
select department_id,avg(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;

-- 19. Count employees with salary greater than 60000
-- select salary from hr.EMPLOYEES where salary greater than 60000; 

-- 20. Find the total salary by department
select DEPARTMENT_ID,sum(salary) from hr.employees group by department_id;

-- 21. Select employees with job title 'Manager'
select employee_id,job_id from hr.EMPLOYEES where job_id ='IT_PROG';
select employee_id,job_id from hr.EMPLOYEES where job_id ='Manager';

-- 22. Select employees not in department 30
select department_id from hr.EMPLOYEES where DEPARTMENT_ID != 30;

-- 23. Select employees with salary less than 30000
select salary from hr.EMPLOYEES where salary < 30000;

-- 24. Select employees with a NULL commission_pct
select * from hr.EMPLOYEES where commission_pct is null;

-- 25. Select employees with a non-NULL commission_pct
-- select * from hr.employees where commission_pct is non-null;

-- 26. Find employees who were hired in 2015
select employee_id,hire_date from hr.EMPLOYEES where extract(year from hire_date)=2015;

-- 27. Select the first 10 employees ordered by last name
select EMPLOYEE_ID,first_name,last_name from hr.EMPLOYEES order by last_name fetch FIRST 10 row only;
select EMPLOYEE_ID,first_name,last_name from hr.EMPLOYEES order by last_name fetch FIRST 5 row only;

-- 28. Select employees who have been hired within the last 2 years
-- SELECT * FROM hr.employees WHERE hire_date >= (CURRENT_DATE - INTERVAL'2 years');
select * from HR.EMPLOYEES WHERE HIRE_DATE >= add_months(sysdate, -24);

-- 29. Select employees with 'Senior' in their job title
select * from hr.EMPLOYEES where job_id like '%Senior%';
 
-- 30. Select employees with first name containing 'John'
select first_name from hr.EMPLOYEES where first_name like '%John';

-- 31. Select employees whose last name starts with 'S' and salary greater than 50000
select * from hr.EMPLOYEES where last_name like 'S%' and salary> 5000;

-- 32. Select employees ordered by department_id and salary
select * from hr.EMPLOYEES order by DEPARTMENT_ID and salary;

-- 33. Count the number of employees in each job title
select job_id,count(*) from hr.EMPLOYEES group by job_id;

-- 34. Find the maximum salary in department 50
select max(salary) from hr.EMPLOYEES where department_id = 50;

-- 35. Select employees with hire date in the last 6 months
-- select * from hr.EMPLOYEES where hire_date >= (Current_date-INTERVAL '6 months');

-- 36. Select employees ordered by hire_date descending
select * from hr.EMPLOYEES order by hire_date desc;

-- 37. Select employees who do not have a manager
select * from hr.EMPLOYEES where manager_id is null;

-- 38. Select employees with the highest salary in each department
select department_id, max(salary) from hr.EMPLOYEES group by department_id; 

-- 39. Select employees with salaries higher than the department average
select * from hr.EMPLOYEES where salary > (select avg(salary) from hr.EMPLOYEES);

-- 40. Find the total salary expenditure for department 10
select sum(salary) from hr.EMPLOYEES where DEPARTMENT_ID=10; 

-- 41. Find employees with job title that contains 'Developer'
select * from hr.EMPLOYEES where job_id like '%Developer%';

-- 42. Select employees with salary in the top 10%
SELECT * FROM hr.employees WHERE salary >= (SELECT PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY salary) FROM hr.employees);

-- 43. Select employees who have been in the company for more than 10 years
-- SELECT * FROM hr.employees WHERE hire_date <= (CURRENT_DATE - INTERVAL '10 years');

-- 44. Find employees whose first name is 5 characters long
select first_name from hr.EMPLOYEES where FIRST_NAME like '_____';
select * from hr.EMPLOYEES where length(FIRST_NAME)=5;

-- 45. Select employees who have 'Admin' in their job title
SELECT job_id FROM hr.employees WHERE job_id LIKE '%Admin%';

-- 46. Find the earliest hire date in the company
select min(hire_date) from hr.EMPLOYEES;

-- 47. Find the department with the highest average salary
select department_id from hr.EMPLOYEES group by DEPARTMENT_ID order by avg(salary) desc;

-- 48. Select employees who are managers
SELECT * FROM hr.employees WHERE employee_id IN (SELECT DISTINCT manager_id FROM hr.employees WHERE manager_id IS NOT NULL);

-- 49. Find the number of employees in each salary range
select
case
    when salary< 30000 then 'low'
    when salary between 30000 and 60000 then 'Medium'
    else 'High' 
end
as salary_range, count(*)
from hr.employees group by salary_range;

-- 50. Select employees with odd-numbered employee IDs
select * from hr.employees where mod(employee_id,2)=1;

-- 51. Find the highest salary in each department, showing the department name and salary
SELECT d.department_name, MAX(e.salary) 
FROM hr.employees e 
JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 52. Find employees who earn more than their managers
select e.first_name, e.last_name 
from hr.EMPLOYEES e
join hr.EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
where e.salary > m.salary;

-- 53. Find employees who have the same job title as their managers
select e.first_name, e.last_name
from hr.employees e
join hr.EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
where e.job_id = m.job_id;

-- 54. Select employees who are in departments with more than 10 employees
select * from hr.EMPLOYEES where department_id IN(
    select department_id
    from hr.EMPLOYEES
    group by DEPARTMENT_ID
    having count(*)>10
);

-- 55. Select employees with the highest salary in each department, without using subqueries
with DepartmentMaxSalaries AS (
    select department_id, max(salary) as max_salary
    from hr.EMPLOYEES 
    group by department_id)
select e.* from hr.EMPLOYEES e
join DepartmentMaxSalaries dms ON e.department_id = dms.department_id and e.salary = dms.max_salary;

-- 56. Find employees who earn more than the average salary in their departmen
select * from hr.employees e
where e.salary > (select avg(salary) from hr.employees where department_id = e.DEPARTMENT_ID);

-- 57. Select employees with hire dates in the year 2021
select * from hr.EMPLOYEES where extract(year from hire_date) = 2021;

-- 58. Find employees who have changed departments (have more than one department_id in their employment history)
SELECT employee_id
FROM hr.employees
GROUP BY employee_id
HAVING COUNT(DISTINCT department_id) > 1;

-- 59. Select employees with a salary in the 75th percentile
SELECT * 
FROM hr.employees
WHERE salary >= (SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary) FROM hr.employees);

-- 60. Find departments with no employees
SELECT d.department_name
FROM hr.departments d
LEFT JOIN hr.employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;














