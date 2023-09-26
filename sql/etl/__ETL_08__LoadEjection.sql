INSERT INTO [dbo].[Ejection] (
	[RetroGameID]
    ,[GameID]
    ,[RetroTeamID]
	,[TeamID]
    ,[EjecteePlayerID]
    ,[UmpirePlayerID]
    ,[DH]
    ,[Job]
    ,[Inning]
    ,[Reason]
)
SELECT
    [RetroGameID] = a.[GameID]
	,[GameID] = b.[GameID]
	,[RetroTeamID] = a.[Team]
    ,[TeamID] = c.[TeamID]
    ,[EjecteePlayerID] = d.[PlayerID]
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
