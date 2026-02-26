--A PL/SQL block which displays gross salary of employees as per user input EID. (Consider EMP table with EID, EName, Deptno, Deptname Gender, Age, BasicSal) with appropriate data types.) Gross_Salary: BASICSAL + (DA + HRA + Medical) – PF.
Rules: HRA = 15% of basic, DA = 50% of basic, Medical = Rs. 500, PF = 10% of basic.

-- Create the EMP table
CREATE TABLE EMP2 (
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(100),
    Deptno NUMBER,
    Deptname VARCHAR2(100),
    Gender VARCHAR2(10),
    Age NUMBER,
    BasicSal NUMBER(10, 2)
);

-- Insert sample records
INSERT INTO EMP2 (EID, EName, Deptno, Deptname, Gender, Age, BasicSal) VALUES (1, 'John Doe', 10, 'IT', 'Male', 30, 50000.00);
INSERT INTO EMP (EID, EName, Deptno, Deptname, Gender, Age, BasicSal) VALUES (2, 'Jane Smith', 20, 'HR', 'Female', 25, 60000.00);

-- Commit the changes
COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_eid       EMP2.EID%TYPE := &Enter_Employee_ID; 
    v_basicsal  EMP2.BasicSal%TYPE;
    v_hra       NUMBER(10, 2);
    v_da        NUMBER(10, 2);
    v_medical   CONSTANT NUMBER(10, 2) := 500.00;
    v_pf        NUMBER(10, 2);
    v_gross_salary NUMBER(10, 2);
BEGIN

    SELECT BasicSal
    INTO v_basicsal
    FROM EMP2
    WHERE EID = v_eid;

    -- Calculate HRA (15% of basic), DA (50% of basic), and PF (10% of basic)
    v_hra := v_basicsal * 0.15;
    v_da := v_basicsal * 0.50;
    v_pf := v_basicsal * 0.10;

    -- Calculate Gross Salary: BASICSAL + (DA + HRA + Medical) – PF
    v_gross_salary := v_basicsal + v_da + v_hra + v_medical - v_pf;

    -- Display the results
    DBMS_OUTPUT.PUT_LINE('--- Salary Details for EID: ' || v_eid || ' ---');
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_basicsal);
    DBMS_OUTPUT.PUT_LINE('HRA (15%):    ' || v_hra);
    DBMS_OUTPUT.PUT_LINE('DA (50%):     ' || v_da);
    DBMS_OUTPUT.PUT_LINE('Medical:      ' || v_medical);
    DBMS_OUTPUT.PUT_LINE('PF (10%):     ' || v_pf);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    DBMS_OUTPUT.PUT_LINE('Gross Salary: ' || v_gross_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_eid || ' not found in the EMP table.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
