/**COMANDO CONTINUE**/
DECLARE
    X NUMBER := 0;
BEGIN
    LOOP -- CON CONTINUE SALTAMOS AQUI
        DBMS_OUTPUT.PUT_LINE ('LOOP:  X = ' || TO_CHAR(X));
        X := X + 1;
        /**
        IF x < 3 THEN
              CONTINUE;
        END IF;
        **/
        CONTINUE WHEN X < 3; -- OTRO FORMATO
        DBMS_OUTPUT.PUT_LINE('DESPUES DE CONTINUE: X = '||TO_CHAR(X));
        EXIT WHEN X = 5;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('DESPUES DEL LOOP: X = '||TO_CHAR(X));
END;