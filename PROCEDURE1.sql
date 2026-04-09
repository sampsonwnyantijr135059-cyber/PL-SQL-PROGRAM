--A simple procedure without any parameter that shows user defined message on the screen and also being called

SET SERVEROUTPUT ON;
    CREATE OR REPLACE PROCEDURE show_message IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello! This is a user-defined message.');
END;
/
--CALL PROCEDURE FROM COMMAND LINE
BEGIN
    EXEC show_message;
END;
/