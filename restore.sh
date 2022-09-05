#!/bin/bash

# wait for SQL server to comeup
sleep 30s

echo "Restoring database"

# Run the restore script
echo "listing out logical file names and paths"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -Q 'RESTORE FILELISTONLY FROM DISK = "/var/opt/mssql/adventureworks.bak"' \
   | tr -s ' ' | cut -d ' ' -f 1-2

echo "restoring the database"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD \
    -Q 'RESTORE DATABASE WideWorldImporters FROM DISK = "/var/opt/mssql/adventureworks.bak" WITH MOVE "AdventureWorks2017" TO "/var/opt/mssql/data/AdventureWorks.mdf", MOVE "AdventureWorks2017_log" TO "/var/opt/mssql/data/AdventureWorks_log.ldf"'


echo
echo 'Done installing database'
echo 'Server is ready'

sleep infinity
