CREATE TABLE #DBVersion 
(
   DatabaseName varchar(MAX),
   DatabaseVersion char(100)
) 
GO

Declare @command varchar(MAX) 
set @command = 'Use [?];
		IF EXISTS (Select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = ''WatsonVersion'')
			BEGIN
				SELECT ''?'', DatabaseVersion 
				as DatabaseVersion
				FROM watsonversion
			END
			
		Else 
			Select ''?'', WatsonVersion 
			FROM Uniportal..WatsonDatabase where DatabaseURL = ''//dco-d-sql-001/'' + ''?'''
			 
		
INSERT INTO #DBVersion
EXECUTE sp_MSforeachdb @command
GO

SELECT *
FROM #DBVersion
GO

DROP TABLE #DBVersion
GO

SELECT * from watsonversion

select * From TESTING_813_MotorCity..watsonVersion 