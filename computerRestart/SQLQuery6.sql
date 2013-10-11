select assignment0_.ID as ID31_0_, assignment0_.abbrev as abbrev31_0_, assignment0_.balancePlannedShiftsByWeek as balanceP3_31_0_, 
assignment0_.balanceSchedules as balanceS4_31_0_, assignment0_.code as code31_0_, assignment0_.dayOrder as dayOrder31_0_, 
assignment0_.departmentalSeniority as departme7_31_0_, assignment0_.eventLabor as eventLabor31_0_, assignment0_.excludeFromPayrollExport as excludeF9_31_0_, 
assignment0_.flags as flags31_0_, assignment0_.fstVarianceFrom as fstVari11_31_0_, assignment0_.fstVarianceTo as fstVari12_31_0_, 
assignment0_.hasStandards as hasStan13_31_0_, assignment0_.JobCategoryID as JobCate38_31_0_, assignment0_.JobRotationPlanID as JobRota39_31_0_, 
assignment0_.lastPublishedDateTime as lastPub14_31_0_, assignment0_.lastPublishedWeekEndDate as lastPub15_31_0_, assignment0_.LevelID as LevelID31_0_, 
assignment0_.LoadShiftCode as LoadShi16_31_0_, assignment0_.lunchAfter as lunchAfter31_0_, assignment0_.lunchDuration as lunchDu18_31_0_, 
assignment0_.lunchMode as lunchMode31_0_, assignment0_.lunchScheduled as lunchSc20_31_0_, assignment0_.MasterJobclassID as MasterJ41_31_0_, 
assignment0_.maxScheduledHours as maxSche21_31_0_, assignment0_.maxShift as maxShift31_0_, assignment0_.MethodCode as MethodCode31_0_, 
assignment0_.minDaysOff as minDaysOff31_0_, assignment0_.minHoursOff as minHour25_31_0_, assignment0_.minShift as minShift31_0_, 
assignment0_.name as name31_0_, assignment0_.overrideShifts as overrid28_31_0_, assignment0_.ParentAssignmentID as ParentA42_31_0_, 
assignment0_.payCode as payCode31_0_, assignment0_.PropertyID as PropertyID31_0_, assignment0_.RotationPlanID as Rotatio44_31_0_, 
assignment0_.salaryMode as salaryMode31_0_, assignment0_.scheduleReliefs as schedul31_31_0_, assignment0_.seniorityBasedScheduling as seniori32_31_0_, 
assignment0_.stdVarianceFrom as stdVari33_31_0_, assignment0_.stdVarianceTo as stdVari34_31_0_, assignment0_.TypeCode as TypeCode31_0_, 
assignment0_.UnitCode as UnitCode31_0_, assignment0_.workersCompClass as workers37_31_0_ 
from Assignment assignment0_ 
where assignment0_.ID= @P0



insert into EppReportData 
	(DTDollars, DTHours, DTRate, OTDollars, OTHours, OTRate, dollarsEarning, DollarsEarningTypeID, 
	empNo, EmployeeID, grossWages, hoursEarning, HoursEarningTypeID, JobclassID, name, otherUnitEarning, OtherUnitEarningTypeID, payCode, 
	PPEndDate, PayTypeCode, PropertyID, regDollars, regHours, regRate) 
values 
	( @P0 ,  @P1 ,  @P2 ,  @P3 ,  @P4 ,  @P5 ,  @P6 ,  @P7 ,  @P8 ,  @P9 ,  @P10 ,  @P11 ,  @P12 ,  @P13 ,  @P14 ,  @P15 ,  @P16 ,  @P17 ,  @P18 ,  
	@P19 ,  @P20 ,  @P21 ,  @P22 ,  @P23 ) 
SELECT SCOPE_IDENTITY() AS ID


select this_.ID as ID70_0_, this_.PIN as PIN70_0_, this_.ada as ada70_0_, this_.address as address70_0_, this_.address2 as address5_70_0_, 
this_.altEmpID as altEmpID70_0_, this_.birthDate as birthDate70_0_, this_.bypassBiometric as bypassBi8_70_0_, this_.city as city70_0_, 
this_.clockAdmin as clockAdmin70_0_, this_.currentPatternNo as current11_70_0_, this_.DayOffPlanID as DayOffP44_70_0_, 
this_.eligible401KDate as eligible12_70_0_, this_.email as email70_0_, this_.emergencyContact as emergen14_70_0_, 
this_.emergencyPhone as emergen15_70_0_, this_.empID as empID70_0_, this_.EmployeeTypeCode as Employe17_70_0_, 
this_.enrolled401KDate as enrolled18_70_0_, this_.extraData as extraData70_0_, this_.firstName as firstName70_0_, 
this_.flags as flags70_0_, this_.gender as gender70_0_, this_.hireDate as hireDate70_0_, this_.homePhone as homePhone70_0_, 
this_.hoursAvailable as hoursAv25_70_0_, this_.lastName as lastName70_0_, this_.lastReviewDate as lastRev27_70_0_, this_.locale as locale70_0_, 
this_.maritalStatus as marital29_70_0_, this_.middleName as middleName70_0_, this_.minDaysOff as minDaysOff70_0_, this_.minHoursOff as minHour32_70_0_, 
this_.mobilePhone as mobileP33_70_0_, this_.name as name70_0_, this_.nextReviewDate as nextRev35_70_0_, this_.numDependents as numDepe36_70_0_, 
this_.orientationDate as orienta37_70_0_, this_.otherPhone as otherPhone70_0_, this_.password as password70_0_, this_.payrollEmpID as payroll40_70_0_, 
this_.EmpClassID as EmpClassID70_0_, this_.PropertyID as PropertyID70_0_, this_.SecEmpClassID as SecEmpC47_70_0_, this_.seniorityDate as seniori41_70_0_, 
this_.StateID as StateID70_0_, this_.tipped as tipped70_0_, this_.WorkClassID as WorkCla49_70_0_, this_.zip as zip70_0_ 
from Employee this_ 
where this_.PropertyID= @P0  and this_.empID= @P1

SELECT count(*) from employee

select count(*) from DEVELOP04_HiltonUS..Employee where PropertyID =1 