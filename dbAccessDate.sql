with dbAccess as
	(
		select databaseURL, max(LoginDateTime) as LastAccess 
		from WatsonDatabase 
		join LoginHistory on watsonDatabase.ID = LoginHistory.DatabaseID 
		group by DatabaseURL
	)
select * from dbAccess 
where LastAccess < GETDATE() - 30
order by databaseURL
