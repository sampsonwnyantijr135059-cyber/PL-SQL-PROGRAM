--A trigger that restricts the entry of record in EMP table if salary is greater than Rs 50000.

  CREATE OR REPLACE TRIGGER restrict_salary
  BEFORE INSERT OR UPDATE OF sal
  ON emp
  FOR EACH ROW
BEGIN
    IF :NEW.sal > 50000 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Salary cannot be greater than Rs 50000!'
        );
    END IF;
END;
/