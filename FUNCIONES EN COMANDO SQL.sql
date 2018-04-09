/**FUNCIONES EN COMANDO SQL**/

-- RECTRICICONES
--  --SOLO PARAMETRO DE TIPO IN
    --DEBE DE ESTAR EN LA bd
    --DEBE DE DEVOLVER UN DATO SQL O PLSQL
    --

-- CREACION DE LA FUNCION
CREATE OR REPLACE FUNCTION CALC_TAX_F
    (EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE,
        T1 IN NUMBER)
RETURN NUMBER
IS  
    TAX NUMBER := 0;
    SAL NUMBER := 0;
BEGIN
    IF T1 < 0 OR T1 > 60 THEN
        RAISE_APPLICATION_ERROR (-20000, 'EL PORCENTAJE DEBE ESTAR ENTRE 0 Y 60');
    END IF;
    SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID = EMPL;
    TAX := SAL * T1/100;
    RETURN TAX;
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('NO EXISTE EL EMPLEADO');
END;
/

--  LLAMAR A LA FUNCION OCUPANDO COMANDOS SQL

SELECT FIRST_NAME, SALARY, CALC_TAX_F(EMPLOYEE_ID,18) FROM EMPLOYEES;