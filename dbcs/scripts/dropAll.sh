#!/bin/bash

dbcs_ip=$1
dbcs_sys=$2
dbcs_sys_password=$3

echo "--//--"
echo "removing ALL: Apex App, Apex Workspace, Apex users, dropping DB Schema"
ssh -o StrictHostKeyChecking=no -i dbcs/labkey oracle@$dbcs_ip "sqlplus $dbcs_sys/$dbcs_sys_password@PDB1 AS SYSDBA @dropAll.sql"
echo "..done."
echo "--//--"
