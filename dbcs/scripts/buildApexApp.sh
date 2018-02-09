#!/bin/bash

dbcs_ip=$1
dbcs_sys=$2
dbcs_sys_password=$3

echo "--//--"
echo "Importing Apex app to existing Apex Workspace.."
ssh -o StrictHostKeyChecking=no -i dbcs/labkey oracle@$dbcs_ip "sqlplus $dbcs_sys/$dbcs_sys_password@PDB1 AS SYSDBA @buildApexApp.sql"
echo "..done."
echo "--//--"
