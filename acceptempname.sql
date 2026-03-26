set serveroutput on;
DECLARE
    v_salary      EMP.SAL%TYPE;
    v_input_name  EMP.ENAME%TYPE := '&enter_employee_name';
BEGIN
    SELECT sal
    INTO   v_salary
    FROM   EMP
    WHERE  ename = UPPER(v_input_name); -- Using UPPER to ensure case-insensitive matching if needed

    DBMS_OUTPUT.PUT_LINE('Employee Found: ' || v_input_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ' || v_input_name || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/