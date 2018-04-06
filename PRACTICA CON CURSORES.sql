/**PRACTICA CON CURSORES**/

DECLARE 
    CURSOR CR IS SELECT * FROM EMPLOYEES;
    EMPL EMPLOYEES%ROWTYPE;
BEGIN
    OPEN CR;
    LOOP
        FETCH CR INTO EMPL;
        EXIT WHEN CR%NOTFOUND;
        IF EMPL.FIRST_NAME = 'Steven' AND EMPL.LAST_NAME = 'King' THEN 
            RAISE_APPLICATION_ERROR(-20010, 'EL SUELDO DEL JEFE NO SE PUEDE VER.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('SALARIO : $'||EMPL.SALARY);     
        END IF;
    END LOOP;
    CLOSE CR;
END;
/
SET SERVEROUTPUT ON
DECLARE
DEPARTAMENTO DEPARTMENTS%ROWTYPE;
jefe DEPARTMENTS.MANAGER_ID%TYPE;
CURSOR C1 IS SELECT * FROM EMployees;
CURSOR C2(j DEPARTMENTS.MANAGER_ID%TYPE)
IS SELECT * FROM DEPARTMENTS WHERE MANAGER_ID=j;
begin
for EMPLEADO in c1 loop
open c2(EMPLEADO.employee_id) ;
FETCH C2 into departamento;
if c2%NOTFOUND then
DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME ||' No es JEFE de NADA');
ELSE
DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME || 'ES JEFE DEL DEPARTAMENTO '|| DEPARTAMENTO.DEPARTMENT_NAME);
END IF;
CLOSE C2;
END LOOP;
END;


/*Crear un cursor con parámetros que pasando el número de departamento visualice el número de empleados de ese departamento*/

SET SERVEROUTPUT ON
DECLARE
CODIGO DEPARTMENTS.DEPARTMENT_ID%TYPE;
CURSOR C1(COD DEPARTMENTS.DEPARTMENT_ID%TYPE ) IS SELECT COUNT(*) FROM employeeS
WHERE DEPARTMENT_ID=COD;
NUM_EMPLE NUMBER;
BEGIN
CODIGO:=10;
OPEN C1(CODIGO);
FETCH C1 INTO NUM_EMPLE;
DBMS_OUTPUT.PUT_LINE('numero de empleados de ' ||codigo||' es '||num_emple);
end;


/*Crear un bucle FOR donde declaramos una subconsulta que nos devuelva el nombre de los empleados que sean ST_CLERCK. Es decir, no declaramos el cursor sino que lo indicamos directamente en el FOR.*/


BEGIN

  FOR EMPLE IN(SELECT * FROM EMPLOYEES WHERE JOB_ID='ST_CLERK') LOOP
     DBMS_OUTPUT.PUT_LINE(EMPLE.FIRST_NAME);
    END LOOP;
END;

/*Creamos un bloque que tenga un cursor para empleados. Debemos crearlo con FOR UPDATE.
o Por cada fila recuperada, si el salario es mayor de 8000 incrementamos el salario un 2%
o Si es menor de 800 lo hacemos en un 3%
o Debemos modificarlo con la cláusula CURRENT OF
o Comprobar que los salarios se han modificado correctamente.
*/

SET SERVEROUTPUT ON
DECLARE
CURSOR C1 IS SELECT * FROM EMployees for update;
begin
for EMPLEADO IN C1 LOOP
IF EMPLEADO.SALARY > 8000 THEN
UPDATE EMPLOYEES SET SALARY=SALARY*1.02
WHERE CURRENT OF C1;
ELSE
UPDATE EMPLOYEES SET SALARY=SALARY*1.03
WHERE CURRENT OF C1;
END IF;
END LOOP;
COMMIT;
END ;







