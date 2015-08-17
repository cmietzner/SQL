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
						ddj.ID as JobClassId
					FROM 
						Assignment ddj
						
					WHERE 
						ddj.ParentAssignmentID IS NULL
				)),(
		select 
			ISNULL(sum(StandardHours), 0) as StandardHours
		from 
			StandardJobSummaryQuery
		where 
			(
				StatDate BETWEEN DateEntry.startDate and DateEntry.endDate
			)
		AND JobClassID in 
				(
					SELECT	
						ddj.ID as JobClassId
					FROM 
						Assignment ddj
						
					WHERE 
						ddj.ParentAssignmentID IS NULL
				)),
	(
		select 
			ISNULL(sum(NetHours), 0) as ScheduledHours
		from 
			ScheduleJobSummaryQuery
		where 
			(
				StatDate BETWEEN DateEntry.startDate and DateEntry.endDate
			)
				AND JobID in 
					(
						SELECT	ddj.ID as JobClassId
						FROM Assignment ddj
						WHERE parentassignmentid is NULL
					)
			),
	(
		select 
			ISNULL(sum(ForecastHours), 0) as ProjectedHours
		From 
			ForecastJobSummaryQuery
		where 
			(StatDate>=DateEntry.startDate and StatDate < DateEntry.endDate)
		AND JobclassID in (
			SELECT	Jobclass.ID as JobClassId
			FROM Jobclass 
				 INNER JOIN Department as JobDepartments on (Jobclass.DepartmentID=JobDepartments.ID)
				 INNER JOIN Division as JobDivisions on (JobDepartments.DivisionID = JobDivisions.ID)
			WHERE JobDivisions.ID = Division.ID))*/
from Division,
	(select '2013-07-05 00:00:00.000' as startDate, '2013-07-06 00:00:00.000' as endDate) as DateEntry
where Division.PropertyID = 38;

/*







































	(select ID 
	from Jobclass
	where DepartmentID in
		(select ID
		from Department
		where DivisionID=25693));
		
SELECT	Jobclass.ID as JobClassId
FROM Jobclass 
	 INNER JOIN Department on (Jobclass.DepartmentID=Department.ID)
	 INNER JOIN Division on (Department.DivisionID = Division.ID)
WHERE Division.ID = 25693;


/* actual hours per division */
select	ID as DivisionID,
		Name as DivisionName,
		(select ISNULL((sum(ISNULL(RegHours, 0)) + sum(ISNULL(OTHours, 0)) + sum(ISNULL(DTHours, 0)) + sum(ISNULL(BankedHours, 0))), 0) as TotalActualHours 
		from ActualJobSummaryQuery
		where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
			AND JobID in (select ID 
				from Jobclass
				where DepartmentID in (
					select ID
					from Department
					where DivisionID=Division.ID
				)
			)) as ActualHours,
		(select ISNULL(sum(StandardHours), 0) as StandardHours
		from StandardJobSummaryQuery
		where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
			AND JobclassID in (select ID 
				from Jobclass
				where DepartmentID in (
					select ID
					from Department
					where DivisionID=Division.ID
				)
			)
		) as StandardHours,
		(select ISNULL(sum(NetHours), 0) as Scheduled
		from ScheduleJobSummaryQuery
		where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
			AND JobID in (select ID 
				from Jobclass
				where DepartmentID in (
					select ID
					from Department
					where DivisionID=Division.ID
				)
			)
		) as NetHours,
		(select ISNULL(sum(ForecastHours), 0) as ProjectedHours
		from ForecastJobSummaryQuery
		where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
			AND JobclassID in (select ID 
				from Jobclass
				where DepartmentID in (
					select ID
					from Department
					where DivisionID=Division.ID
				)
			)
		) as ForecastHours
from Division
where PropertyID = 38;


/* all job classes in Division */
select ID 
from Jobclass
where DepartmentID in
	(select ID
	from Department
	where DivisionID=25693);
		

/* division id is 25693 */

/* actual hours for jobs in this division */
select ISNULL((sum(ISNULL(RegHours, 0)) + sum(ISNULL(OTHours, 0)) + sum(ISNULL(DTHours, 0)) + sum(ISNULL(BankedHours, 0))), 0) as TotalActualHours 
from ActualJobSummaryQuery
where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
	AND JobID in (select ID 
		from Jobclass
		where DepartmentID in (
			select ID
			from Department
			where DivisionID=25693
		)
	);
	
/* standard hours for jobs in this division */
select sum(StandardHours) as StandardHours
from StandardJobSummaryQuery
where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
	AND JobclassID in (select ID 
		from Jobclass
		where DepartmentID in (
			select ID
			from Department
			where DivisionID=25693
		)
	);
	
/* scheduled hours for jobs in this division */
select sum(NetHours) as NetHours
from ScheduleJobSummaryQuery
where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
	AND JobID in (select ID 
		from Jobclass
		where DepartmentID in (
			select ID
			from Department
			where DivisionID=25693
		)
	);
	
/* scheduled hours for jobs in this division */
select sum(ForecastHours) as ForecastHours
from ForecastJobSummaryQuery
where (StatDate>='2013-07-05 00:00:00.000' and StatDate < '2013-07-06 00:00:00.000')
	AND JobclassID in (select ID 
		from Jobclass
		where DepartmentID in (
			select ID
			from Department
			where DivisionID=25693
		)
	);
	

	
	
	
	
	
	
	
select ID 
from Jobclass
where DepartmentID in (
	select ID
	from Department
	where DivisionID=25693
);

select JobID
from ActualJobSummaryQuery
group by JobID
order by JobID;


/* departments in this division */
select *
from Department
where DivisionID=25693;

select *
from Division
where ID=25693;

/* all jobs in this division */
select * 
from Jobclass
where DepartmentID in (
	select ID
	from Department
	where DivisionID=25693
);














select sum(RegHours) as RegHours,sum(OTHours) as OTHours, sum(DTHours) as DTHours,sum(BankedHours) as BankedHours 
from ActualJobSummaryQuery
where StatDate>='2013-07-16 00:00:00.000' and StatDate < '2013-07-17 00:00:00.000';

select *
from Division
where ID in(
	select DivisionID
	from Department
	where ID in (
		select DepartmentID 
		from Jobclass
		where ID in 
			(select JobID 
			from ActualJobSummaryQuery
			where StatDate>='2013-07-16 00:00:00.000' and StatDate < '2013-07-17 00:00:00.000')));
			
select *
from Jobclass
where ID in (
	select JobID
	from ActualJobSummaryQuery
	where StatDate>='2013-07-16 00:00:00.000' and StatDate < '2013-07-17 00:00:00.000'
);

select *
from Department
where ID in (52317, 55675, 55677, 54735, 55661, 55664, 55678);

select *
from Department
where ID in (67736, 17221, 52215, 42630, 55668, 66883, 61719, 68287, 25697);

select * 
from Jobclass
where ID in (
	select ID
	from Department
	where DivisionID in (
		select ID
		from Division
		where Name = 'ADMIN'
	)
);

select *
from Jobclass
order by Name;


select *
from Jobclass
where DepartmentID in (
	select ID 
	from Department
	where DivisionID in (
		select ID 
		from Division 
		where Name = 'ADMIN'
	)
);*/