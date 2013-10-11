select ID as DivisionID,
	Name as DivisionName,
	DateEntry.startDate as FromDate,
	DateEntry.endDate as ToDate,
	
	/* actual hours */
	(select ISNULL((sum(ISNULL(RegHours, 0)) + sum(ISNULL(OTHours, 0)) + sum(ISNULL(DTHours, 0)) + sum(ISNULL(BankedHours, 0))), 0) as TotalActualHours 
	from ActualJobSummaryQuery
	where (StatDate between DateEntry.startDate and DateEntry.endDate)
		AND JobID in (
			SELECT	ID as JobClassId
			FROM Assignment
			WHERE ParentAssignmentID is null)) as ActualHours
			
	/*/* standard hours */
	(select ISNULL(sum(StandardHours), 0) as StandardHours
	from StandardJobSummaryQuery
	where (StatDate between DateEntry.startDate and DateEntry.endDate)
		AND JobclassID in (
			SELECT ID as JobClassId
			FROM Assignment
			WHERE ParentAssignmentID IS NULL)) as StandardHours,
			
	/* scheduled hours */
	(select ISNULL(sum(NetHours), 0) as ScheduledHours
	from ScheduleJobSummaryQuery
	where (StatDate>=DateEntry.startDate and StatDate < DateEntry.endDate)
		AND JobID in (
			SELECT	id
			FROM Assignment
			WHERE ParentAssignmentID IS NULL)) as ScheduledHours,
			
	/* projected hours */
	(select ISNULL(sum(ForecastHours), 0) as ProjectedHours
	from ForecastJobSummaryQuery
	where (StatDate>=DateEntry.startDate and StatDate < DateEntry.endDate)
		AND JobclassID in (
			SELECT	ID as JobClassId
			FROM Assignment
			WHERE ParentAssignmentID IS NULL)) as ProjectedHours*/
from Assignment,
	(select '2012-07-05 00:00:00.000' as startDate, '2012-07-06 00:00:00.000' as endDate) as DateEntry
where PropertyID = 38 AND ParentAssignmentID IS null;


/*
DivisionID	DivisionName	FromDate	ToDate	ActualHours	StandardHours	ScheduledHours	ProjectedHours
26272	F&B OUTLETS	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	765.00	0	0.00	0
26269	KITCHENS	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	1059.75	0	0.00	0
42764	Z-HODS	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	0.00	0	0.00	0
25695	OTHERS	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	131.00	0	0.00	0
25696	Rooms	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	1844.50	0	0.00	0
25693	ADMIN	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	789.75	0	141.75	0
25694	C&E OPS	2012-07-05 00:00:00.000	2012-07-06 00:00:00.000	1318.00	0	0.00	0*/