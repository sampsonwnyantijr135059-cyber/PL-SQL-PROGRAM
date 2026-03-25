--PL/SQL block using a parameterized cursor that displays the department wise basic salary of each employee and department wise total gross salary.
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_departments IS
        SELECT DISTINCT deptno FROM emp ORDER BY deptno;
     
    CURSOR c_employees (p_deptno NUMBER) IS
        SELECT empno, ename, sal -- Assuming 'sal' is basic salary
        FROM emp
        WHERE deptno = p_deptno;
        
    v_total_gross_salary NUMBER(10, 2);

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Department-wise Salary Report ---');
    
    FOR dept_rec IN c_departments LOOP
        v_total_gross_salary := 0; -- Reset total salary for each department
        
        DBMS_OUTPUT.PUT_LINE(' ');
        DBMS_OUTPUT.PUT_LINE('*****************************************************');
        DBMS_OUTPUT.PUT_LINE('Department No: ' || dept_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('*****************************************************');
        DBMS_OUTPUT.PUT_LINE(RPAD('Employee No', 15) || RPAD('Employee Name', 15) || RPAD('Basic Salary', 15));
        
        FOR emp_rec IN c_employees(dept_rec.deptno) LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(emp_rec.empno, 15) || RPAD(emp_rec.ename, 15) || RPAD(emp_rec.sal, 15));
            
            v_total_gross_salary := v_total_gross_salary + emp_rec.sal;
        END LOOP;
   
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Total Gross Salary for Dept ' || dept_rec.deptno || ': ' || v_total_gross_salary);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('--- End of Report ---');

END;
/