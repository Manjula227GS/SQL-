-- 1. Declaring a numeric variable with value 10
DECLARE
    num NUMBER := 10;
BEGIN 
-- Check if number is positive
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Positive number'); 
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not a positive number');  
    END IF;
END;

-- 2. Declaring a string variable with value 'Alice'
DECLARE
  name VARCHAR2(50) := 'Alice';
 BEGIN
    --Check if name is Alice
    IF name = 'Alice' THEN
        DBMS_OUTPUT.PUT_LINE('Hello, Alice');  -- Greeting if name matches
    ELSE
        DBMS_OUTPUT.PUT_LINE('You are not Alice');  -- Message if name does not match
    END IF;
END;

-- 3. Declaring a numeric variable representing age
DECLARE
  age NUMBER := 25;
BEGIN
    IF age > 18 THEN
    DBMS_OUTPUT.PUT_LINE('Adult');  
  ELSE
    DBMS_OUTPUT.PUT_LINE('Minor');  
  END IF;
END;

-- 4. Declaring a character variable representing grade
DECLARE
  grade CHAR := 'B';
BEGIN
    IF GRADE = 'B' THEN
        DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOT GOOD');
    END IF;
END;

-- 5. Declaring salary and bonus variables
DECLARE  
  salary NUMBER := 20000;
  bonus NUMBER := 0;
BEGIN
    IF salary > 80000 THEN
       bonus := 5000;
    ELSE 
        bonus := 2000;
    END IF;
    DBMS_OUTPUT.PUT_LINE('BONUS:= ' || bonus);
END;

-- 6. Declaring gender as a character
DECLARE
  gender CHAR := 'M';
BEGIN
-- Gender-based message
    IF gender = 'M' THEN
        DBMS_OUTPUT.PUT_LINE('Male');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Female');
    END IF;
END;

--7. Declaring day of the week as a string
DECLARE
  day VARCHAR2(10) := 'Monday';
BEGIN
-- Day check
    IF day = 'Sunday' THEN
        DBMS_OUTPUT.PUT_LINE('Weekend');  
    ELSE
        DBMS_OUTPUT.PUT_LINE('Weekday');  
    END IF;
END;

-- 8. Declaring marks scored
DECLARE
  marks NUMBER := 85;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade A');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Below Grade A');
    END IF;
END;

-- 9. Declaring status of the user
DECLARE
  status VARCHAR2(10) := 'Active';
BEGIN
-- Status check
    IF status = 'Active' THEN
        DBMS_OUTPUT.PUT_LINE('User is Active');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User is Inactive');
    END IF;
END;

-- 10. Declaring score for pass/fail
DECLARE
  score NUMBER := 72;
BEGIN
-- Pass or Fail
    if score >= 50 THEN
        DBMS_OUTPUT.PUT_LINE('Pass');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;  

-- 11. Declaring user level
DECLARE
  level NUMBER := 3;
BEGIN
-- Level Comparison
    IF level = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Beginner');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Beginner');
    END IF;
END;   

-- 12. Declaring temperature value
DECLARE
  temperature NUMBER := 37.5;
BEGIN
-- Temperature check
  IF temperature > 37.0 THEN
    DBMS_OUTPUT.PUT_LINE('Fever');  
  ELSE
    DBMS_OUTPUT.PUT_LINE('Normal');  
  END IF;
END;

-- 13. Declaring a year to check for leap year
DECLARE
  year NUMBER := 2024;
BEGIN
-- Leap year check
    IF MOD(year, 4)=0 AND (MOD(year, 100) != 0 OR MOD(year, 400) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Leap Year');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not a Leap year');
    END IF;
END;    

-- 14. Declaring a flag-like character
DECLARE
  char_value CHAR := 'Y';
BEGIN
-- Yes or o flag
    IF char_value = 'Z' THEN
        DBMS_OUTPUT.PUT_LINE('Confirmed');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Not Confirmed');
    END IF;
END;

-- 15. Declaring a boolean value
DECLARE
  bool_value BOOLEAN := TRUE;
BEGIN
-- Boolean check
    IF bool_value  THEN
        DBMS_OUTPUT.PUT_LINE('Boolean is TURE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Boolean is FALSE');
    END IF;
END;

-- 16. Declaring login attempts count
DECLARE
  login_attempts NUMBER := 2;
BEGIN
-- Login attempts check
    IF login_attempts > 1 THEN
        DBMS_OUTPUT.PUT_LINE('Account Locked');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Login Allowed');
    END IF;
END;

-- 17. Declaring product availability flag
DECLARE
  product_in_stock BOOLEAN := FALSE;
BEGIN
-- Product availability
    IF product_in_stock THEN
        DBMS_OUTPUT.PUT_LINE('Product Available');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Out of Stock');
    END IF;
END;

-- 18. Declaring city name
DECLARE
  city VARCHAR2(20) := 'Bangalore';
BEGIN
-- City Check
    IF city = 'USA' THEN
        DBMS_OUTPUT.PUT_LINE('Welocom To Bangalore');
    ELSE
        DBMS_OUTPUT.PUT_LINE('You are not in Bangalore');
    END IF;
END;

-- 19. Declaring age group as a string
DECLARE
    Age NUMBER := 10;
    age_group VARCHAR2(20);
BEGIN
-- Age group classification
    IF age < 13 THEN
        age_group := 'Child';
    ELSE
        age_group := 'Teen/Adult';
    END IF;
    DBMS_OUTPUT.PUT_LINE('Age_group:= ' || age_group);
END;

-- =============================
-- FOR LOOP
-- =============================

-- Example 1: Exit after first iteration
DECLARE
    i NUMBER := 1;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('i:= ' || i);
        EXIT;  -- Exit after first loop
    END LOOP;
END;

-- Example 2: Exit when i = 5
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        IF i = 5 THEN
        EXIT;
        END IF;
    DBMS_OUTPUT.PUT_LINE('i = ' || i);
  END LOOP;
END;

-- Example 3: Continue if i is even
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Odd: ' || i);
    END LOOP;
END;

-- Example 4: Print until i = 4
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        IF i = 4 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Counting: ' || i);
    END LOOP;
END;

-- Example 5: Skip number 3
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..5 LOOP
        IF i = 3 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
    END LOOP;
END;

-- Example 6: Exit when multiple of 7 found
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..20 LOOP
        IF MOD(i, 7) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Found multiple of 7: ' || i);
        EXIT;
        END IF;
    END LOOP;
END;

-- Example 7: Continue when divisible by 3
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 3) = 0 THEN
        CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Not divisible by 3: ' || i);
    END LOOP;
END;

-- Example 8: Exit from WHILE loop
DECLARE
    i NUMBER;
BEGIN
    i := 1;
    WHILE i <= 10 LOOP
        IF i = 4 THEN
         i := i +1;
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
         i := i + 1;
    END LOOP;
END;

-- Example 9: Continue in WHILE loop
DECLARE
    i NUMBER := 0;
BEGIN
    WHILE i < 5 LOOP
        i := i + 1;
        IF i = 2 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Value: ' || i);
    END LOOP;
END;

-- Example 10: Skip printing multiples of 4
DECLARE
    i NUMBER;
BEGIN 
    FOR i IN 1..10 LOOP
        IF MOD(i, 4) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
    END LOOP;
END;

-- Example 11: Exit if i > 3 in WHILE loop
DECLARE
    i NUMBER := 0;
BEGIN
    WHILE TRUE LOOP
        i := i + 1;
        IF i > 3 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
    END LOOP;
END;

-- Example 12: Continue on even numbers in WHILE
DECLARE
    i NUMBER := 0;
BEGIN
    WHILE i < 5 LOOP
        i := i + 1;
        IF MOD(i, 2) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Odd WHILE: ' || i);
    END LOOP;
END;

-- Example 13: Nested loop exit
DECLARE
    i NUMBER:= 0;
    j NUMBER:= 0;
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            IF j = 2 THEN
                EXIT;
            END IF;
            DBMS_OUTPUT.PUT_LINE('i=' || i || ', j=' || j);
        END LOOP;
    END LOOP;
END;

-- Example 14: Nested loop continue
DECLARE
    i NUMBER:= 0;
    j NUMBER:= 0;
BEGIN 
    FOR i IN 1..2 LOOP
        FOR j IN 1..3 LOOP
            IF j = 2 THEN
                CONTINUE;
            END IF;
            DBMS_OUTPUT.PUT_LINE('Pair: ' || i || ',' || j);
        END LOOP;
    END LOOP;
END;

-- Example 15: Exit on first multiple of 6
DECLARE
    i NUMBER:=0;
BEGIN
    FOR i IN 1..20 LOOP
            IF MOD(i, 6) = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Exit on: ' || i);
                EXIT;
            END IF;
    END LOOP;
END;

-- Example 16: Continue on 5
DECLARE
    i NUMBER := 0;
BEGIN 
    FOR i IN 1..7 LOOP
        IF i = 5 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
    END LOOP;
END;

-- Example 17: Exit when i = 10 in REVERSE loop
DECLARE
    i NUMBER := 0;
BEGIN   
    FOR i IN REVERSE 1..15 LOOP
        IF i = 10 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Reverse: ' || i);
    END LOOP;
END;

-- Example 18: Continue if i is divisible by 2 or 3
DECLARE 
    i NUMBER;
BEGIN 
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 0 OR MOD(i, 3) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Special: ' || i);
    END LOOP;
END;

-- Example 19: Exit when square of i > 50
DECLARE 
    i NUMBER;
BEGIN 
    FOR i IN 1..10 LOOP
        IF i * i > 50 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i squared = ' || i*i);
    END LOOP;
END;

-- Example 20: Continue on single digit numbers
DECLARE 
    i NUMBER;
BEGIN 
    FOR i IN 1..15 LOOP
        IF i < 10 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Double-digit: ' || i);
    END LOOP;
END;

-- Example 21: Loop from 20 to 25 and exit at 23
DECLARE 
    i NUMBER:= 20;
BEGIN
    FOR i IN 20..25 LOOP
        IF i = 23 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
    END LOOP;
END;

-- Example 22: Loop from 1 to 6 and skip 4
DECLARE 
    I NUMBER;
BEGIN 
    FOR i IN 1..6 LOOP
        IF i = 4 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
    END LOOP;
END;

-- Example 23: Print only prime numbers (1 to 10)
DECLARE  
    i NUMBER;
    j NUMBER;
BEGIN 
    FOR i IN 2..10 LOOP
        DECLARE
            is_prime BOOLEAN := TRUE;
            j NUMBER;
        BEGIN
            FOR j IN 2..i-1 LOOP
                IF MOD(i, j) = 0 THEN
                    is_prime := FALSE;
                    EXIT;
                END IF;
            END LOOP;
                IF is_prime THEN
                    DBMS_OUTPUT.PUT_LINE('Prime: ' || i);
                END IF;
        END;
    END LOOP;
END;

-- Example 24: Exit after printing first 3 odd numbers
DECLARE
    i NUMBER:= 0;
BEGIN 
    DECLARE
        odd_count NUMBER := 0;
    BEGIN
        WHILE i < 20 LOOP
            i := i + 1;
            IF MOD(i, 2) = 1 THEN
                DBMS_OUTPUT.PUT_LINE('Odd: ' || i);
                odd_count := odd_count + 1;
            END IF;
            IF odd_count = 3 THEN
                EXIT;
            END IF;
        END LOOP;
    END;
END;

-- Example 25: Continue when i mod 5 = 0
DECLARE 
    i NUMBER;
BEGIN 
    FOR i IN 1..15 LOOP
        IF MOD(i, 5) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Not multiple of 5: ' || i);
    END LOOP;
END;

-- Example 26: Exit on first multiple of both 3 and 4
DECLARE
    i NUMBER;
BEGIN 
    FOR i IN 1..20 LOOP
        IF MOD(i, 3) = 0 AND MOD(i, 4) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Multiple of 3 and 4: ' || i);
            EXIT;
        END IF;
    END LOOP;
END;

-- Example 27: Continue on vowels (simulate ASCII values)
DECLARE 
    i NUMBER;
BEGIN 
    FOR i IN 65..70 LOOP  -- A to F
        IF CHR(i) IN ('A', 'E') THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Letter: ' || CHR(i));
    END LOOP;
END;

-- Example 28: Exit when sum exceeds 20
DECLARE
    i NUMBER:= 5;
BEGIN
    DECLARE
        total NUMBER := 0;
    BEGIN
        FOR i IN 1..10 LOOP
        total := total + i;
            IF total > 20 THEN
                DBMS_OUTPUT.PUT_LINE('Total exceeded at i=' || i);
                EXIT;
            END IF;
        END LOOP;
    END;
END;

-- Example 29: Continue when i squared is even
DECLARE 
    i NUMBER;
BEGIN 
    FOR i IN 1..8 LOOP
        IF MOD(i*i, 2) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Square is odd: ' || i*i);
    END LOOP;
END;

-- Example 30: Exit after 5 iterations using simple LOOP
DECLARE
     i NUMBER;
BEGIN
    i := 0;
        LOOP
            i := i + 1;
            IF i > 5 THEN
                EXIT;
            END IF;
            DBMS_OUTPUT.PUT_LINE('i = ' || i);
        END LOOP;
END;


