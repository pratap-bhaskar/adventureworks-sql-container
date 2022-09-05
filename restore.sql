USE [master]
RESTORE DATABASE [AdventureWorks] 
    FROM DISK = '/adventureworks.bak'
        WITH MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks.mdf',
        MOVE 'AdventureWorks2019_log' TO '/var/opt/mssql/data/AdventureWorks_log.ldf'
GO