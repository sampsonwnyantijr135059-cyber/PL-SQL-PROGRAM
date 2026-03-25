--PL/SQL block that uses a cursor attribute
%ISOPEN and %NOTFOUND to raise the basic salary of employees of department number 20 by 5% and also display the appropriate message based on the existence to the record in the EMP table.
Write a PL/SQL block that uses a cursor attribute
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_emp_dept20 IS
        SELECT EMPNO, SAL
        FROM EMP
        WHERE DEPTNO = 20
        FOR UPDATE OF SAL NOWAIT;
        v_emp_rec      c_emp_dept20%ROWTYPE;
    	v_rows_updated NUMBER := 0;

BEGIN
    IF NOT c_emp_dept20%ISOPEN THEN
        OPEN c_emp_dept20;
   	 END IF;
	LOOP
        FETCH c_emp_dept20 INTO v_emp_rec;
        
        EXIT WHEN c_emp_dept20%NOTFOUND;
        INSERT INTO EMP_UPDATE (EMPNO, OLD_SAL, NEW_SAL)
        VALUES (v_emp_rec.EMPNO, v_emp_rec.SAL, v_emp_rec.SAL * 1.05);

        UPDATE EMP
        SET SAL = v_emp_rec.SAL * 1.05
        WHERE CURRENT OF c_emp_dept20;

        v_rows_updated := c_emp_dept20%ROWCOUNT;
    END LOOP;
    CLOSE c_emp_dept20;
    IF v_rows_updated > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_rows_updated || ' employees in department 20 had their salary raised by 5%. Changes logged to EMP_UPDATE.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employees found in department 20 to update.');
    END IF;

    COMMIT; -- Commit the transaction

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/