/***USO DE FUNCIONES EN PAQUETE EN SQL*/


CREATE OR REPLACE PACKAGE PACK1
IS  
   FUNCTION CONVERT (NAME VARCHAR2,CONVERSION_TYPE CHAR) RETURN VARCHAR2;
END;
/

-- LA CABEZERA Y EL CUERPO SE HACEN POR SEPARADO

CREATE OR REPLACE PACKAGE BODY PACK1
IS
    FUNCTION UP (NAME VARCHAR2)
        RETURN VARCHAR2
    IS 
    BEGIN
        RETURN UPPER (NAME);
    END UP;

    FUNCTION DO (NAME VARCHAR2)
        RETURN VARCHAR2
    IS
    BEGIN
        RETURN LOWER (NAME);
    END DO;

FUNCTION CONVERT (NAME VARCHAR2, CONVERSION_TYPE CHAR) RETURN VARCHAR2
IS 
BEGIN
    IF CONVERSION_TYPE = 'U' OR CONVERSION_TYPE = 'u'  THEN
        RETURN(UP(NAME));
    ELSIF CONVERSION_TYPE = 'L' OR CONVERSION_TYPE = 'l' THEN
        RETURN(DO(NAME));
    ELSE
        DBMS_OUTPUT.PUT_LINE('EL PARAMETRO DEBE SER U O L');
    END IF;
END CONVERT;

END PACK1;



-- LLAMAR LA FUNCION QUE ESTA EN EL PAQUETE
SELECT 
    FIRST_NAME,PACK1.CONVERT(FIRST_NAME,'L')
FROM 
    EMPLOYEES;





