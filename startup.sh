#!/bin/bash

echo "Starting server..."
/opt/mssql/bin/sqlserver & ./restore.sh
