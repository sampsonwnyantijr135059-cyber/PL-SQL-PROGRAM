SET SERVEROUTPUT ON;
DECLARE
    CURSOR top_earners_cursor IS
        SELECT ename, sal
        FROM (
            SELECT ename, sal
            FROM emp -- Assuming the table name is 'emp' with columns 'ename' and 'sal'
            ORDER BY sal DESC
        )
        WHERE ROWNUM <= 3;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 Highest Paid Employees:');
    DBMS_OUTPUT.PUT_LINE('-----------------------------');

    FOR emp_record IN top_earners_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp_record.ename || ', Salary: ' || emp_record.sal);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('-----------------------------');

END;
/