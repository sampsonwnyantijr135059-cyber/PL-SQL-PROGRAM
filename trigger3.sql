--A trigger to insert the values into the NEWEMP table when the records are inserted into the EMP table.
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER insert_into_newemp
AFTER INSERT
ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (
        :NEW.empno,
        :NEW.ename,
        :NEW.job,
        :NEW.mgr,
        :NEW.hiredate,
        :NEW.sal,
        :NEW.comm,
        :NEW.deptno
    );
END;
/