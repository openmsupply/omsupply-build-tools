#!/bin/bash

rm -rf env_export
mkdir env_export
cp build-info.txt env_export/
cp remote_server_postgres.log env_export/
cp remote_server_sqlite.log env_export/ 
cp postgresql_start.log env_export/
cp nginx_start.log env_export/

echo "$(printenv)" > env_export/env.txt

gosu postgres pg_dump omsupply-database > env_export/pg_dump.sql
cp omsupply-database env_export/omsupply-database.sqlite

rm env_export.zip
zip -r env_export.zip env_export
