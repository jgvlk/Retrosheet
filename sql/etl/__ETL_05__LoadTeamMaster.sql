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
    ,[League]
    ,[City]
    ,[Nickname]
    ,[Start] = [First]
    ,[End] = [Last]
FROM
    [raw].[TeamMaster]
ORDER BY
    [RetroTeamID]
    ,[First]
