#!/bin/bash

# wait for SQL server to comeup
sleep 30s

echo "Restoring database"

# Run the restore script
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i restore.sql
echo
echo 'Done installing database'
echo 'Server is ready'

sleep infinity
