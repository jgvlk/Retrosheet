CREATE VIEW [stg].[vw_CurrentTeams]
AS
SELECT
	[StgFranchiseID]
	,[CurrentRetroFranchiseID]
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
FROM
	[stg].[FranchiseMaster]
WHERE
	[End] IS NULL
GO

