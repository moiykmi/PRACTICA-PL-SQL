/**BUCLE FOR**/

-- EJEMPLO 1
SET SERVEROUTPUT ON
BEGIN
    -- FOR SOLO UTILIZA ENTEROS
    FOR I IN 5..15 LOOP -- PLS_INTEGER
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;

-- EJEMPLO 2 (REVERSE)
SET SERVEROUTPUT ON
BEGIN
    FOR I IN REVERSE 5..15 LOOP -- PLS_INTEGER
        DBMS_OUTPUT.PUT_LINE(I); 
    END LOOP;
END;

-- EJEMPLO 3 (REVERSE) CON EXIT WHEN
SET SERVEROUTPUT ON
BEGIN
    FOR I IN REVERSE 5..15 LOOP -- PLS_INTEGER
        DBMS_OUTPUT.PUT_LINE(I);
        EXIT WHEN  I = 10;
    END LOOP;
END;