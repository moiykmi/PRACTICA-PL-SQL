/**COMANDO GOTO**/

DECLARE 
    P VARCHAR2 (30);
    N PLS_INTEGER := 4;
BEGIN
    FOR J IN 2..ROUND(SQRT(N)) LOOP
        IF N MOD J =0 THEN
            P := ' NO ES UN NUMERO PRIMO';
            GOTO PRINT_NOW;
        END IF;            
    END LOOP;
    
    P:= ' ES UN NUMERO PRIMO';
    
    <<PRINT_NOW>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(N) || P);
END;