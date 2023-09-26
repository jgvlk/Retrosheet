INSERT INTO [dbo].[ParkMaster] (
    [RetroParkID]
    ,[Name]
    ,[AKA]
    ,[City]
    ,[State]
    ,[Start]
    ,[End]
    ,[League]
    ,[Notes]
)
SELECT DISTINCT
    [RetroParkID] = UPPER([ParkID])
    ,[Name]
    ,[AKA]
    ,[City]
    ,[State]
    ,[Start]
    ,[End]
    ,[League]
    ,[Notes]
FROM
	[raw].[ParkMaster]
ORDER BY
	[RetroParkID]
