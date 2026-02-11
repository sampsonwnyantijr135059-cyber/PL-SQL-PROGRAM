--program to generate the numbers using LOOP, FOR LOOP and WHILE LOOP up to the number inputted by user.
set serveroutput on;
DECLARE
    n_limit NUMBER := &enter_upper_limit; -- Prompts user for the limit
    counter NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Numbers using Basic LOOP (up to ' || n_limit || ') ---');
    LOOP
        DBMS_OUTPUT.PUT_LINE(counter);
        counter := counter + 1;
        EXIT WHEN counter > n_limit; -- Exit the loop when the counter exceeds the limit
    END LOOP;
END;
/