	#!/bin/bash

dbcs_ip=$1
dbcs_sys=$2
dbcs_sys_password=$3

echo "--//--"
echo "running the SQL that loads data into the DB schema"
ssh -o StrictHostKeyChecking=no -i dbcs/labkey oracle@$dbcs_ip "sqlplus $dbcs_sys/$dbcs_sys_password@PDB1 AS SYSDBA @loadApexData.sql"
echo "..done"
echo "--//--"
