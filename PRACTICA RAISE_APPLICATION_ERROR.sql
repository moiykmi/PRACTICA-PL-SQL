/**PRACTICA RAISE_APPLICATION_ERROR**/

SET SERVEROUTPUT ON
DECLARE
    CONTROL_REGION EXCEPTION;
    REGN NUMBER;
    REGT VARCHAR2(200);
BEGIN
    REGN := 101;
    REGT := 'ASIA OCCIDENTAL';
    
    IF REGN > 100 THEN
        RAISE CONTROL_REGION;
    ELSE
        INSERT INTO REGIONS VALUES (REGN,REGT);
        COMMIT;
    END IF;
EXCEPTION
    WHEN CONTROL_REGION THEN
        RAISE_APPLICATION_ERROR(-20001,'LA ID NO PUEDE SER MAYOR DE 100');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR INDEFINIDO');
END;