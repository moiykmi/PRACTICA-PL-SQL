/**PRACTICA DE EXCEPCIONES**/

-- PRACTICA 1
DECLARE
    NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
    ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
    ID := 10000;
    SELECT FIRST_NAME INTO NOMBRE 
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = ID; -- LANZA LA EXCEPCION NO_DATA_FOUND
    DBMS_OUTPUT.PUT_LINE('NOMBRE DEL EMPLEADO : '||NOMBRE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('EMPLEADO INEXISTENTE');
END;

/

-- PRACTICA 2
DECLARE
    NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO NOMBRE 
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID > 100; -- LANZA LA EXCEPCION TOO_MANY_ROWS
    DBMS_OUTPUT.PUT_LINE('NOMBRE DEL EMPLEADO : '||NOMBRE);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('DEMASIADOS EMPLEADOS EN LA CONSULTA');
END;
/

-- PRACTICA 3
DECLARE
    SALARIO EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY/0 INTO SALARIO 
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100; -- LANZA LA EXCEPCION TOO_MANY_ROWS
    DBMS_OUTPUT.PUT_LINE('SALARIO DEL EMPLEADO : '||SALARIO);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

/

-- PRACTICA 4
DECLARE
    DUPLICADA EXCEPTION;
    PRAGMA EXCEPTION_INIT(DUPLICADA, -00001);
BEGIN
    
    INSERT INTO REGIONS (REGION_ID,REGION_NAME)VALUES(2,'ANTARTICA');
    
EXCEPTION
    WHEN DUPLICADA THEN
        DBMS_OUTPUT.PUT_LINE('CLAVE DUPLICADA, INTENTE OTRA');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR INDEFINDO');
END;


