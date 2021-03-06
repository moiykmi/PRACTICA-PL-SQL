/**CURSORES CON PARAMETROS**/

DECLARE
    CURSOR C1(SAL NUMBER) IS SELECT * FROM EMPLOYEES
    WHERE SALARY > SAL;
    EMPL EMPLOYEES%ROWTYPE;
BEGIN
    OPEN C1(8000);
    LOOP
        FETCH C1 INTO EMPL;
        EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(EMPL.FIRST_NAME||' '||EMPL.SALARY);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('HE ENCONTRADO '||C1%ROWCOUNT||' EMPLEADOS');
    CLOSE C1;
END;