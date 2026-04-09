--A simple procedure that increases the basic salary of employees for the given department no by percentage inputted by the user using IN parameter.
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE increase_salary (
    p_deptno   IN NUMBER,
    p_percent  IN NUMBER
)
IS
BEGIN
    UPDATE emp
    SET sal = sal + (sal * p_percent / 100)
    WHERE deptno = p_deptno;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Department ' || p_deptno);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/