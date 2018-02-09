set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback

BEGIN
  FOR r IN (select sid,serial# from v$session where username = 'JULES')
  LOOP
    EXECUTE IMMEDIATE 'alter system kill session ''' || r.sid 
      || ',' || r.serial# || '''';
  END LOOP;
END;
/

BEGIN
  APEX_INSTANCE_ADMIN.REMOVE_WORKSPACE('JULES','Y','Y');
END;
/

set verify on feedback on define on
prompt  ...done

exit
