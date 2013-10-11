select Employeeid, count(*) FROM redrobin_qa..employeewatsonusermap group by employeeid having count(*) > 1


SELECT * from employeejobstatus where employeeid = 518 and enddate >= getdate() ORDER BY jobid

SELECT * from assignment where id in (SELECT jobid from employeejobstatus where employeeid = 518 and enddate >= getdate()) ORDER BY name

SELECT * from property

select * From employeejobstatus where jobid IN (SELECT id from assignment where propertyID IN (15, 16)) AND home = 'y'

