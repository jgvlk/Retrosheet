INSERT INTO [dbo].[TeamMaster] (
    [RetroTeamID]
    ,[League]
    ,[City]
    ,[Nickname]
    ,[Start]
    ,[End]
)
SELECT DISTINCT
    [RetroTeamID] = [TeamID]
    ,[League] = CAST([League] AS CHAR(2))
    ,[City]
    ,[Nickname]
    ,[Start] = [First]
    ,[End] = [Last]
FROM
    [raw].[TeamMaster]
ORDER BY
    [RetroTeamID]
    ,[First]
