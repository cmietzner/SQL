declare @UserID int
Declare @DBID int
Declare @UserName varchar (255)
Declare @DBName varchar (255)
Declare @DBDesc varchar (255)
set @UserName = 'Regression_8'
set @DBName = 'Cole_HiltonUS_8x'
set @DBDesc = 'Cole Hilton US 8x'
if exists (select id from Uniportal..WatsonDatabase where name = @DBDesc)
                select @DBID = id from Uniportal..WatsonDatabase where name = @DBDesc
else
BEGIN
                insert into Uniportal..WatsonDatabase values (@DBDesc, '//dco-d-sql-002/' + @DBName, 'sa', 'CCADBA97C4AA632310147CD62F227F35', 'mssql', NULL, 0)
                select @DBID = @@Identity
                exec ('update Uniportal..WatsonDatabase set WatsonVersion = (select DatabaseVersion from ' + @DBName + '..watsonVersion) where id = ' + @DBID)
END
if exists (select id from Uniportal..PortalUser where LoginID = @UserName)
                select @UserID = id from Uniportal..PortalUser where LoginID = @UserName
else
BEGIN
                insert into Uniportal..PortalUser values (@UserName, '0E308F6C7C37F640', 'cmietzner@unifocus.com', 1, 'Y', 1, 'Red', Null, Null, 'en_US', 1, @DBID, 'N')
                select @UserID = @@Identity
END
if not exists (select UserID from Uniportal..UserDatabase where UserID = @UserID and DatabaseID = @DBID)
                insert into Uniportal..UserDatabase values (@UserID, @DBID)
exec('if not exists (select id from ' + @DBName + '..WatsonUser where Name = '' + @UserName + '') 
                insert into ' + @DBName + '..WatsonUser (Name, Flags) values ('' + @UserName + '', 1)')

