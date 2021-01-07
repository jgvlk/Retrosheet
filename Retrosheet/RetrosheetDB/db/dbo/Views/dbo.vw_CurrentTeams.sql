CREATE VIEW [dbo].[vw_CurrentTeams]
AS
SELECT
	[FranchiseID]
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
	[dbo].[FranchiseMaster]
WHERE
	[End] IS NULL
GO

