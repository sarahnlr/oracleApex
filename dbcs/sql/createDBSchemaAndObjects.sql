set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback

create user jules identified by oracle;
grant connect,dba to jules;
/
--create Schema Objects
CREATE TABLE  jules."CLIMBSTEST" 
   (	"ID" NUMBER, 
	"ROUTE" VARCHAR2(30), 
	"CRAG" VARCHAR2(30), 
	"CRAG_ID" NUMBER, 
	"GRADE" VARCHAR2(30), 
	"LENGTH" NUMBER, 
	"PITCHES" NUMBER, 
	"STARS" NUMBER, 
	"DATE_CLIMBED" DATE, 
	"LEAD" VARCHAR2(1), 
	"STYLE" VARCHAR2(30), 
	"PARTNER" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(200), 
	 CONSTRAINT "CLIMBSTEST_PK" PRIMARY KEY ("ID") ENABLE
   )
/
CREATE TABLE  jules."CLIMB_LOOKUPS" 
   (	"ID" NUMBER, 
	"TYPE" VARCHAR2(30), 
	"VALUE1" VARCHAR2(30), 
	"VALUE2" VARCHAR2(30), 
	"DISP_ORDER" NUMBER, 
	 CONSTRAINT "CLIMB_LOOKUPS_PK" PRIMARY KEY ("ID") ENABLE
   )
/
CREATE TABLE  jules."CRAGS" 
   (	"ID" NUMBER, 
	"CRAG" VARCHAR2(30), 
	"AREA" VARCHAR2(30), 
	"ROCKTYPE" VARCHAR2(30), 
	"HEIGHT" NUMBER, 
	"ROUTES" NUMBER, 
	"STYLE" VARCHAR2(30), 
	"SUITS" VARCHAR2(30), 
	"ACCESS_TIME" NUMBER, 
	"ASPECT" VARCHAR2(30), 
	"TIDAL" VARCHAR2(1), 
	 CONSTRAINT "CRAGS_PK" PRIMARY KEY ("ID") ENABLE
   )
/
--CREATE UNIQUE INDEX  "CLIMBSTEST_PK" ON  "CLIMBSTEST" ("ID")
--CREATE UNIQUE INDEX  "CLIMB_LOOKUPS_PK" ON  "CLIMB_LOOKUPS" ("ID")
--CREATE UNIQUE INDEX  "CRAGS_PK" ON  "CRAGS" ("ID")
CREATE SEQUENCE   jules."CRAGS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
/
 CREATE SEQUENCE   jules."CLIMB_LOOKUPS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE
/
 CREATE SEQUENCE   jules."CLIMBSTEST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
/
CREATE OR REPLACE TRIGGER  jules."bi_CRAGS" 
  before insert on jules."CRAGS"              
  for each row 
begin  
  if :new."ID" is null then
    select jules."CRAGS_SEQ".nextval into :new."ID" from dual;
  end if;
end;
/
ALTER TRIGGER  jules."bi_CRAGS" ENABLE
/
CREATE OR REPLACE TRIGGER  jules."bi_CLIMB_LOOKUPS" 
  before insert on jules."CLIMB_LOOKUPS"              
  for each row 
begin  
  if :new."ID" is null then
    select jules."CLIMB_LOOKUPS_SEQ".nextval into :new."ID" from dual;
  end if;
end;
/
ALTER TRIGGER  jules."bi_CLIMB_LOOKUPS" ENABLE
/
CREATE OR REPLACE TRIGGER  jules."bi_CLIMBSTEST" 
  before insert on jules."CLIMBSTEST"              
  for each row 
begin  
  if :new."ID" is null then
    select jules."CLIMBSTEST_SEQ".nextval into :new."ID" from sys.dual;
  end if;
end;
/
ALTER TRIGGER  jules."bi_CLIMBSTEST" ENABLE
/

set verify on feedback on define on
prompt  ...done

exit


