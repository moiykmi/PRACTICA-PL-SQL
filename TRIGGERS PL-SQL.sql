/**TRIGGERS PL/SQL**/

/**
    DML
    -INSERT 
    -UPDATE
    -DELETE
    
    DDL
    -CREATE
    -DROP
    
    DATABASE
    -LOGON
    -SHUTDOWN
**/

/**TRIGGER DML TIPOS EVENTOS

    TIPOS
    -BEFORE (ANTES DE UNA ACCION)
    -AFTER (DESPUES DE LA ACCION)
    -INSTEAD OF (DETERMINA LA VISTAS POR COMPLEGIDAD)
    
    EVENTOS
    -INSERT
    -UPDATE
    -DELETE
    
    FILAS AFECTADAS
    -STATEMENT (SOLO SE DISPARA UNA VEZ - ORIENTADO A CONTROLAR EL COMANDO COMPLETO)
    -ROW (POR CADA FILA AFECTADA - ORIENTADO A CONTROLAR CADA FILA)
    
**/


/**CREAR UN TRIGGER**/

CREATE TABLE LOG_TABLE (LOG_COLUMN VARCHAR2(200) ,USER_NAME VARCHAR2(200));

CREATE OR REPLACE TRIGGER INS_EMPL
AFTER INSERT ON REGIONS
BEGIN
    INSERT INTO LOG_TABLE VALUES ('INSERCION EN LA TABLA REGIONS',USER);
END;


--  USAR EL TRIGGER
INSERT INTO REGIONS VALUES (1000,'TEST REGIONS');





