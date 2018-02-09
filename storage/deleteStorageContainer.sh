#!/bin/bash

id_domain=$1
id_domain_usr=$2
id_domain_pwd=$3
storage_domain="Storage-"$id_domain
storage_container=$4

echo "Getting Auth token"
curl -v -H GET -H "X-Storage-User: $storage_domain:$id_domain_usr" -H "X-Storage-Pass: $id_domain_pwd" https://storage.us2.oraclecloud.com/auth/v1.0 &> response.txt

auth_token="$(awk '/X-Auth-Token:/{b=$3}END{print b}' response.txt)"
echo $auth_token

echo "Deleting container: $storage_domain/$storage_container"
curl -v  https://storage.us2.oraclecloud.com/v1/$storage_domain/$storage_container -X DELETE -H "X-Auth-Token: ${auth_token}" -o response.txt

cat response.txt
