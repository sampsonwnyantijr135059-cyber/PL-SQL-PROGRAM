--A procedure that search’s whether the given employee id is present or not in the table. If employee is found then show its name otherwise
raise appropriate error message (Use both IN and

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE find_employee (
    p_empid   IN  NUMBER,
    p_ename   OUT VARCHAR2
)
IS
BEGIN
    
    SELECT ename INTO p_ename
    FROM emp
    WHERE empno = p_empid;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ename := 'Employee not found!';
    WHEN OTHERS THEN
        p_ename := 'Error: ' || SQLERRM;
END;
/
--CALLIN PROCEDURE
DECLARE
    v_name VARCHAR2(50);
BEGIN
    find_employee(7369, v_name);  

    DBMS_OUTPUT.PUT_LINE('Result: ' || v_name);
END;
/