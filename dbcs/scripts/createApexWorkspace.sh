#!/bin/bash

dbcs_ip=$1
dbcs_sys=$2
dbcs_sys_password=$3

echo "running the SQL that creates the Apex workspace on the Server:"
ssh -o StrictHostKeyChecking=no -i dbcs/labkey oracle@$dbcs_ip "sqlplus $dbcs_sys/$dbcs_sys_password@PDB1 AS SYSDBA @createApexWorkspace.sql"
echo "..done."
