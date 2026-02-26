---program to calculate the total, percentage and grade of student based on his/her Rollno from RESULT table. (Create RESULT table with Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Total, Per, Grade attributes with appropriate data type).
CREATE TABLE RESULT (
    Rollno NUMBER(3) PRIMARY KEY,
    Name VARCHAR2(100),
    Sub1 NUMBER(3),
    Sub2 NUMBER(3),
    Sub3 NUMBER(3),
    Sub4 NUMBER(3),
    Sub5 NUMBER(3),
    Total NUMBER(4),
    Per NUMBER(5, 2),
    Grade VARCHAR2(20)
);

--Insert a sample record where Total, Per, and Grade are initially set to NULL.
sql
INSERT INTO RESULT (Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (101, 'John Doe', 75, 80, 65, 90, 70);
set serveroutput on
DECLARE
    v_rollno NUMBER(3) := &Enter_Roll_Number; -- User input for Rollno
    v_total NUMBER(4);
    v_per NUMBER(5, 2);
    v_grade VARCHAR2(20);
    v_max_marks_per_subject NUMBER := 100;
    v_total_subjects NUMBER := 5;
    v_total_possible_marks NUMBER;

BEGIN
 -- Enable DBMS_OUTPUT for seeing the results in SQL*Plus or SQL Developer
    DBMS_OUTPUT.ENABLE(NULL);
    
    v_total_possible_marks := v_max_marks_per_subject * v_total_subjects;

-- Calculate total marks
    SELECT (Sub1 + Sub2 + Sub3 + Sub4 + Sub5)
    INTO v_total
    FROM RESULT2
    WHERE Rollno = v_rollno;

-- Calculate percentage
    v_per := (v_total / v_total_possible_marks) * 100;

    -- Determine the grade based on percentage
    IF v_per >= 75 THEN
        v_grade := 'Distinction';
    ELSIF v_per >= 60 THEN
        v_grade := 'First Class';
    ELSIF v_per >= 45 THEN
        v_grade := 'Second Class';
    ELSIF v_per >= 40 THEN
        v_grade := 'Pass Class';
    ELSE
        v_grade := 'Fail';
    END IF;

-- Update the RESULT table with calculated values
    UPDATE RESULT2
    SET Total = v_total,
        Per = v_per,
        Grade = v_grade
    WHERE Rollno = v_rollno;

-- Commit the transaction
    COMMIT;

 -- Display the result
    DBMS_OUTPUT.PUT_LINE('Student Record Updated Successfully!');
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_rollno);
    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_per || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student found with Roll No ' || v_rollno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
