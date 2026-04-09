--A trigger to restrict user form accessing the table on weekends

CREATE OR REPLACE TRIGGER restrict_weekend_access
  BEFORE INSERT OR UPDATE OR DELETE
ON ACCOUNT
FOR EACH ROW
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Operation not allowed on weekends!'
        );
    END IF;
END;
/