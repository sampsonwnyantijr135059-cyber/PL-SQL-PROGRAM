SET SERVEROUTPUT ON;

DECLARE
    v_rows_updated NUMBER(5);
BEGIN
    UPDATE EMP
    SET SAL = SAL * 1.10
    WHERE DEPTNO = 10;
    IF SQL%FOUND THEN
        v_rows_updated := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE(v_rows_updated || ' employee(s) in department 10 had their salary updated by 10%.');
        COMMIT; -- Commit the transaction if successful
    ELSIF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in department 10. No salaries were updated.');
        ROLLBACK; -- Rollback if no changes were made (optional, but good practice)
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK; -- Rollback in case of any other error
END;
/