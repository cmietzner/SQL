USE uniportal
GO

select DatabaseURL from watsonDatabase where databaseUrl LIKE '%dco%' AND DatabaseURL NOT IN 
				(
					select '//dco-d-sql-001/' + Name from sys.databases)
					
/*DELETE from watsonDatabase where databaseUrl LIKE '%dco%' AND DatabaseURL NOT IN 
				(
					select '//dco-d-sql-001/' + Name from sys.databases)*/
select * from watsonDatabase where databaseUrl LIKE '%dco%' AND DatabaseURL NOT IN 
				(
					select '//dco-d-sql-001/' + Name from sys.databases)


SELECT * FROM PortalUser where DefaultDatabaseID NOT in (SELECT ID from WatsonDatabase)

SELECT * from propertydata where id = 112
1	synelEarlyBackThreshold	0.5	NULL	112
DELETE from propertydata where id = 112

SELECT * from propertydata where propertyid = 1

selec