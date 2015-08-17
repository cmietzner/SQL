WITH      
RevenueCenters as 
(SELECT DISTINCT RevenueCenterName, PeriodName, AssignmentID  FROM AssignmentRCPeriod),      
ScheduledByDayPart as 
(
	SELECT 
		JobID, sum(CASE WHEN IncludeInProductivity = 'Y' THEN dbo.NetHoursByRevenueCenter(RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName, 1, EmployeeShift.ShiftDate + EmployeeShift.StartTime, EmployeeShift.ShiftDate + EmployeeShift.EndTime, EmployeeShift.JobID) ELSE 0 END) as ScheduledProductiveHours,
		sum(CASE WHEN IncludeInProductivity = 'N' THEN dbo.NetHoursByRevenueCenter(RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName, 1, EmployeeShift.ShiftDate + EmployeeShift.StartTime, EmployeeShift.ShiftDate + EmployeeShift.EndTime, EmployeeShift.JobID) ELSE 0 END) as ScheduledNonProductiveHours,
		RevenueCenterName,PeriodName 
	FROM 
		RevenueCenters INNER JOIN EmployeeShift ON (EmployeeShift.JobID = RevenueCenters.AssignmentID AND EmployeeShift.ShiftTypeCode = 'S' AND EmployeeShift.ShiftDate = '2013-08-01' AND EmployeeShift.JobID IN  (SELECT ID FROM Assignment WHERE PropertyID = 6))   
		INNER JOIN ShiftCategory ON (ShiftCategory.ID = EmployeeShift.ShiftCategoryID)      
	GROUP BY 
		JobID, RevenueCenterName, PeriodName  
),
ScheduledByDay as 
(  
	SELECT
		JobID as JobID, ISNULL(sum(CASE WHEN IncludeInProductivity = 'Y' THEN NetHours ELSE 0 END), 0) as ScheduledProductiveHours, ISNULL(sum(CASE WHEN IncludeInProductivity = 'N' THEN NetHours ELSE 0 END), 0) as ScheduledNonProductiveHours  
	FROM 
		ScheduleJobSummaryQuery  
	WHERE 
		StatDate = '2013-08-01' AND 
		JobID IN (SELECT ID FROM Assignment WHERE PropertyID = 6 )  
	GROUP BY 
		JobID  
),      
ActualsByDayPart as 
(  
	SELECT     
		JobID, sum(CASE WHEN IncludeInProductivity = 'Y' THEN dbo.NetHoursByRevenueCenter(RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName, 1, EmployeeShift.ShiftDate + EmployeeShift.StartTime, 
		EmployeeShift.ShiftDate + EmployeeShift.EndTime, EmployeeShift.JobID) ELSE 0 END) as ActualProductiveHours,       
		sum(CASE WHEN IncludeInProductivity = 'N' THEN dbo.NetHoursByRevenueCenter(RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName, 1, EmployeeShift.ShiftDate + EmployeeShift.StartTime, 
		EmployeeShift.ShiftDate + EmployeeShift.EndTime, EmployeeShift.JobID) ELSE 0 END) as ActualNonProductiveHours,       
		RevenueCenterName, PeriodName  
	FROM             
		RevenueCenters INNER JOIN EmployeeShift ON (EmployeeShift.JobID = RevenueCenters.AssignmentID AND EmployeeShift.ShiftTypeCode = 'A' AND EmployeeShift.ShiftDate = '2013-08-01' AND EmployeeShift.JobID IN (SELECT ID FROM Assignment WHERE PropertyID = 6))           
		INNER JOIN ShiftCategory ON (ShiftCategory.ID = EmployeeShift.ShiftCategoryID)  
	GROUP BY 
		JobID, RevenueCenterName, PeriodName  
),      
ActualsByDay as 
(  
	SELECT      
		JobID, ISNULL(sum(CASE WHEN IncludeInProductivity = 'Y' THEN ISNULL(RegHours, 0) ELSE 0 END) + sum(CASE WHEN IncludeInProductivity = 'Y' THEN ISNULL(OTHours, 0) ELSE 0 END) + sum(CASE WHEN IncludeInProductivity = 'Y' THEN ISNULL(DTHours, 0) ELSE 0 END) + sum(CASE WHEN IncludeInProductivity = 'Y' THEN ISNULL(BankedHours, 0) ELSE 0 END), 0) as ActualProductiveHours,        
		ISNULL(sum(CASE WHEN IncludeInProductivity = 'N' THEN ISNULL(RegHours, 0) ELSE 0 END) + sum(CASE WHEN IncludeInProductivity = 'N' THEN ISNULL(OTHours, 0) ELSE 0 END) + sum(CASE WHEN IncludeInProductivity = 'N' THEN ISNULL(DTHours, 0) ELSE 0 END) + sum(CASE WHEN IncludeInProductivity = 'N' THEN ISNULL(BankedHours, 0) ELSE 0 END), 0) as ActualNonProductiveHours     
	FROM     
		ActualJobSummaryQuery  
	WHERE 
		StatDate = '2013-08-01' AND 
		JobID IN (SELECT ID FROM Assignment WHERE PropertyID = 6)   
	GROUP BY 
		JobID  
),      
StandardsByDayPart as 
(  
	SELECT      
		JobclassID as JobID, sum(dbo.NetHoursByRevenueCenter(RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName, Requirement.NumberShifts, Requirement.RequirementDate + Requirement.StartTime, Requirement.StartTime + Requirement.RequirementDate + Requirement.LengthTime, Requirement.JobclassID)) as StandardHours,      
		RevenueCenterName, PeriodName   
	FROM 
		Requirement JOIN RevenueCenters ON Requirement.JobclassID = RevenueCenters.AssignmentID   
	WHERE          
		RequirementCode = 'S' AND 
		Requirement.RequirementDate = '2013-08-01' AND 
		Requirement.JobclassID IN (SELECT ID FROM Assignment WHERE PropertyID = 6)   
	GROUP BY 
		JobclassID, RevenueCenterName, PeriodName 
),      
StandardsByDay as 
(  
	SELECT      
		JobclassID as JobID, ISNULL(sum(StandardHours), 0) as StandardHours  
	FROM 
		StandardJobSummaryQuery  
	WHERE 
		StatDate = '2013-08-01' AND 
		JobclassID IN (SELECT ID FROM Assignment WHERE PropertyID = 6 )  
	GROUP BY 
		JobclassID  
),      
ProjectedByDayPart as 
(  
	SELECT      
		JobclassID as JobID, sum(dbo.NetHoursByRevenueCenter(RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName, Requirement.NumberShifts, Requirement.RequirementDate + Requirement.StartTime, Requirement.StartTime + Requirement.RequirementDate + Requirement.LengthTime, Requirement.JobclassID)) as ProjectedHours,      
		RevenueCenterName, PeriodName  
	FROM 
		Requirement JOIN RevenueCenters ON Requirement.JobclassID = RevenueCenters.AssignmentID  
	WHERE 
		RequirementCode = 'F' AND 
		Requirement.RequirementDate = '2013-08-01' AND 
		Requirement.JobclassID IN (SELECT ID FROM Assignment WHERE PropertyID = 6)  
	GROUP BY 
		JobclassID, RevenueCenterName, PeriodName  
),      
ProjectedByDay as 
(  
	SELECT     
		JobclassID as JobID, ISNULL(sum(ForecastHours), 0) as ProjectedHours  
	FROM 
		ForecastJobSummaryQuery  
	WHERE 
		StatDate = '2013-08-01' AND 
		JobclassID IN (SELECT ID FROM Assignment WHERE PropertyID = 6 )  
	GROUP BY 
		JobclassID  
)  
SELECT 
	SelectedAssignments.DivisionID as DivisionID, SelectedAssignments.DivisionName as DivisionName, SelectedAssignments.DepartmentID as DepartmentID, SelectedAssignments.DepartmentName as DepartmentName, 
	SelectedAssignments.JobID as JobID, SelectedAssignments.JobName as JobName, coalesce(ScheduledHours.RevenueCenterName, ActualHours.RevenueCenterName, StandardHours.RevenueCenterName, 
	ProjectedHours.RevenueCenterName) as RevenueCenterName, coalesce(ScheduledHours.PeriodName, ActualHours.PeriodName, StandardHours.PeriodName, ProjectedHours.PeriodName) as PeriodName,  
	ISNULL(ScheduledHours.ScheduledProductiveHours, 0) as ScheduledProductiveHours, ISNULL(ScheduledHours.ScheduledNonProductiveHours, 0) as ScheduledNonProductiveHours, 
	ISNULL(ActualHours.ActualProductiveHours, 0) as ActualProductiveHours, ISNULL(ActualHours.ActualNonProductiveHours, 0) as ActualNonProductiveHours, ISNULL(StandardHours.StandardHours, 0) as StandardHours,      
	ISNULL(ProjectedHours.ProjectedHours, 0) as ProjectedHours  
FROM  
(
	(
		SELECT 
			Jobclass.ID as JobID, Jobclass.Name as JobName, Department.ID as DepartmentID, Department.Name as DepartmentName, Division.ID as DivisionID, Division.Name as DivisionName, 
			RevenueCenters.PeriodName, RevenueCenters.RevenueCenterName  
		FROM 
			Assignment Division INNER JOIN Assignment Department ON (Department.ParentAssignmentID = Division.ID AND Division.ParentAssignmentID IS NULL AND  Division.PropertyID = 6 AND Department.PropertyID = 6 AND  1=1 )       
			INNER JOIN Assignment Jobclass ON (Jobclass.ParentAssignmentID = Department.ID AND Jobclass.PropertyID = 6 AND  Jobclass.ID IN (2200,2202,2203,2205,2193,2194,2620,2195,2196,2197,2198,2199,67296,2187,2189,2188,2191,2190,26399,2219,2218,2493,2494,2495,2133,2511,2510,2509,2508,2507,2129,2506,2128,2505,2504,2503,2141,2502,2501,2142,2500,2137,2499,2136,2498,2497,2139,2496,2117,2527,2119,2114,2520,2115,2124,2125,2519,2126,2127,2517,2514,2120,2121,2512,2122,2513,2167,2169,2148,69697,2156,2157,2155) )       
			INNER JOIN RevenueCenters ON (Jobclass.ID = RevenueCenters.AssignmentID))  
		UNION All   
		(
			SELECT 
				Jobclass.ID as JobID, Jobclass.Name as JobName, Department.ID as DepartmentID, Department.Name as DepartmentName, Division.ID as DivisionID, Division.Name as DivisionName, 
				null as PeriodName, null as RevenueCenterName  
			FROM 
				Assignment Division INNER JOIN Assignment Department ON (Department.ParentAssignmentID = Division.ID AND Division.ParentAssignmentID IS NULL AND  Division.PropertyID = 6 AND Department.PropertyID = 6 AND  1=1 )       
				INNER JOIN Assignment Jobclass ON (Jobclass.ParentAssignmentID = Department.ID AND Jobclass.PropertyID = 6 AND Jobclass.ID IN (2200,2202,2203,2205,2193,2194,2620,2195,2196,2197,2198,2199,67296,2187,2189,2188,2191,2190,26399,2219,2218,2493,2494,2495,2133,2511,2510,2509,2508,2507,2129,2506,2128,2505,2504,2503,2141,2502,2501,2142,2500,2137,2499,2136,2498,2497,2139,2496,2117,2527,2119,2114,2520,2115,2124,2125,2519,2126,2127,2517,2514,2120,2121,2512,2122,2513,2167,2169,2148,69697,2156,2157,2155) ))) as SelectedAssignments     
				LEFT JOIN 
				(
					SELECT * FROM ScheduledByDayPart       
					UNION ALL      
					SELECT 
						*, null as RevenueCenterName, null as PeriodName       
					FROM 
						ScheduledByDay
				) as ScheduledHours ON (ScheduledHours.JobID = SelectedAssignments.JobID AND ((ScheduledHours.PeriodName = SelectedAssignments.PeriodName) OR (ScheduledHours.PeriodName IS NULL AND SelectedAssignments.PeriodName IS NULL)) AND ((ScheduledHours.RevenueCenterName = SelectedAssignments.RevenueCenterName) OR (ScheduledHours.RevenueCenterName IS NULL AND SelectedAssignments.RevenueCenterName IS NULL)))      
				LEFT JOIN      
				(
					SELECT * FROM ActualsByDayPart        
					UNION ALL       
					SELECT *, null as RevenueCenterName, null as PeriodName FROM ActualsByDay
				) as ActualHours ON (ActualHours.JobID = SelectedAssignments.JobID AND ((ActualHours.PeriodName = SelectedAssignments.PeriodName) OR (ActualHours.PeriodName IS NULL AND SelectedAssignments.PeriodName IS NULL)) AND ((ActualHours.RevenueCenterName = SelectedAssignments.RevenueCenterName) OR (ActualHours.RevenueCenterName IS NULL AND SelectedAssignments.RevenueCenterName IS NULL)))      
				LEFT JOIN      
				(
					SELECT * FROM StandardsByDayPart       
					UNION ALL      
					SELECT *, null as RevenueCenterName, null as PeriodName FROM StandardsByDay
				) as StandardHours ON (StandardHours.JobID = SelectedAssignments.JobID AND ((StandardHours.PeriodName = SelectedAssignments.PeriodName) OR (StandardHours.PeriodName IS NULL AND SelectedAssignments.PeriodName IS NULL)) AND ((StandardHours.RevenueCenterName = SelectedAssignments.RevenueCenterName) OR (StandardHours.RevenueCenterName IS NULL AND SelectedAssignments.RevenueCenterName IS NULL)))      
				LEFT JOIN      
				(
					SELECT * FROM ProjectedByDayPart        
					UNION ALL       
					SELECT *, null as RevenueCenterName, null as PeriodName FROM ProjectedByDay) as ProjectedHours ON (ProjectedHours.JobID = SelectedAssignments.JobID  AND ((ProjectedHours.PeriodName = SelectedAssignments.PeriodName) OR (ProjectedHours.PeriodName IS NULL AND SelectedAssignments.PeriodName IS NULL)) AND ((ProjectedHours.RevenueCenterName = SelectedAssignments.RevenueCenterName) OR (ProjectedHours.RevenueCenterName IS NULL AND SelectedAssignments.RevenueCenterName IS NULL)))


Update STATISTICS dbo.EmployeeShift