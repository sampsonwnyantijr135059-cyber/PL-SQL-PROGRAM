--program to display the record of all male in hr
SET SERVEROUTPUT ON;
DECLARE
    -- Optional: Declare a variable for the department name for clarity/reusability
    v_department_name EMP.DEPT%TYPE := 'HR';
    -- Optional: Declare a variable for the gender
    v_gender EMP.GENDER%TYPE := 'Male';

BEGIN
    -- Use a cursor FOR loop for simplicity. The loop implicitly declares a record.
    FOR emp_rec IN (
        SELECT
            ENAME,
            GENDER,
            DEPT
        FROM
            EMP
        WHERE
            GENDER = v_gender
            AND DEPT= v_department_name
    ) LOOP
        -- Display the employee details
        DBMS_OUTPUT.PUT_LINE(
            'Employee: ' || emp_rec.ENAME ||
            ', Gender: ' || emp_rec.GENDER ||
            ', Department: ' || emp_rec.DEPT      
 );
END LOOP;
END;
/