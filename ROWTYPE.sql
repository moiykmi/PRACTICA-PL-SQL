/**%ROWTYPE**/

SET SERVEROUTPUT ON
DECLARE
    EMPLEADO EMPLOYEES%ROWTYPE;
BEGIN
    SELECT --SOLO PUEDE DEVOLVER UN FILA
        * INTO EMPLEADO 
    FROM 
        EMPLOYEES 
    WHERE 
        EMPLOYEE_ID = 100 ;
    DBMS_OUTPUT.PUT_LINE('NOMBRE : '||EMPLEADO.FIRST_NAME||', SALARIO : '||EMPLEADO.SALARY);    
END;