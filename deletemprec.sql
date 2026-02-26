SET SERVEROUTPUT ON;
-- This line enables the output of DBMS_OUTPUT.PUT_LINE in most SQL client tools

DECLARE
    v_employee_id NUMBER := 101; -- Replace 101 with the actual EID to delete
BEGIN
    -- Delete the record from the 'employees' table where employee_id matches the variable
    DELETE FROM employees
    WHERE employee_id = v_employee_id;

    -- Check if a record was deleted
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee record ' || v_employee_id || ' deleted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee record found for EID ' || v_employee_id || '.');
    END IF;

    COMMIT; -- Commits the transaction to make the deletion permanent

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK; -- Rollback the transaction in case of an error
END;
/