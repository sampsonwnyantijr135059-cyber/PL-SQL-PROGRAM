--A function that returns the square of the given number using seperate pl/sql block. 
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION square_num (
    p_num IN NUMBER
)
RETURN NUMBER
IS
    v_result NUMBER;
BEGIN
    v_result := p_num * p_num;
    RETURN v_result;
END;
/
--CALLING PROCEDURE
DECLARE
    v_ans NUMBER;
BEGIN
    v_ans := square_num(5);
    DBMS_OUTPUT.PUT_LINE('Square is: ' || v_ans);
END;
/