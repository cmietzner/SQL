USE [DEVELOP04_Fairmont]
--Planned Shift Page Compression
ALTER TABLE [dbo].[PlannedShift] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = PAGE
)
GO

--BudgetStaffStat Page Compression
ALTER TABLE [dbo].[BudgetStaffStat] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = PAGE
)
GO

--BudgetKBIStat Page Compression
ALTER TABLE [dbo].[BudgetKBIStat] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = PAGE
)
GO

--EmployeeShiftAdjustment Page Compression
ALTER TABLE [dbo].[EmployeeShiftAdjustment] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = PAGE
)
GO

--Requirement Page Compression
ALTER TABLE [dbo].[Requirement] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = PAGE
)
GO

--EmployeeShiftError Page Compression
ALTER TABLE [dbo].[EmployeeShiftError] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = PAGE
)
GO