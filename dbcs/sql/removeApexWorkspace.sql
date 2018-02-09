set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback

begin
  APEX_INSTANCE_ADMIN.REMOVE_WORKSPACE('JULES','N','N');
end;
/

set verify on feedback on define on
prompt  ...done

exit
