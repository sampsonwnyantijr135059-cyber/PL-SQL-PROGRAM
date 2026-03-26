--CREATE TABLE Employee (
    E_id INT PRIMARY KEY,
    Ename VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Emp (E_id, Ename, Age, Salary) VALUES
(1, 'John', 50, 60000.00),
(2, 'Alice', 28, 45000.00),
(3, 'Bob', 35, 50000.00),
(4, 'Carol', 50, 75000.00);
SET SERVEROUTPUT ON; 

DECLARE

    e_no_emp_found EXCEPTION;
 
    CURSOR c_emp_age_50 IS
        SELECT Ename, Salary
        FROM Emp
        WHERE Age = 50;
    v_emp_rec c_emp_age_50%ROWTYPE;
    v_count NUMBER := 0;

BEGIN
 
    OPEN c_emp_age_50;
    LOOP
        
        FETCH c_emp_age_50 INTO v_emp_rec;
        EXIT WHEN c_emp_age_50%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Emp Name: ' || v_emp_rec.Ename || ', Salary: ' || v_emp_rec.Salary);
        v_count := v_count + 1;
    END LOOP;
    CLOSE c_emp_age_50;

    IF v_count = 0 THEN
        RAISE e_no_emp_found; -- Raise the user-defined exception
    END IF;

EXCEPTION
    WHEN e_no_emp_found THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with age 50.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/