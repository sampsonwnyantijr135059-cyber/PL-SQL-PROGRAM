--PROGRAM to accept product name, qty and price from user and then calculate discount in Rs. based on the given (%).
SET SERVEROUTPUT ON;
DECLARE
    v_product_name VARCHAR2(100) := '&Enter_Product_Name';
    v_quantity NUMBER := &Enter_Quantity;
    v_unit_price NUMBER := &Enter_Price_per_Unit;

    v_total_amount_before_discount NUMBER;
    v_discount_percentage CONSTANT NUMBER := 10; -- 10% fixed discount
    v_discount_amount_in_rs NUMBER;
    v_final_amount NUMBER;

BEGIN
 
    v_total_amount_before_discount := v_quantity * v_unit_price;

  
    v_discount_amount_in_rs := (v_total_amount_before_discount * v_discount_percentage) / 100;

  
    v_final_amount := v_total_amount_before_discount - v_discount_amount_in_rs;

    DBMS_OUTPUT.PUT_LINE('--- Invoice Summary for ' || v_product_name || ' ---');
    DBMS_OUTPUT.PUT_LINE('Total Amount (Before Discount): Rs. ' || v_total_amount_before_discount);
    DBMS_OUTPUT.PUT_LINE('Discount Applied (' || v_discount_percentage || '%): Rs. ' || v_discount_amount_in_rs);
    DBMS_OUTPUT.PUT_LINE('Final Amount Payable: Rs. ' || v_final_amount);

END;
/