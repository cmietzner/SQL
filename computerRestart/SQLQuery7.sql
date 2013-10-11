SELECT * from WatsonUser where name LIKE '356164'

select * FROM uniportal..WatsonDatabase where name LIKE '%red%robin%'

SELECT * FROM uniportal..PortalUser where DefaultDatabaseID = 684

SELECT * from Employee where EmpID in ('222684','220081','358261','122314','220962','356164') AND PropertyID = 8

INSERT into PropertyData (PropertyID,Tag,TagValue) VALUES ('8', 'demoScenarioParamsA', '147,101,115,79,102,109')

SELECT * from EmployeejobStatus where EmployeeID = 147
SELECT * from EmployeeJobStatus where EmployeeID IN ('147','101','115','79','102','109') AND JobID = 369

SELECT * from Employee where LastName = 'lang'