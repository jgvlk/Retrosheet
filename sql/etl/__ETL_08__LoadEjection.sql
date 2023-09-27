INSERT INTO [dbo].[Ejection] (
	[Date]
	,[RetroGameID]
    ,[GameID]
    ,[RetroTeamID]
	,[TeamID]
    ,[Ejectee]
    ,[EjecteePlayerID]
    ,[Umpire]
    ,[UmpirePlayerID]
    ,[DH]
    ,[Job]
    ,[Inning]
    ,[Reason]
)
SELECT
    [Date] = TRY_CAST(a.[Date] AS DATE)
	,[RetroGameID] = a.[GameID]
	,[GameID] = b.[GameID]
	,[RetroTeamID] = a.[Team]
    ,[TeamID] = c.[TeamID]
    ,[Ejectee]
    ,[EjecteePlayerID] = d.[PlayerID]
    ,[Umpire]
    ,[UmpirePlayerID] = e.[PlayerID]
    ,[DH]
    ,[Job]
    ,[Inning]
    ,[Reason]
FROM
    [raw].[Ejection] a
    LEFT JOIN [dbo].[Game] b ON a.[GameID] = b.[RetroGameID]
    LEFT JOIN [dbo].[TeamMaster] c ON a.[Team] = c.[RetroTeamID]
    LEFT JOIN [dbo].[PlayerMaster] d ON a.[Ejectee] = d.[RetroPlayerID]
    LEFT JOIN [dbo].[PlayerMaster] e ON a.[Umpire] = e.[RetroPlayerID]
ORDER BY
    TRY_CAST(a.[Date] AS DATE)
    ,a.[GameID]
