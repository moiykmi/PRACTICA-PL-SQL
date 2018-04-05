/**SELECT DENTRO DE PL/SQL**/

SET SERVEROUTPUT ON
DECLARE
    SALARIO NUMBER; -- PARA GUARDAR UN DATO DE UN SELECT
    NOMBRE EMPLOYEES.FIRST_NAME%TYPE; 
BEGIN
    SELECT --SOLO PUEDE DEVOLVER UN FILA
        SALARY,FIRST_NAME INTO SALARIO,NOMBRE 
    FROM 
        EMPLOYEES 
    WHERE 
        EMPLOYEE_ID = 100 ;
    DBMS_OUTPUT.PUT_LINE('NOMBRE :'||NOMBRE||', SALARIO :'||SALARIO);
END;