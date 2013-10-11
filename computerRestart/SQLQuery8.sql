    CREATE PROCEDURE ListTableRowCounts 
    AS 
    BEGIN 
        SET NOCOUNT ON 

        CREATE TABLE #TableCounts
        ( 
            TableName VARCHAR(500), 
            CountOf INT 
        ) 

        INSERT #TableCounts
            EXEC sp_msForEachTable 
                'SELECT PARSENAME(''?'', 1), 
                COUNT(*) FROM ? WITH (NOLOCK)' 

        SELECT TableName , CountOf 
            FROM #TableCounts
            ORDER BY CountOf 

        DROP TABLE #TableCounts
    END
    GO
    
EXEC dbo.sp_ListTableRowCounts

10,629,688