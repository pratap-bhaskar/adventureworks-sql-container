# Adventureworks SQL server container

Every POC needs a sample database and Microsoft has `AdventureWorks` sample database created for precisely for the same reason. Unfortunately one has to restore it themselves once they create the a SQL Server container.

This repo restores the `Adventureworks` database directly into the container, so that one can start their work by running the container.

## Usage

There are three versions of the SQL containers

- `pratapgowda/sql-adventureworks:2022-oltp`: Adventureworks database for OLTP.
- `pratapgowda/sql-adventureworks:2022-datawarehouse`: Adventureworks database for Datawarehouse applications.
- `pratapgowda/sql-adventureworks:2022-light`: A light weight Adventureworks database.

Run the following command to get started

```shell
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<SOME-IMPORTANT-PASSWORD>" -p 1433:1433 --name sql2022 -d pratapgowda/sql-2022-adventureworks:light
```
