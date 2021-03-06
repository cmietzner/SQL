USE master;

ALTER DATABASE SQL_Tuning SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE SQL_Tuning
FROM DISK = N'C:\dbBak\CreditBackup100.bak'
WITH FILE = 1,
	MOVE N'CreditData' TO
		N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQL_TuningData.mdf',
	MOVE N'CreditLog' TO
		N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQL_TuningLog.ldf',
		NOUNLOAD, STATS = 5;

ALTER DATABASE SQL_Tuning SET MULTI_USER;
GO