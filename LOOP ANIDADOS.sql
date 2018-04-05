/**LOOP ANIDADOS**/

DECLARE 
    S PLS_INTEGER := 0;
    I PLS_INTEGER := 0;
    J PLS_INTEGER;
BEGIN
    <<PARENT>> --ETIQUETAS
    LOOP
        --PRINT PARENT
        I := I + 1;
        J := 100;
        DBMS_OUTPUT.PUT_LINE('PARENT:'||I);
        <<CHILD>> --ETIQUETAS
        LOOP
            --PRINT CHILD
            EXIT PARENT WHEN (I > 3);
            DBMS_OUTPUT.PUT_LINE('CHILD:'||J);
            J := J + 1;
            EXIT CHILD WHEN (J > 105);
        END LOOP CHILD;        
    END LOOP PARENT;
    DBMS_OUTPUT.PUT_LINE('FINISH¡¡¡');
END;