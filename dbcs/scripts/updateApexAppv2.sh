#!/bin/bash

dbcs_ip=$1
dbcs_sys=$2
dbcs_sys_password=$3

echo "--//--"
echo "copying SetParams and Apex export file to target:"

scp -o StrictHostKeyChecking=no -i dbcs/labkey dbcs/sql/UpdateApp.sql oracle@$dbcs_ip:.
scp -o StrictHostKeyChecking=no -i dbcs/labkey dbcs/sql/NewApexApp.sql oracle@$dbcs_ip:.

echo "..done."

echo "--//--"
echo "Setting Import Params and Importing App:"

ssh -o StrictHostKeyChecking=no -i dbcs/labkey oracle@$dbcs_ip "sqlplus $dbcs_sys/$dbcs_sys_password@PDB1 AS SYSDBA @UpdateApp.sql"

echo "..done."
echo "--//--"