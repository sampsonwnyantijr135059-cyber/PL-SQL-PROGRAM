--Write a function that returns balance for given account number. (Create ACCOUNT table with ACNO, CNAME, BNAME, BALANCE columns using appropriate datatypes)
set serveroutput on;
CREATE OR REPLACE FUNCTION get_balance (
    p_acno IN NUMBER
)
RETURN NUMBER
IS
    v_balance NUMBER;
BEGIN
    SELECT BALANCE INTO v_balance
    FROM ACCOUNT
    WHERE ACNO = p_acno;

    RETURN v_balance;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN -1; 
    WHEN OTHERS THEN
        RETURN NULL;
END;
/
--call Function Using PL/SQL Block
DECLARE
    v_bal NUMBER;
BEGIN
    v_bal := get_balance(101);

    IF v_bal = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Account not found!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Balance: ' || v_bal);
    END IF;
END;
/