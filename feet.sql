-- PL/SQL staement block which accepts measurement in feet and displays it in cm, inch and meter.
SET SERVEROUTPUT ON; 

DECLARE
    v_feet     NUMBER := &enter_feet; -- Use & for user input
    v_inches   NUMBER;
    v_cm       NUMBER;
    v_meters   NUMBER;
    -- Define constants for conversions
    c_inches_per_foot CONSTANT NUMBER := 12;
    c_cm_per_inch     CONSTANT NUMBER := 2.54;
    c_meters_per_foot CONSTANT NUMBER := 0.3048;

BEGIN
    v_inches := v_feet * c_inches_per_foot;
    v_cm     := v_inches * c_cm_per_inch;
    v_meters := v_feet * c_meters_per_foot;

    DBMS_OUTPUT.PUT_LINE('Measurement in Feet:    ' || v_feet || ' ft');
    DBMS_OUTPUT.PUT_LINE('Measurement in Inches:  ' || v_inches || ' in');
    DBMS_OUTPUT.PUT_LINE('Measurement in Centimeters: ' || v_cm || ' cm');
    DBMS_OUTPUT.PUT_LINE('Measurement in Meters:  ' || v_meters || ' m');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/