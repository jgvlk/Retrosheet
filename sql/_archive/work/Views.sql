USE [Retrosheet]
GO


-- vw_CurrentParks

SELECT
	[StgParkID]
	,[RetroParkID]
	,[Name]
	,[AKA]
	,[City]
	,[State]
	,[Start]
	,[End]
	,[League]
	,[Notes]
FROM
	[stg].[ParkMaster]
WHERE
	[End] IS NULL
GO





-- vw_CurrentTeams

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




