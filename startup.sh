#!/bin/bash

echo "Starting server..."
/opt/mssql/bin/sqlservr & ./restore.sh
