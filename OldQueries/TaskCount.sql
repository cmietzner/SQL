/* Average Time of Each Task */
Select 
	TaskName, avg(DateDiff(ms, StartDateTime, EndDateTime))as Tasktime 
from watsonTask 
Group BY taskName ORDER by TaskTime Desc

/*Count of most Items run*/
select taskName, TaskNotes, count(*) as 'Count' 
from WatsonTask 
Group By TaskName,taskNotes ORDER BY Count desc

/*Count of Items Run by Property*/
select propertyID, taskName, TaskNotes, count(*) as 'Count' 
from WatsonTask 
Group By PropertyID, TaskName,taskNotes ORDER BY Count desc

/* Count of Tasks run in one Day for all Properties*/ 
SELECT taskname, count(*) as 'Count' 
from watsonTask 
where StartDateTime between '2013-03-01 00:00:00.000' and '2013-03-02 00:00:00.000' 
group by taskname order by count desc

CREATE View SampleData as
SELECT top 25 * From watsonTask
