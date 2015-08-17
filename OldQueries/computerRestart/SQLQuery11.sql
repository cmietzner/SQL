select	
	ID as DivisionID,
	Name as DivisionName,
	DateEntry.startDate as FromDate,
	DateEntry.endDate as ToDate,
		(
			select 
				ISNULL((sum(ISNULL(RegHours, 0)) + 
				sum(ISNULL(OTHours, 0)) + 
				sum(ISNULL(DTHours, 0)) + 
				sum(ISNULL(BankedHours, 0))), 0) as TotalActualHours 
	from 
		ActualJobSummaryQuery
	where 
		(
			StatDate BETWEEN DateEntry.startDate and DateEntry.endDate
		)
		AND JobID in 
			(
				select Assignment.ID
				From assignment 
				where propertyid = 38 and levelid in (select id from laborlevel where level = 3)

			))
			from Division,
	(select '07/05/2012' as startDate, '07/06/2012' as endDate) as DateEntry
where Division.PropertyID = 38
ORDER BY DivisionName

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------			
