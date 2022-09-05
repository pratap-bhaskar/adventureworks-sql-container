#!/bin/bash

if [ ! -f adventureworks.bak ]; then
    echo "Downloading AdventureWorks OLTP backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak -O adventureworks.bak -q 
    echo "Download complete."
else
    echo "AdventureWorks OLTP backup file already downloaded. Skipping."
fi
if [ ! -f adventureworks-dw.bak ]; then
    echo "Downloading AdventureWorks data warehouse backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2019.bak -O adventureworks-dw.bak -q
    echo "Download complete."
else
    echo "AdventureWorks data warehouse backup file already downloaded. Skipping."
fi
if [ ! -f adventureworks-light.bak ]; then
    echo "Downloading AdventureWorks light backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak -O adventureworks-light.bak -q
    echo "Download complete."
else
    echo "AdventureWorks light backup file already downloaded. Skipping."
fi
echo "Building OLTP docker image."
docker build . -t pratapgowda/sql-adventureworks:2022-latest --build-arg BAK_FILE=./adventureworks.bak
docker tag pratapgowda/sql-adventureworks:2022-latest pratapgowda/sql-adventureworks:2022-oltp
echo "Building data warehouse docker image."
docker build . -t pratapgowda/sql-adventureworks:2022-datawarehouse --build-arg BAK_FILE=./adventureworks-dw.bak
echo "Building light docker image."
docker build . -t pratapgowda/sql-adventureworks:2022-light --build-arg BAK_FILE=./adventureworks-light.bak