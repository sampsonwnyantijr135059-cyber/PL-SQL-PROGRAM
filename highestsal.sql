--PL/SQL block that using a Exlpicit Cursor attribute
%ROWCOUNT to display the name, department and basic salary of first 5 employees getting the highest basic salary.
SET SERVEROUTPUT ON;
DECLARE
    CURSOR emp_cursor IS
        SELECT E.ename, E.deptno, E.sal
        FROM emp E
        ORDER BY E.sal DESC;

    v_ename  emp.ename%TYPE;
    v_deptno emp.deptno%TYPE;
    v_sal    emp.sal%TYPE;
    v_count  NUMBER := 0; -- Optional: to track the count manually

BEGIN
    DBMS_OUTPUT.PUT_LINE('Name       Department   Salary');
    DBMS_OUTPUT.PUT_LINE('---------- ------------ ------------');

    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_ename, v_deptno, v_sal;

        EXIT WHEN emp_cursor%NOTFOUND OR emp_cursor%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE(RPAD(v_ename, 10) || ' ' || RPAD(v_deptno, 12) || ' ' || v_sal);

  END LOOP;

    CLOSE emp_cursor;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        -- Ensure the cursor is closed in case of an exception
        IF emp_cursor%ISOPEN THEN
            CLOSE emp_cursor;
        END IF;
END;
/