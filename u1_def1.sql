--Program to calculate the Simple Interest

set serveroutput on;
DECLARE

    v_principal   NUMBER := 5000; 
    v_rate        NUMBER := 7.5;  
    v_years       NUMBER := 3;    
    v_simple_interest NUMBER;
    v_total_amount NUMBER;

BEGIN

    v_simple_interest := (v_principal * v_rate * v_years) / 100;

    
    v_total_amount := v_principal + v_simple_interest;


    DBMS_OUTPUT.PUT_LINE('Principal Amount: $' || v_principal);
    DBMS_OUTPUT.PUT_LINE('Interest Rate: ' || v_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Years: ' || v_years);
    DBMS_OUTPUT.PUT_LINE('---');
    DBMS_OUTPUT.PUT_LINE('Calculated Simple Interest: $' || ROUND(v_simple_interest, 2));
    DBMS_OUTPUT.PUT_LINE('Total Amount after ' || v_years || ' years: $' || ROUND(v_total_amount, 2));

END;
/