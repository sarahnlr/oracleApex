set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_default_workspace_id=>4778320886300976
);
end;
/
prompt  WORKSPACE 4778320886300976
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   13:19 Thursday August 20, 2015
--   Exported By:     JULES
--   Export Type:     Workspace Export
--   Version:         5.0.1.00.06
--   Instance ID:     102292706338810
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_050000
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>4778320886300976);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace JULES...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 4778415741301005
 ,p_provisioning_company_id => 4778320886300976
 ,p_short_name => 'JULES'
 ,p_display_name => 'JULES'
 ,p_first_schema_provisioned => 'JULES'
 ,p_company_schemas => 'JULES'
 ,p_ws_schema => 'JULES'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'JULES'
 ,p_path_prefix => 'JULES'
 ,p_files_version => 1
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id      => '1662074001943195',
  p_user_name    => 'ENDUSER1',
  p_first_name   => '',
  p_last_name    => '',
  p_description  => '',
  p_email_address=> 't.t@o.com',
  p_web_password => 'F4A0EFA162BAD46A3BF0EBF1EF7169822402E106',
  p_web_password_format  => '5;2;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'JULES',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201508131546','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id      => '4778215765300975',
  p_user_name    => 'JULES',
  p_first_name   => '',
  p_last_name    => '',
  p_description  => '',
  p_email_address=> 'ju@o.com',
  p_web_password => '23C11A2EE25FE07F451B1034E404701074A9D37E',
  p_web_password_format  => '5;2;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'JULES',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201507271628','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
prompt Check (removed by Edi) Compatibility...
--begin
-- This date identifies the minimum version required to import this file.
--wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
--end;
--/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...news
--
begin
null;
end;
/
--
prompt ...links
--
begin
null;
end;
/
--
prompt ...bugs
--
begin
null;
end;
/
--
prompt ...events
--
begin
null;
end;
/
--
prompt ...features
--
begin
null;
end;
/
--
prompt ...tasks
--
begin
null;
end;
/
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...task defaults
--
begin
null;
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

exit
