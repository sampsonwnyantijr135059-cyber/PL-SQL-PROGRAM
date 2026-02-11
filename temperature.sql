--PL/SQL block which converts temperature from Celsius to Fahrenheit.
set serveroutput on;
DECLARE
    celsius_temp NUMBER := 25;  -- Declare and initialize Celsius temperature
    fahrenheit_temp NUMBER;     -- Declare Fahrenheit temperature variable
BEGIN
    fahrenheit_temp := (celsius_temp * 9/5) + 32;

    DBMS_OUTPUT.PUT_LINE(celsius_temp || ' degrees Celsius is ' || fahrenheit_temp || ' degrees Fahrenheit.');
END;
/