SET SERVEROUTPUT ON;

DECLARE
    
    NO_DEPT_FOUND EXCEPTION;

    v_dept_no EMP.DEPTNO%TYPE := 99; 
    
    v_row_count NUMBER := 0;

    CURSOR cur_emp_dept IS
        SELECT EMPNO, ENAME, SAL, DEPTNO
        FROM EMP
        WHERE DEPTNO = v_dept_no;

BEGIN
   
    FOR emp_rec IN cur_emp_dept LOOP
      
        INSERT INTO EMP_BACKUP (EMPNO, ENAME, SAL, DEPTNO)
        VALUES (emp_rec.EMPNO, emp_rec.ENAME, emp_rec.SAL, emp_rec.DEPTNO);
       v_row_count := v_row_count + 1;
    END LOOP;
 IF v_row_count = 0 THE
     RAISE NO_DEPT_FOUND;
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_row_count || ' employee records inserted for department ' || v_dept_no || '.');
        COMMIT; -- Commit the transaction if successful
    END IF;

EXCEPTION
    
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No records found for the entered department number ' || v_dept_no || '.');
        ROLLBACK; -- Rollback any potential changes if the exception occurs
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/