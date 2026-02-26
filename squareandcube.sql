--PROGRAM TO CALCULATE THE SQUARE ROOT AND CUBE
set serveroutput on;
DECLARE
    v_number    NUMBER := 5;
    v_square    NUMBER;
    v_cube      NUMBER;
BEGIN
   
    v_square := v_number * v_number;
    v_cube := v_number * v_number * v_number;
  
    DBMS_OUTPUT.PUT_LINE('The given number is: ' || v_number);
    DBMS_OUTPUT.PUT_LINE('The square is: ' || v_square);
    DBMS_OUTPUT.PUT_LINE('The cube is: ' || v_cube);
END;
/