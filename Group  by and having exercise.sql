select * from hr.employees;

--1. Count employees per department
select department_id, count(*) as total_employees 
from hr.employees 
group by department_id;

-- 2. Total salary per department
select department_id, sum(salary) as total_salary 
from hr.employees 
group by department_id;

-- 3. Average salary per department
select department_id,avg(salary) as avg_salary 
from hr.employees 
group by department_id;

-- 4. Minimum salary per department
select department_id, min(salary) as min_salary 
from hr.employees 
group by department_id;

-- 5. maximum salary per department
select department_id, max(salary) as max_salary
from hr.employees
group by department_id;

-- 6. Count employees per job role
select job_id, count(*) 
from hr.employees 
group by job_id;

-- 7. Total salary per job role and department
select job_id,department_id,sum(salary) 
from hr.employees 
group by job_id, department_id;

-- 8. Average salary per job role
select job_id,avg(salary) 
from hr.employees 
group by job_id;

-- 9. Departments with more than 5 employees
select department_id,count(*) as total_emp
from hr.employees
group by department_id
having count(*)>=5;

select department_id,count(*) as total_emp
from hr.employees
group by department_id
having total_emp>=5;

-- 10. Departments where total salary > 100,000
select department_id, sum(salary) as total_salary
from hr.employees
group by department_id
having sum(salary) > 100000;

-- 11. Departments where average salary > 50,000
select department_id, avg(salary) as avg_salary
from hr.employees
group by department_id
having avg(salary) > 50000;

-- 12. Departments where max salary > 80,000
select department_id, max(salary) as max_salary
from hr.employees
group by department_id
having max(salary) > 80000;

-- 13. Departments where min salary < 30,000
select department_id, min(salary) as min_salary
from hr.employees
group by department_id
having min(salary) < 30000;

-- 14. Departments where number of employees is between 5 and 10
select department_id, count(*) as emp_count
from hr.employees 
group by department_id 
having  count(*) between 5 and 10;

-- 15. Departments where salary variance > 500,000
select department_id, variance(salary) as var_salary
from hr.employees
group by department_id
having var_salary > 50000;

-- 16. Departments where salary standard deviation > 5,000
select department_id, stddev(salary) as std_salary
from hr.employees
group by department_id
having std_salary > 5000;

-- 17. Employees sorted by salary in descending order
select employee_id, first_name, salary
from hr.employees
order by salary desc;

-- 18. Employees sorted by department and salary
select employee_id, first_name, department_id, salary
from hr.employees
order by department_id asc, salary desc;

-- 19. Employees sorted by last name alphabetically
select employee_id, first_name, last_name
from hr.employees
order by last_name asc;

-- 20. Employees sorted by hire date
select employee_id, first_name, hire_date
from hr.employees
order by hire_date asc;

-- 21. Employees sorted by commission, placing NULLs last
select employee_id, first_name, commission_pct
from hr.employees
order by commission_pct nulls last;

-- 22. Employees sorted by commission, placing NULLs first
select employee_id, first_name, commission_pct
from hr.EMPLOYEES
order by commission_pct nulls first;

-- 23. Employees sorted by length of first name
select employee_id, first_name
from hr.EMPLOYEES
order by length(first_name) asc;

-- 24. Employees sorted by last two characters of last name
select employee_id, first_name, last_name
from hr.EMPLOYEES
order by substr(last_name, -2)  asc;

-- 25. Employees sorted by uppercase first name
select employee_id, upper(first_name) as upper_name
from hr.EMPLOYEES
order by upper_name asc;

select employee_id, first_name 
from hr.EMPLOYEES
order by upper(first_name) asc;

-- 26. Employees sorted by salary after adding a bonus
select employee_id,first_name,salary
from hr.EMPLOYEES
order by (salary+1000) desc;

select employee_id, first_name,(salary+1000) as add_salary
from hr.employees
order by add_salary desc;

-- 27. Employees sorted by job ID and last name
select employee_id, first_name, job_id, last_name
from hr.EMPLOYEES
order by job_id asc, last_name asc;

select employee_id, first_name, job_id, last_name
from hr.EMPLOYEES
order by job_id,last_name asc;

-- 28. Employees sorted by department, then by first name
select employee_id, first_name, department_id
from hr.EMPLOYEES
order by department_id, first_name asc;

-- 29. Employees with IT_PROG job role first
select employee_id, first_name, job_id
from hr.EMPLOYEES
order by case when job_id='IT_PROG' then 1 else 2 end;

-- 30. Employees with priority to salaries above 5000
select employee_id, first_name, job_id, salary
from hr.EMPLOYEES
order by case when salary > 5000 then 1 else 2 end, salary desc;

-- 31. Departments where total salary between 50,000 and 200,000
select department_id, salary, sum(salary) as total_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID, salary
having total_salary between 5000 and 200000;

-- 32. Departments where max salary is at least double the min salary
select department_id, min(salary) as min_salary, max(salary) as max_salary
from hr.EMPLOYEES
group by  DEPARTMENT_ID
having max_salary >= 2 * min_salary;

-- 33. Employees in department 50 at the top
select employee_id, department_id, first_name
from hr.EMPLOYEES
where department_id = 50;

select employee_id, first_name, department_id
from hr.EMPLOYEES
order by case when department_id = 50 then 1 else 2 end, department_id asc;

-- 34. Employees sorted by highest salary ratio
select department_id, max(salary)/ avg(salary) as salary_ratio
from  hr.EMPLOYEES
group by DEPARTMENT_ID
having salary_ratio > 1.5
order by salary_ratio desc;

-- 35. Employees sorted by job ID then salary
select employee_id, first_name, salary, job_id
from hr.EMPLOYEES
order by job_id asc, salary desc; 

-- 36. Employees sorted by highest commission first
select employee_id, first_name, commission_pct
from hr.EMPLOYEES
order by commission_pct desc nulls last;

-- 37. Employees sorted by salary, keeping those with no commission at the bottom
select employee_id, first_name, salary, commission_pct
from hr.EMPLOYEES
order by case when commission_pct is null then 2 else 1 end, salary desc;

-- 38. Employees sorted by department and descending salary
select employee_id, first_name, department_id, salary
from hr.EMPLOYEES
order by department_id and salary desc;

-- 39. Employees where more than 50% earn above 60,000
select job_id, count(case when salary > 60000 then 1 end) * 1.0 / count(*)
from hr.EMPLOYEES
group by JOB_ID
having count(case when salary > 60000 then 1 end) > count(*) / 2; 

-- 40. Departments where IT and HR salaries sum to 80,000 or more
SELECT department_id, SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') 
THEN salary ELSE 0 END) AS it_hr_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) >= 80000;


