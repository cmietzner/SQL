with count as (
SELECT DISTINCT EmployeeID, Employee.empid, Employee.name, dbo.WasActiveOnDateNoLOA(employee.ID, getdate()) as wasActive FROM EmployeeJobStatus 
join employee on employee.id = employeejobstatus.employeeid and GetDate() between EmployeeJobStatus.StartDate and EmployeeJobStatus.EndDate
where JobID IN (SELECT id from Assignment where PropertyID = 8))

SELECT * from count where wasActive = 'N'





