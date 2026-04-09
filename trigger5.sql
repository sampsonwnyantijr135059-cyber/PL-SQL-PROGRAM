--A trigger to insert the existing values of the EMP table into NEWEMP table when the record is updated in EMP table.

CREATE OR REPLACE TRIGGER backup_emp_on_update
BEFORE UPDATE
ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (
        :OLD.empno,
        :OLD.ename,
        :OLD.job,
        :OLD.mgr,
        :OLD.hiredate,
        :OLD.sal,
        :OLD.comm,
        :OLD.deptno
    );
END;
/