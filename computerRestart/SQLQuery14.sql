alter table dbo.Assignment add RoundingThresholdBelowOne float 
go 
alter table dbo.Assignment add RoundingThresholdAboveOne float 
go 
alter table dbo.Property add RoundingThresholdBelowOne float 
go 
alter table dbo.Property add RoundingThresholdAboveOne float 
go 
update Property set RoundingThresholdBelowOne = 0.0 
go 
update Property set RoundingThresholdAboveOne = 0.2 
go 
