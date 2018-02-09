#!/bin/bash

dbcs_ip=$1
dbcs_sys=$2
dbcs_sys_password=$3

echo "copying SQL update Apex file:"
scp -o StrictHostKeyChecking=no -i dbcs/labkey dbcs/sql/updateApexApp.sql oracle@$dbcs_ip:.
echo "..done."

echo "running the SQL update Apex file on the Server:"
ssh -o StrictHostKeyChecking=no -i dbcs/labkey oracle@$dbcs_ip "sqlplus $dbcs_sys/$dbcs_sys_password@PDB1 AS SYSDBA @updateApexApp.sql"
echo "..done."


