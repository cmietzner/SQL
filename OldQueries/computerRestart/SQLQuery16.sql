SELECT 
	employeeshiftid, count (*) from rg_hiltonus..EmployeeShiftAdjustment 
where 
	source <> 'M' and employeeshiftid in (SELECT id from EmployeeShift where ShiftDate BETWEEN '5/26/2013' and  '6/1/13') 
group by 
	EmployeeShiftID HAVING count (*) > 2


SELECT * from EmployeeShiftAdjustment where employeeshiftid IN (114703859)

SELECT * FROM Employeeshift where id = 114703859


SELECT employeeShiftid, count (*) from EmployeeShiftAdjustment where EmployeeShiftID IN (SELECT id from EmployeeShift where ShiftDate BETWEEN '5/26/2013' and  '6/1/13') GROUP BY EmployeeShiftID having count(*) > 1

SELECT * FROM employeeshiftadjustment where employeeshiftid in (SELECT employeeShiftid from EmployeeShiftAdjustment where EmployeeShiftID IN (SELECT id from EmployeeShift where ShiftDate BETWEEN '5/26/2013' and  '6/1/13') and changedbyuserid = 3358 GROUP BY EmployeeShiftID having count(*) > 1)

SELECT * FROM WatsonUser where id IN (1542,1923)



INSERT into WatsonUser VALUES ('rg', 1, 1)

SELECT * from WatsonTask order by StartDateTime desc


SELECT * from Assignment where LevelID = 181 

select * from laborlevel where PropertyID = 61




SELECT employeeshiftid, count(*) from EmployeeShiftAdjustment where source <> 'M' group by EmployeeShiftID HAVING count (*) > 2

DROP DATABASE DEVELOP03_Airbags

DROP DATABASE justin_rg
