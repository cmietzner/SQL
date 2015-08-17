select *
from EmployeeShift es 
join EmployeeJobStatus ejs 
on es.EmployeeID = ejs.EmployeeID and es.JobID = ejs.JobID 
and es.ShiftDate between ejs.StartDate and ejs.EndDate 
where ejs.ID is null and ShiftDate >= '8/1/2012'



select TOP 10 * from employeeShift