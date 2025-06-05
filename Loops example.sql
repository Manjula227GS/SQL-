-- 1. ###### IF-Condition ######
-- IF LOOP ----> SINGLE LOOP
DECLARE
     variable1 number:=15;
BEGIN
    if variable1>10 then
        dbms_output.put_line('number is greater than 5');
    end if;
END;

-- IF ELSE LOOP ----> TWO LOOPS
DECLARE 
   v_score NUMBER:= 60;
BEGIN
    IF v_score >= 50 THEN 
        DBMS_OUTPUT.PUT_LINE('PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;

DECLARE 
   v_score NUMBER:= 40;
BEGIN
    IF v_score >= 50 THEN 
        DBMS_OUTPUT.PUT_LINE("PASS");
    ELSE
        DBMS_OUTPUT.PUT_LINE("FAIL");
    END IF;
END;

-- IF ELSIF - ELSE  LOOP ----> MUTLIPLE LOOPS
DECLARE
    V_MARKS NUMBER :=  85;
BEGIN
    IF V_MARKS >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('GRADE : A');
    ELSIF V_MARKS >= 70 then
        DBMS_OUTPUT.PUT_LINE('GRADE: B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('GRADE: C');
    END IF;
END; 

DECLARE
    V_MARKS NUMBER :=  85;
BEGIN
    IF V_MARKS >= 65 THEN
        DBMS_OUTPUT.PUT_LINE('GRADE : A');
    ELSIF V_MARKS >= 65 then
        DBMS_OUTPUT.PUT_LINE('GRADE: B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('GRADE: C');
    END IF;
END;

DECLARE
    V_MARKS NUMBER :=  85;
BEGIN
    IF V_MARKS >= 95 THEN
        DBMS_OUTPUT.PUT_LINE('GRADE : A');
    ELSIF V_MARKS >= 90 then
        DBMS_OUTPUT.PUT_LINE('GRADE: B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('GRADE: C');
    END IF;
END;

-- 1.In employee table i have an employee_id is 101, and his rank salary should be high or  medium or low? how to do that in pl/sql?
DECLARE
    emp_name varchar2(20);
    emp_salary number;
BEGIN
    select first_name,salary into emp_name,emp_salary from hr.EMPLOYEES where EMPLOYEE_ID=101;
    if emp_salary >= 30000 THEN
        dbms_output.put_line('Rank: high');
    elsif emp_salary >= 20000 then
        dbms_output.put_line('Rank: medium');
    else
        dbms_output.put_line('Rank: low');
    end if;
    dbms_output.put_line(emp_name || '--' || emp_salary);
end;

-- Declare all output display in one single statement
DECLARE
    emp_name varchar2(20);
    emp_salary number;
    Grade_value varchar2(20);  -- in varchar2 always declare some values otherwise its doesn't dispaly.
BEGIN
    select first_name,salary into emp_name,emp_salary from hr.EMPLOYEES where EMPLOYEE_ID=101;
    if emp_salary >= 30000 THEN
        Grade_value:= 'Rank: high';
    elsif emp_salary >= 20000 then
        Grade_value:= 'Rank: medium';
    else
        Grade_value:= 'Rank: low';
    end if;
    dbms_output.put_line(emp_name || '--' || emp_salary || '--->' || Grade_value);  -- dbms statment also contain varible in declaration option
end;

-- NESTED IF LOOP
DECLARE
    emp_name varchar2(20);
    emp_salary number;
    Grade_value varchar2(20);
BEGIN
    select first_name,salary into emp_name,emp_salary from hr.EMPLOYEES where EMPLOYEE_ID=101;
    if emp_salary >= 30000 THEN
        Grade_value:='Rank: high';
        if emp_salary < 70000 THEN
            Grade_value:='Rank: Normal high';
        else
            Grade_value:= 'Rank: Very high';
            end if;
    else
        Grade_value:= 'Rank: low';
    end if;
    dbms_output.put_line(emp_name || '--' || emp_salary || '--->' || Grade_value);
end;


-- for multiple employee_id in salary displayed 
DECLARE
    emp_name     VARCHAR2(20);
    emp_salary   NUMBER;
    grade_value  VARCHAR2(20);

    CURSOR emp_cur IS
        SELECT first_name, salary
        FROM hr.employees
        WHERE employee_id IN (101, 102, 103);
BEGIN
    FOR emp_rec IN emp_cur LOOP
        emp_name := emp_rec.first_name;
        emp_salary := emp_rec.salary;

        IF emp_salary >= 3000 THEN
            IF emp_salary < 70000 THEN
                grade_value := 'Rank: Normal high';
            ELSE
                grade_value := 'Rank: Very high';
            END IF;
        ELSE
            grade_value := 'Rank: low';
        END IF;

        DBMS_OUTPUT.PUT_LINE(emp_name || ' -- ' || emp_salary || ' ---> ' || grade_value);
    END LOOP;
END;


DECLARE
    emp_name varchar2(20) := 'Neena';  -- Employee name should in string
    emp_salary number:= 200000;  -- Assign value to aviod null comparision errors
    grade_value varchar2(20);  -- Declare grade_value
BEGIN
    select first_name,salary into emp_name,emp_salary from hr.employees where employee_id=101;
    -- Determine Grade based on Salary
    if emp_salary >= 30000 then
        grade_value := 'Grade: High';

        --Nested if to check salary range
        if emp_salary < 70000 THEN
            grade_value := 'high';
        else 
            grade_value := 'Very high salary';
        end if;
    else
        grade_value := 'Grade: low';
    end if;
    -- Print the output
    dbms_output.put_line('emp_name || emp_salary ||grade_value');
end;



