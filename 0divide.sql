SET SERVEROUTPUT ON;
DECLARE
    numerator   NUMBER := 10;
    denominator NUMBER := 0; -- This will cause the exception
    result      NUMBER;
BEGIN

    DBMS_OUTPUT.PUT_LINE('Attempting to divide ' || numerator || ' by ' || denominator || '...');

    result := numerator / denominator;
    DBMS_OUTPUT.PUT_LINE('The result is: ' || result);

EXCEPTION

    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: A division by zero occurred. Cannot divide by zero.');
        DBMS_OUTPUT.PUT_LINE('The program continues execution after handling the error.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/