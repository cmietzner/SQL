SELECT TOP 10 * from changegroup 
join changeitem  on changeitem.id = changegroup.issueid
where AUTHOR = 'cmietzner' AND changeitem.Field = 'status' AND CONVERT(varchar(MAX),changeitem.newvalue) = '6'
ORDER BY CREATED


/* Things I need:
	ChangeGroup.Author, ChangeGroup.Created, changeitem.oldstring, changeitem.newstring
	
	
	|User		|#Created|#Reopened|#Closed|
	|cmietzner	|	15	 |	 11	   |   9   |
	
*/

SELECT cg.AUTHOR as 'User',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '3' THEN 1 ELSE 0 END) as '#In Progress',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '4' THEN 1 ELSE 0 END) as '#Reopened',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '5' THEN 1 ELSE 0 END) as '#Resolved',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '6' THEN 1 ELSE 0 END) as '#Closed',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '1' THEN 1 ELSE 0 END) as '#Opened',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '10001' THEN 1 ELSE 0 END) as '#Entered',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '10052' THEN 1 ELSE 0 END) as '#Development Completed',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '10054' THEN 1 ELSE 0 END) as '#Ready To Do',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '10055' THEN 1 ELSE 0 END) as '#In QA',
	sum(CASE WHEN CONVERT(varchar(MAX),ci.newvalue) = '10057' THEN 1 ELSE 0 END) as '#Needs Documentation'
FROM changeitem ci
join changegroup cg on ci.id = cg.issueid 
where CREATED BETWEEN '01/01/13' and '12/31/13'
AND cg.AUTHOR IN ('jstano','apane','pfitzgerald','belder','mszwedo','cmietzner','dclark','shummel','rsteer', 'jfreeland', 'chluchan','jjones', 'cmcgrath')
GROUP BY cg.Author
ORDER BY #Reopened


SELECT top 10 * from changegroup
SELECT * FROM changeitem ci where CONVERT(varchar(MAX),ci.newvalue) = '6' and groupid in (select ID  from changegroup where AUTHOR = 'dclark')

SELECT reporter, COUNT(reporter) AS numoccurences
FROM jiraissue
WHERE created >= '01/01/13' and reporter in ('jstano','apane','pfitzgerald','belder','mszwedo','cmietzner','dclark','shummel','rsteer', 'jfreeland', 'chluchan','jjones', 'cmcgrath')
GROUP BY reporter HAVING ( COUNT(reporter) > 1);
/**
SELECT	 ID, pname from issuestatus order by pname
WHERE    ID IN (1,3,4,5,6,10001, 10052, 10054, 10055, 10057)
ORDER BY ID
*/