SELECT count (id) from BL_hiltonUS..EmployeeShiftAdjustment
SELECT count (id) from RG_hiltonUS..EmployeeShiftAdjustment

select * FROM RG_hiltonUS..ShiftQuery where id = 120164426
select * FROM BL_hiltonUS..ShiftQuery where id = 118912840

select * FROM RG_hiltonUS..ShiftQuery where EmployeeID = 31698 and ShiftDate  = '2013-05-30'

select * FROM BL_hiltonUS..ShiftQuery where EmployeeID = 31698 and ShiftDate  = '2013-05-30'

select * FROM bl_hiltonUS..employeeshiftadjustment where EmployeeShiftID = 110451184
select * FROM RG_hiltonUS..employeeshiftadjustment where EmployeeShiftID = 110451184


SELECT count (ID) FROM rg_hiltonus..EmployeeShiftAdjustment where EmployeeShiftID IN (select ID from rg_hiltonus..ShiftQuery where ShiftDate BETWEEN '5/26/2013' and '6/1/2013' AND PropertyID = 61)

SELECT count (ID) FROM bl_hiltonus..EmployeeShiftAdjustment where EmployeeShiftID IN (select ID from bl_hiltonus..ShiftQuery where ShiftDate BETWEEN '5/26/2013' and '6/1/2013' AND PropertyID = 61)

SELECT * from property where ID = 61

SELECT * from Employee where id = 21585

SELECT * from EmployeeJobStatus where EmployeeID = 21585

SELECT * from rg_hiltonus..EmployeeShiftadjustment where employeeshiftid in (SELECT id from Employeeshift where EmployeeID = 3442 and ShiftDate = '05/29/2013')
SELECT employeeshiftid, count(*) from EmployeeShiftadjustment where employeeshiftid in (SELECT id from Employeeshift where ShiftDate = '05/29/2013')  group by employeeshiftid having count (*) > 2

select * from RuleItem where id = 15

select * FROM RG_hiltonUS..ShiftQuery where ID = 110451184
select * FROM bl_hiltonUS..ShiftQuery where ID = 110451184


SELECT employeeshiftid from BL_hiltonUS..EmployeeShiftAdjustment where employeeshiftID NOT IN (SELECT employeeshiftID from RG_hiltonUS..EmployeeShiftAdjustment)



126596139
126596140
126596142
126596143
126596144
126993702
126993703
126993704
126993706


SELECT employeeshiftid, count (*) from EmployeeShiftAdjustment where source <> 'M' group by EmployeeShiftID HAVING count (*) > 2 --1628
SELECT employeeshiftid, count (*) from rg_hiltonus..EmployeeShiftAdjustment where source <> 'M' and employeeshiftid not in (SELECT employeeshiftid from bl_hiltonus..EmployeeShiftAdjustment where source <> 'M' group by EmployeeShiftID HAVING count (*) > 2) group by EmployeeShiftID HAVING count (*) > 2 --2081



SELECT * from employeeshiftadjustment where Employeeshiftid = 124461213
SELECT * FROM EmployeeShift where ID = 124461213

SELECT * FROM PlannedShift where id = 215910069

SELECT * from Employee where id = 31731
SELECT * from WatsonTask order by StartDateTime desc