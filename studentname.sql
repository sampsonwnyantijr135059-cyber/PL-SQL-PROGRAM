set serveroutput on;
DECLARE
    v_name   RESULT.student_name%TYPE;
    v_marks  RESULT.marks%TYPE;
    v_grade  RESULT.grade%TYPE;

BEGIN
    v_name := '&Enter_Student_Name';

    SELECT marks, grade
    INTO v_marks, v_grade
    FROM RESULT
    WHERE student_name = v_name;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student does not exist in RESULT table.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple records found for the given student name.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);

END;
/