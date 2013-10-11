use RG_hiltonUK

SELECT * from employee where id IN (8254,8220,9841,8234)

SELECT * from Assignment where PropertyID = 2 and name LIKE 'D%'

select * FROM jobclasslabordata where statdate BETWEEN '1/4/2013' and '1/10/2013' AND jobclassid = 26401

/** Budget Labor Summary Report Query **/
SELECT
	div.DivisionName as Division, 
	div.DepartmentName as Department, 
	div.JobclassName as Job, 
		sum(sh.ForecastHours) as ForecastHours, 
		sum(sh.StandardHours) as StandardHours 
from 
	JobclassLaborData sh
Join DivDptJobQuery as div on sh.JobclassID = div.JobclassID
where 
	statdate BETWEEN '7/1/2012' and '7/16/2012' 
	and div.PropertyID = 2 
GROUP BY 
	div.divisionName, div.DepartmentName, div.JobclassName 
ORDER By 
	div.DivisionName
	
	
	
	
	
	
	
	
	
	

SELECT * from JobclassLaborData where Jobclassid = 26401

SELECT * from JobclassLaborData 
where statdate BETWEEN '7/1/2013' and '7/17/2013' AND JobclassID = 1842 

SELECT * from BL_hiltonUK..JobclassLaborData 
where statdate BETWEEN '6/30/2012' and '7/17/2012' AND JobclassID = 1842 



SELECT 
	sum(WorkedHours) as WorkedHours, 
	sum(NetDollars)as NetDollars, 
	sum(RegDollars)as RegDollars, 
	sum(regHours) as RegHours,
	sum(OTHours)as OTHours, 
	sum(DTHours)as DTHours, 
	sum(WorkedHours + RegHours) as totalHours  
from AuxLaborHoursQuery al 
Join ShiftCategory shift on al.ShiftCategoryID = Shift.id
where al.PropertyID = 2 and StatDate BETWEEN '7/1/2013' and '7/16/2013'  

SELECT *  from AuxLaborHoursQuery where PropertyID = 2 and OTHours IS not null

SELECT sum(WorkedHours), sum(NetHours), sum(RegHours), sum(regDollars) FROM employeeshift where ShiftTypeCode = 'A' AND ShiftDate between '7/1/2012' and '7/16/2012' and JobID = 1842

SELECT * from ShiftCategory where id IN (3,356)

