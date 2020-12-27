USE [Retrosheet]
GO


/* PlayerMaster */

INSERT INTO [dbo].[PlayerMaster]
(
	[RetroPlayerID]
	,[FirstName]
	,[LastName]
	,[PlayerDebut]
	,[ManagerDebut]
	,[CoachDebut]
	,[UmpDebut]
)
SELECT
	[RetroPlayerID] = UPPER([PlayerID]) -- CHAR(8)
	,[FirstName] -- VARCHAR(25)
	,[LastName] -- VARCHAR(25)
	,[PlayerDebut] -- DATE
	,[ManagerDebut] -- DATE
	,[CoachDebut] -- DATE
	,[UmpDebut] -- DATE
FROM
	[raw].[PlayerMaster]
GO





/* ParkMaster */

INSERT INTO [dbo].[ParkMaster]
(
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
SELECT
	[RetroParkID] = UPPER([ParkID]) -- CHAR(5)
	,[Name] -- VARCHAR(50)
	,[AKA] -- VARCHAR(50)
	,[City] -- VARCHAR(25)
	,[State] -- CHAR(2)
	,[Start] -- DATE
	,[End] -- END
	,[League] -- VARCHAR(5)
	,[Notes] -- VARHCAR(100)
FROM
	[raw].[ParkMaster]
GO





/* Franchise Master */

INSERT INTO [dbo].[FranchiseMaster]
(
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
SELECT
	[CurrentRetroFranchiseID] = [CurrentFranchiseID]
	,[RetroFranchiseID] = [FranchiseID]
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
	[raw].[FranchiseMaster]
GO





/* TeamMaster */

INSERT INTO [dbo].[TeamMaster]
(
	[RetroTeamID]
	,[League]
	,[City]
	,[Nickname]
	,[Start]
	,[End]
)
SELECT
	[RetroTeamID] = [TeamID]
	,[League]
	,[City]
	,[Nickname]
	,[Start]
	,[End]
FROM
	[raw].[TeamMaster]
GO

