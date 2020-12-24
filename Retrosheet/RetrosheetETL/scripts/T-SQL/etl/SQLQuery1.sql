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
	[RetroPlayerID] = [PlayerID] -- CHAR(8)
	,[FirstName] -- VARCHAR(25)
	,[LastName] -- VARCHAR(25)
	,[PlayerDebut] -- DATE
	,[ManagerDebut] -- DATE
	,[CoachDebut] -- DATE
	,[UmpDebut] -- DATE
FROM
	[raw].[PlayerMaster]





/* Game */

SELECT TOP 1000 * FROM [raw].[Game]

SELECT distinct DayNightFlag from raw.Game
SELECT distinct LEN([VisitorStartingPitcher]) from raw.Game


SELECT TOP 1000
	[RetroGameID] = CONVERT(CHAR(12), [GameID])
	--,[ParkID] = pk.[ParkID] -- CHAR(5)
	,[Date] = SUBSTRING([GameID], 4, 4) + '-' + SUBSTRING([GameID], 8, 2) + '-' + SUBSTRING(GameID, 10, 2)
	,[GameNumber] -- INT
	,[DayOfWeek] -- VARHCAR(9)
	,[StartTime] =
		CASE
			WHEN LEN([StartTime]) = N'4' THEN SUBSTRING([StartTime], 1, 2) + ':' + SUBSTRING([StartTime], 3, 2)
			WHEN LEN([StartTime]) = N'3' THEN SUBSTRING([StartTime], 1, 1) + ':' + SUBSTRING([StartTime], 2, 2)
			ELSE NULL
		END -- VARCHAR(5)
	,[DHUsedFlag] = CASE WHEN [DHUsedFlag] = N'T' THEN 1 ELSE 0 END -- BIT
	,[DayNightFlag] -- CHAR(1)
	,[VisitingTeam] -- CHAR(3)
	,[HomeTeam] -- CHAR(3)
	,[VisitorStartingPitcher] = vsp.[PlayerID] -- CHAR(8)
	,[HomeStartingPitcher] = hsp.[PlayerID] -- CHAR(8)
	,[HomePlateUmpire] = hpu.[PlayerID] -- CHAR(8)
	,[FirstBaseUmpire] = [PlayerID] -- CHAR(8)
	,[SecondBaseUmpire] = [PlayerID] -- CHAR(8)
	,[ThirdBaseUmpire] = [PlayerID] -- CHAR(8)
	,[LeftFieldUmpire] = [PlayerID] -- CHAR(8)
	,[RightFieldUmpire] = [PlayerID] -- CHAR(8)
	,[Attendance]
	,[PSScorer]
	,[Translator]
	,[Inputter]
	,[InputTime]
	,[EditTime]
	,[HowScored]
	,[PitchesEntered]
	,[Temperature]
	,[WindDirection]
	,[WindSpeed]
	,[FieldCondition]
	,[Precipitation]
	,[Sky]
	,[TimeOfGame]
	,[NumberOfInnings]
	,[VisitorFinalScore]
	,[HomeFinalScore]
	,[VisitorHits]
	,[HomeHits]
	,[VisitorErrors]
	,[HomeErrors]
	,[VisitorLeftOnBase]
	,[HomeLeftOnBase]
	,[WinningPitcher]
	,[LosingPitcher]
	,[SaveFor]
	,[GWRBI]
	,[VisitorBatter1]
	,[VisitorPosition1]
	,[VisitorBatter2]
	,[VisitorPosition2]
	,[VisitorBatter3]
	,[VisitorPosition3]
	,[VisitorBatter4]
	,[VisitorPosition4]
	,[VisitorBatter5]
	,[VisitorPosition5]
	,[VisitorBatter6]
	,[VisitorPosition6]
	,[VisitorBatter7]
	,[VisitorPosition7]
	,[VisitorBatter8]
	,[VisitorPosition8]
	,[VisitorBatter9]
	,[VisitorPosition9]
	,[HomeBatter1]
	,[HomePosition1]
	,[HomeBatter2]
	,[HomePosition2]
	,[HomeBatter3]
	,[HomePosition3]
	,[HomeBatter4]
	,[HomePosition4]
	,[HomeBatter5]
	,[HomePosition5]
	,[HomeBatter6]
	,[HomePosition6]
	,[HomeBatter7]
	,[HomePosition7]
	,[HomeBatter8]
	,[HomePosition8]
	,[HomeBatter9]
	,[HomePosition9]
	,[VisitingFinisher]
	,[HomeFinisher]
	,[OfficialScorer]
FROM
	[raw].[Game] g
	LEFT JOIN [raw].[ParkMaster] pk ON g.[GameSite] = pk.[ParkID]
	--LEFT JOIN [dbo].[PlayerMaster] vsp ON g.[VisitorStartingPitcher] = vsp.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] hsp ON g.[HomeStartingPitcher] = hsp.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] hpu ON g.[HomePlateUmpire] = hpu.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] fbu ON g.[FirstBaseUmpire] = fbu.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] sbu ON g.[SecondBaseUmpire] = sbu.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] tbu ON g.[ThirdBaseUmpire] = tbu.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] lfu ON g.[LeftFieldUmpire] = lfu.[RetroPlayerID]
	--LEFT JOIN [dbo].[PlayerMaster] rfu ON g.[RightFieldUmpire] = rfu.[RetroPlayerID]

ORDER BY
	[Date] DESC

