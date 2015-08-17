
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
					StatDate BETWEEN DateEntry.startDate and 
					DateEntry.endDate
				)
			AND JobID in 
				(
					SELECT	
						Jobclass.ID as JobClassId
					FROM JobClass
						INNER JOIN Department as JobDepartments on (Jobclass.DepartmentID=JobDepartments.ID)
						INNER JOIN Division as JobDivisions on (JobDepartments.DivisionID = JobDivisions.ID)
					WHERE 
						JobDivisions.ID = Division.ID
						
				)
		)
from Division,
	(select '07/05/2012' as startDate, '07/06/2012' as endDate) as DateEntry
where Division.PropertyID = 38
ORDER BY DivisionName





