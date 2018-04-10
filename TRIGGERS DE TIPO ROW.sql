/**TRIGGER DE TIPO ROW**/

CREATE OR REPLACE TRIGGER TR3_REGION
BEFORE INSERT OR UPDATE OR DELETE
ON REGIONS
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.REGION_NAME:=UPPER(:NEW.REGION_NAME);
        INSERT INTO LOG_TABLE VALUES ('INSERCION',USER);
    END IF;
    IF UPDATING('REGION_ID') THEN
        INSERT INTO LOG_TABLE VALUES ('UPDATE DE REGION_ID',USER);
    END IF;
     IF UPDATING ('REGION_NAME') THEN
        :NEW.REGION_NAME:=UPPER(:NEW.REGION_NAME);
        INSERT INTO LOG_TABLE VALUES ('UPDATE DE REGION_NAME',USER);
    END IF;
    IF DELETING THEN
        INSERT INTO LOG_TABLE VALUES ('DELETE',USER);
    END IF;
END;

--PROBAR TRIGGER
UPDATE REGIONS SET REGION_ID = REGION_ID + 10;

UPDATE REGIONS SET REGION_NAME = LOWER(REGION_NAME) WHERE REGION_ID = 1090;

INSERT INTO REGIONS VALUES (1080,'prueba minuscula');

