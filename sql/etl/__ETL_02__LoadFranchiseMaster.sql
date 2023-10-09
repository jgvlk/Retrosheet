INSERT INTO [dbo].[FranchiseMaster] (
    [CurrentRetroFranchiseID]
    ,[RetroFranchiseID]
    ,[League]
    ,[Division]
    ,[LocationName]
    ,[Nickname]
    ,[AltNickname]
    ,[Start]
    ,[End]
    ,[City]
    ,[State]
)
SELECT DISTINCT
    [CurrentRetroFranchiseID] = [CurrentFranchiseID]
    ,[RetroFranchiseID] = [FranchiseID]
    ,[League]
    ,[Division]
    ,[LocationName]
    ,[Nickname] = CASE WHEN [Nickname] = '(none)' THEN NULL ELSE [Nickname] END
    ,[AltNickname]
    ,[Start]
    ,[End]
    ,[City]
    ,CAST([State] AS CHAR(2)) AS [State]
FROM
    [raw].[FranchiseMaster]
ORDER BY
    [CurrentFranchiseID]
    ,[RetroFranchiseID]
    ,[Start]
