/*Restore of Hilton UK baseline database to baseline */

Use Master
GO
	IF EXISTS (SELECT * from sys.databases where name = 'BL_hiltonUK')
		BEGIN
			ALTER DATABASE [BL_hiltonUK]
			SET SINGLE_USER
			WITH ROLLBACK IMMEDIATE;
			DROP DATABASE [BL_hiltonUK];
		END
RESTORE DATABASE [BL_hiltonUK] FROM  DISK = N'G:\MSSQL\BACKUP\baselinehiltonuk.bak' WITH  FILE = 1,  
MOVE N'hiltoneurope' TO N'G:\MSSQL\DATA\baselinehiltonuk.mdf',  
MOVE N'hiltoneurope_log' TO N'G:\MSSQL\DATA\baselinehiltonuk_1.ldf',  NOUNLOAD,  STATS = 10
GO

/*Restore of Hilton UK baseline database to Regression */

Use Master
GO
IF EXISTS (SELECT * from sys.databases where name = 'RG_hiltonUK')
	BEGIN
		ALTER DATABASE [RG_hiltonUK]
		SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
		DROP DATABASE [RG_hiltonUK];
	END
RESTORE DATABASE [RG_hiltonUK] FROM  DISK = N'G:\MSSQL\BACKUP\baselinehiltonuk.bak' WITH  FILE = 1,  
MOVE N'hiltoneurope' TO N'G:\MSSQL\DATA\baselinehiltonukRG.mdf',  
MOVE N'hiltoneurope_log' TO N'G:\MSSQL\DATA\baselinehiltonukRG_1.ldf',  NOUNLOAD,  STATS = 10
GO

/*Restore of Hilton US baseline database to baseline */

Use Master
GO
IF EXISTS (SELECT * from sys.databases where name = 'BL_hiltonUS')
	BEGIN
		ALTER DATABASE [BL_hiltonUK]
		SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
		DROP DATABASE [BL_hiltonUK];
	END
RESTORE DATABASE [BL_hiltonUS] FROM  DISK = N'G:\MSSQL\BACKUP\baselinehiltonus.bak' WITH  FILE = 1,  
MOVE N'hiltonus' TO N'G:\MSSQL\DATA\baselinehiltonus.mdf',  
MOVE N'hiltonus_log' TO N'G:\MSSQL\DATA\baselinehiltonus_1.ldf',  NOUNLOAD,  STATS = 10
GO

/*Restore of Hilton US baseline database to Regression */

Use Master
GO
IF EXISTS (SELECT * from sys.databases where name = 'RG_hiltonUS')
	BEGIN
		ALTER DATABASE [RG_hiltonUS]
		SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
		DROP DATABASE [RG_hiltonUS];
	END
RESTORE DATABASE [RG_hiltonUS] FROM  DISK = N'G:\MSSQL\BACKUP\baselinehiltonus.bak' WITH  FILE = 1,  
MOVE N'hiltonus' TO N'G:\MSSQL\DATA\baselinehiltonusRG.mdf',  
MOVE N'hiltonus_log' TO N'G:\MSSQL\DATA\baselinehiltonusRG_1.ldf',  NOUNLOAD,  STATS = 10
GO


INSERT INTO BL_HiltonUS..watsonUser (Name,Flags,DefaultPropertyID) VALUES ('bl', 1,1)



use BL_HiltonUS
select * from DivDptJobOpcodeQuery where OpcodeID in 
(8,13,10,15,9,14,12,11,54,56,55,53,52,25,16,39,37,353,24,23,38,27,21,40,42,22,41,58,57,61,18,26,49,50,20,19,43,44,28,29,46,47,59,72,60,62,354)
 order by lower(OpcodeName), lower(DivisionName),lower(DepartmentName),lower(JobclassName)