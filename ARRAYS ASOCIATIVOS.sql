/**COLECCIONES Y TIPOS COMPUESTOS**/

/**ARRAYS ASOCIATIVOS**/
SET SERVEROUTPUT ON
DECLARE 
    TYPE DEPARTAMENTOS IS TABLE OF 
        DEPARTMENTS.DEPARTMENT_NAME%TYPE
    INDEX BY PLS_INTEGER;
    
     TYPE EMPLEADOS IS TABLE OF 
        EMPLOYEES%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    DEPTS DEPARTAMENTOS;
    EMPLES EMPLEADOS;
BEGIN
    -- TIPO SIMPLE
    DEPTS(1) := 'INFORMATICA';
    DEPTS(2) := 'RRHH';
    DEPTS(55) := 'PRUEBA';
    DBMS_OUTPUT.PUT_LINE(DEPTS(1));
    DBMS_OUTPUT.PUT_LINE(DEPTS(2));
    DBMS_OUTPUT.PUT_LINE(DEPTS.LAST);
    DBMS_OUTPUT.PUT_LINE(DEPTS.FIRST);
    IF DEPTS.EXISTS(3) THEN
        DBMS_OUTPUT.PUT_LINE(DEPTS(3));
    ELSE
        DBMS_OUTPUT.PUT_LINE('ESE VALOR NO EXISTE');
    END IF;
    
    --TIPO COMPUESTO
    SELECT * INTO EMPLES(1) FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(EMPLES(1).FIRST_NAME);
    SELECT * INTO EMPLES(2) FROM EMPLOYEES WHERE EMPLOYEE_ID = 110;
    DBMS_OUTPUT.PUT_LINE(EMPLES(2).FIRST_NAME);
END;
