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





/* Game */

-- Clean [RetroPlayerID]
SELECT
	[GameID]
	,[Date]
	,[GameNumber]
	,[DayOfWeek]
	,[StartTime]
	,[DHUsedFlag]
	,[DayNightFlag]
	,[VisitingTeam]
	,[HomeTeam]
	,[GameSite]
	,[VisitorStartingPitcher] =
		CASE
			WHEN [VisitorStartingPitcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorStartingPitcher])
		END
	,[HomeStartingPitcher] =
		CASE
			WHEN [HomeStartingPitcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeStartingPitcher])
		END
	,[HomePlateUmpire] =
		CASE
			WHEN [HomePlateUmpire] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomePlateUmpire])
		END
	,[FirstBaseUmpire] =
		CASE
			WHEN [FirstBaseUmpire] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([FirstBaseUmpire])
		END
	,[SecondBaseUmpire] =
		CASE
			WHEN [SecondBaseUmpire] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([SecondBaseUmpire])
		END
	,[ThirdBaseUmpire] =
		CASE
			WHEN [ThirdBaseUmpire] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ThirdBaseUmpire])
		END
	,[LeftFieldUmpire] =
		CASE
			WHEN [LeftFieldUmpire] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([LeftFieldUmpire])
		END
	,[RightFieldUmpire] =
		CASE
			WHEN [RightFieldUmpire] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([RightFieldUmpire])
		END
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
	,[WinningPitcher] =
		CASE
			WHEN [WinningPitcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([WinningPitcher])
		END
	,[LosingPitcher] =
		CASE
			WHEN [LosingPitcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([LosingPitcher])
		END
	,[SaveFor] =
		CASE
			WHEN [SaveFor] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([SaveFor])
		END
	,[GWRBI]
	,[VisitorBatter1] =
		CASE
			WHEN [VisitorBatter1] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter1])
		END
	,[VisitorPosition1]
	,[VisitorBatter2] =
		CASE
			WHEN [VisitorBatter2] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter2])
		END
	,[VisitorPosition2]
	,[VisitorBatter3] =
		CASE
			WHEN [VisitorBatter3] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter3])
		END
	,[VisitorPosition3]
	,[VisitorBatter4] =
		CASE
			WHEN [VisitorBatter4] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter4])
		END
	,[VisitorPosition4]
	,[VisitorBatter5] =
		CASE
			WHEN [VisitorBatter5] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter5])
		END
	,[VisitorPosition5]
	,[VisitorBatter6] =
		CASE
			WHEN [VisitorBatter6] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter6])
		END
	,[VisitorPosition6]
	,[VisitorBatter7] =
		CASE
			WHEN [VisitorBatter7] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter7])
		END
	,[VisitorPosition7]
	,[VisitorBatter8] =
		CASE
			WHEN [VisitorBatter8] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter8])
		END
	,[VisitorPosition8]
	,[VisitorBatter9] =
		CASE
			WHEN [VisitorBatter9] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitorBatter9])
		END
	,[VisitorPosition9]
	,[HomeBatter1] =
		CASE
			WHEN [HomeBatter1] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter1])
		END
	,[HomePosition1]
	,[HomeBatter2] =
		CASE
			WHEN [HomeBatter2] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter2])
		END
	,[HomePosition2]
	,[HomeBatter3] =
		CASE
			WHEN [HomeBatter3] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter3])
		END
	,[HomePosition3]
	,[HomeBatter4] =
		CASE
			WHEN [HomeBatter4] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter4])
		END
	,[HomePosition4]
	,[HomeBatter5] =
		CASE
			WHEN [HomeBatter5] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter5])
		END
	,[HomePosition5]
	,[HomeBatter6] =
		CASE
			WHEN [HomeBatter6] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter6])
		END
	,[HomePosition6]
	,[HomeBatter7] =
		CASE
			WHEN [HomeBatter7] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter7])
		END
	,[HomePosition7]
	,[HomeBatter8] =
		CASE
			WHEN [HomeBatter8] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter8])
		END
	,[HomePosition8]
	,[HomeBatter9] =
		CASE
			WHEN [HomeBatter9] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeBatter9])
		END
	,[HomePosition9]
	,[VisitingFinisher] =
		CASE
			WHEN [VisitingFinisher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([VisitingFinisher])
		END
	,[HomeFinisher] =
		CASE
			WHEN [HomeFinisher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([HomeFinisher])
		END
	,[OfficialScorer] =
		CASE
			WHEN [OfficialScorer] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([OfficialScorer])
		END
INTO
	#Game_CleanPlayerID
FROM
	[raw].[Game]
GO


-- Insert to destination table
INSERT INTO [dbo].[Game]
(
	[RetroGameID]
	,[ParkID]
	,[Date]
	,[GameNumber]
	,[DayOfWeek]
	,[StartTime]
	,[DHUsedFlag]
	,[DayNightFlag]
	,[VisitingTeam]
	,[HomeTeam]
	,[VisitorStartingPitcher]
	,[HomeStartingPitcher]
	,[HomePlateUmpire]
	,[FirstBaseUmpire]
	,[SecondBaseUmpire]
	,[ThirdBaseUmpire]
	,[LeftFieldUmpire]
	,[RightFieldUmpire]
	,[Attendance]
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
)
SELECT
	[RetroGameID] = g.[GameID] -- CHAR(12)
	,[ParkID] = pk.[ParkID] -- UNIQUEIDENTIFIER
	,[Date] = SUBSTRING(g.[GameID], 4, 4) + '-' + SUBSTRING(g.[GameID], 8, 2) + '-' + SUBSTRING(g.[GameID], 10, 2) -- DATE
	,g.[GameNumber] -- INT
	,g.[DayOfWeek] -- VARHCAR(10)
	,[StartTime] =
		CASE
			WHEN LEN(g.[StartTime]) = N'4' THEN SUBSTRING(g.[StartTime], 1, 2) + ':' + SUBSTRING(g.[StartTime], 3, 2)
			WHEN LEN(g.[StartTime]) = N'3' THEN SUBSTRING(g.[StartTime], 1, 1) + ':' + SUBSTRING(g.[StartTime], 2, 2)
			ELSE NULL
		END -- VARCHAR(5)
	,[DHUsedFlag] = CASE WHEN g.[DHUsedFlag] = N'T' THEN 1 ELSE 0 END -- BIT
	,g.[DayNightFlag] -- CHAR(1)
	,g.[VisitingTeam] -- CHAR(3)
	,g.[HomeTeam] -- CHAR(3)
	,[VisitorStartingPitcher] = vsp.[PlayerID] -- UNIQUEIDENTIFIER
	,[HomeStartingPitcher] = hsp.[PlayerID] -- UNIQUEIDENTIFIER
	,[HomePlateUmpire] = hpu.[PlayerID] -- UNIQUEIDENTIFIER
	,[FirstBaseUmpire] = fbu.[PlayerID] -- UNIQUEIDENTIFIER
	,[SecondBaseUmpire] = sbu.[PlayerID] -- UNIQUEIDENTIFIER
	,[ThirdBaseUmpire] = tbu.[PlayerID] -- UNIQUEIDENTIFIER
	,[LeftFieldUmpire] = lfu.[PlayerID] -- UNIQUEIDENTIFIER
	,[RightFieldUmpire] = rfu.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[Attendance] -- INT
	--,[PSScorer]
	--,[Translator]
	--,[Inputter]
	--,[InputTime]
	--,[EditTime]
	,g.[HowScored] -- INT
	,g.[PitchesEntered] -- INT
	,g.[Temperature] -- INT
	,g.[WindDirection] -- INT
	,g.[WindSpeed] -- INT
	,g.[FieldCondition] -- INT
	,g.[Precipitation] -- INT
	,g.[Sky] -- INT
	,g.[TimeOfGame] -- INT
	,g.[NumberOfInnings] -- INT
	,g.[VisitorFinalScore] -- INT
	,g.[HomeFinalScore] -- INT
	,g.[VisitorHits] -- INT
	,g.[HomeHits] -- INT
	,g.[VisitorErrors] -- INT
	,g.[HomeErrors] -- INT
	,g.[VisitorLeftOnBase] -- INT
	,g.[HomeLeftOnBase] -- INT
	,[WinningPitcher] = win.[PlayerID] -- UNIQUEIDENTIFIER
	,[LosingPitcher] = los.[PlayerID] -- UNIQUEIDENTIFIER
	,[SaveFor] = sav.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[GWRBI] -- VARCHAR(25) <- LOOK INTO THIS FIELD
	,[VisitorBatter1] = vb1.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition1] -- INT
	,[VisitorBatter2] = vb2.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition2] -- INT
	,[VisitorBatter3] = vb3.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition3] -- INT
	,[VisitorBatter4] = vb4.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition4] -- INT
	,[VisitorBatter5] = vb5.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition5] -- INT
	,[VisitorBatter6] = vb6.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition6] -- INT
	,[VisitorBatter7] = vb7.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition7] -- INT
	,[VisitorBatter8] = vb8.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition8] -- INT
	,[VisitorBatter9] = vb9.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[VisitorPosition9] -- INT
	,[HomeBatter1] = hb1.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition1] -- INT
	,[HomeBatter2] = hb2.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition2] -- INT
	,[HomeBatter3] = hb3.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition3] -- INT
	,[HomeBatter4] = hb4.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition4] -- INT
	,[HomeBatter5] = hb5.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition5] -- INT
	,[HomeBatter6] = hb6.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition6] -- INT
	,[HomeBatter7] = hb7.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition7] -- INT
	,[HomeBatter8] = hb8.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition8] -- INT
	,[HomeBatter9] = hb9.[PlayerID] -- UNIQUEIDENTIFIER
	,g.[HomePosition9] -- INT
	,[VisitingFinisher] = vif.[PlayerID] -- UNIQUEIDENTIFIER
	,[HomeFinisher] = hmf.[PlayerID] -- UNIQUEIDENTIFIER
	,[OfficialScorer] = sco.[PlayerID] -- UNIQUEIDENTIFIER
FROM
	#Game_CleanPlayerID g
	LEFT JOIN [dbo].[ParkMaster] pk ON g.[GameSite] = pk.[RetroParkID]
	LEFT JOIN [dbo].[PlayerMaster] vsp ON g.[VisitorStartingPitcher] = vsp.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hsp ON g.[HomeStartingPitcher] = hsp.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hpu ON g.[HomePlateUmpire] = hpu.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] fbu ON g.[FirstBaseUmpire] = fbu.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] sbu ON g.[SecondBaseUmpire] = sbu.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] tbu ON g.[ThirdBaseUmpire] = tbu.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] lfu ON g.[LeftFieldUmpire] = lfu.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rfu ON g.[RightFieldUmpire] = rfu.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] win ON g.[WinningPitcher] = win.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] los ON g.[LosingPitcher] = los.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] sav ON g.[SaveFor] = sav.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb1 ON g.[VisitorBatter1] = vb1.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb2 ON g.[VisitorBatter2] = vb2.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb3 ON g.[VisitorBatter3] = vb3.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb4 ON g.[VisitorBatter4] = vb4.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb5 ON g.[VisitorBatter5] = vb5.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb6 ON g.[VisitorBatter6] = vb6.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb7 ON g.[VisitorBatter7] = vb7.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb8 ON g.[VisitorBatter8] = vb8.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vb9 ON g.[VisitorBatter9] = vb9.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb1 ON g.[HomeBatter1] = hb1.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb2 ON g.[HomeBatter2] = hb2.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb3 ON g.[HomeBatter3] = hb3.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb4 ON g.[HomeBatter4] = hb4.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb5 ON g.[HomeBatter5] = hb5.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb6 ON g.[HomeBatter6] = hb6.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb7 ON g.[HomeBatter7] = hb7.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb8 ON g.[HomeBatter8] = hb8.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hb9 ON g.[HomeBatter9] = hb9.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] vif ON g.[VisitingFinisher] = vif.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] hmf ON g.[HomeFinisher] = hmf.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] sco ON g.[OfficialScorer] = sco.[RetroPlayerID]
GO





/* Event */

-- Clean [RetroPlayerID]
SELECT
	[GameID]
	,[EventNum]
	,[Inning]
	,[BattingTeam]
	,[Outs]
	,[Balls]
	,[Strikes]
	,[PitchSequence]
	,[VisScore]
	,[HomeScore]
	,[Batter] =
		CASE
			WHEN [Batter] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([Batter])
		END
	,[BatterHand]
	,[ResBatter] =
		CASE
			WHEN [ResBatter] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ResBatter])
		END
	,[ResBatterHand]
	,[Pitcher] =
		CASE
			WHEN [Pitcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([Pitcher])
		END
	,[PitcherHand]
	,[ResPitcher] =
		CASE
			WHEN [ResPitcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ResPitcher])
		END
	,[ResPitcherHand]
	,[Catcher] =
		CASE
			WHEN [Catcher] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([Catcher])
		END
	,[FirstBase] =
		CASE
			WHEN [FirstBase] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([FirstBase])
		END
	,[SecondBase] =
		CASE
			WHEN [SecondBase] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([SecondBase])
		END
	,[ThirdBase] =
		CASE
			WHEN [ThirdBase] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ThirdBase])
		END
	,[Shortstop] =
		CASE
			WHEN [Shortstop] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([Shortstop])
		END
	,[LeftField] =
		CASE
			WHEN [LeftField] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([LeftField])
		END
	,[CenterField] =
		CASE
			WHEN [CenterField] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([CenterField])
		END
	,[RightField] =
		CASE
			WHEN [RightField] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([RightField])
		END
	,[FirstRunner] =
		CASE
			WHEN [FirstRunner] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([FirstRunner])
		END
	,[SecondRunner] =
		CASE
			WHEN [SecondRunner] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([SecondRunner])
		END
	,[ThirdRunner] =
		CASE
			WHEN [ThirdRunner] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ThirdRunner])
		END
	,[EventText]
	,[LeadoffFlag]
	,[PinchHitFlag]
	,[DefensivePosition]
	,[LineupPosition]
	,[EventType]
	,[BatterEventFlag]
	,[ABFlag]
	,[HitValue]
	,[SHFlag]
	,[SFFlag]
	,[OutsOnPlay]
	,[DoublePlayFlag]
	,[TriplePlayFlag]
	,[RBIOnPlay]
	,[WildPitchFlag]
	,[PassedBallFlag]
	,[FieldedBy]
	,[BattedBallType]
	,[BuntFlag]
	,[FoulFlag]
	,[HitLocation]
	,[NumErrors]
	,[ErrorPlayer1]
	,[ErrorType1]
	,[ErrorPlayer2]
	,[ErrorType2]
	,[ErrorPlayer3]
	,[ErrorType3]
	,[BatterDest]
	,[RunnerOn1stDest]
	,[RunnerOn2ndDest]
	,[RunnerOn3rdDest]
	,[PlayOnBatter]
	,[PlayOnRunnerOn1st]
	,[PlayOnRunnerOn2nd]
	,[PlayOnRunnerOn3rd]
	,[SBForRunnerOn1stFlag]
	,[SBForRunnerOn2ndFlag]
	,[SBForRunnerOn3rdFlag]
	,[CSForRunnerOn1stFlag]
	,[CSForRunnerOn2ndFlag]
	,[CSForRunnerOn3rdFlag]
	,[POForRunnerOn1stFlag]
	,[POForRunnerOn2ndFlag]
	,[POForRunnerOn3rdFlag]
	,[ResponsiblePitcherForRunnerOn1st] =
		CASE
			WHEN [ResponsiblePitcherForRunnerOn1st] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ResponsiblePitcherForRunnerOn1st])
		END
	,[ResponsiblePitcherForRunnerOn2nd] =
		CASE
			WHEN [ResponsiblePitcherForRunnerOn2nd] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ResponsiblePitcherForRunnerOn2nd])
		END
	,[ResponsiblePitcherForRunnerOn3rd] =
		CASE
			WHEN [ResponsiblePitcherForRunnerOn3rd] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([ResponsiblePitcherForRunnerOn3rd])
		END
	,[NewGameFlag]
	,[EndGameFlag]
	,[PinchRunnerOn1st]
	,[PinchRunnerOn2nd]
	,[PinchRunnerOn3rd]
	,[RunnerRemovedForPinchRunnerOn1st] =
		CASE
			WHEN [RunnerRemovedForPinchRunnerOn1st] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([RunnerRemovedForPinchRunnerOn1st])
		END
	,[RunnerRemovedForPinchRunnerOn1st2nd] =
		CASE
			WHEN [RunnerRemovedForPinchRunnerOn1st2nd] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([RunnerRemovedForPinchRunnerOn1st2nd])
		END
	,[RunnerRemovedForPinchRunnerOn1st3rd] =
		CASE
			WHEN [RunnerRemovedForPinchRunnerOn1st3rd] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([RunnerRemovedForPinchRunnerOn1st3rd])
		END
	,[BatterRemovedForPinchHitter] =
		CASE
			WHEN [BatterRemovedForPinchHitter] = 'broot001' THEN UPPER('broot101')
			ELSE UPPER([BatterRemovedForPinchHitter])
		END
	,[PositionOfBatterRemovedForPinchHitter]
	,[FielderWithFirstPutout]
	,[FielderWithSecondPutout]
	,[FielderWithThirdPutout]
	,[FielderWithFirstAssist]
	,[FielderWithSecondAssist]
	,[FielderWithThirdAssist]
	,[FielderWithFourthAssist]
	,[FielderWithFifthAssist]
INTO
	#Event_CleanPlayerID
FROM
	[raw].[Event]
GO


INSERT INTO [dbo].[Event]
(
	[GameID]
	,[EventNum]
	,[Inning]
	,[BattingTeam]
	,[Outs]
	,[Balls]
	,[Strikes]
	,[PitchSequence]
	,[VisScore]
	,[HomeScore]
	,[Batter]
	,[BatterHand]
	,[ResBatter]
	,[ResBatterHand]
	,[Pitcher]
	,[PitcherHand]
	,[ResPitcher]
	,[ResPitcherHand]
	,[Catcher]
	,[FirstBase]
	,[SecondBase]
	,[ThirdBase]
	,[Shortstop]
	,[LeftField]
	,[CenterField]
	,[RightField]
	,[FirstRunner]
	,[SecondRunner]
	,[ThirdRunner]
	,[EventText]
	,[LeadoffFlag]
	,[PinchHitFlag]
	,[DefensivePosition]
	,[LineupPosition]
	,[EventType]
	,[BatterEventFlag]
	,[ABFlag]
	,[HitValue]
	,[SHFlag]
	,[SFFlag]
	,[OutsOnPlay]
	,[DoublePlayFlag]
	,[TriplePlayFlag]
	,[RBIOnPlay]
	,[WildPitchFlag]
	,[PassedBallFlag]
	,[FieldedBy]
	,[BattedBallType]
	,[BuntFlag]
	,[FoulFlag]
	,[HitLocation]
	,[NumErrors]
	,[ErrorPlayer1]
	,[ErrorType1]
	,[ErrorPlayer2]
	,[ErrorType2]
	,[ErrorPlayer3]
	,[ErrorType3]
	,[BatterDest]
	,[RunnerOn1stDest]
	,[RunnerOn2ndDest]
	,[RunnerOn3rdDest]
	,[PlayOnBatter]
	,[PlayOnRunnerOn1st]
	,[PlayOnRunnerOn2nd]
	,[PlayOnRunnerOn3rd]
	,[SBForRunnerOn1stFlag]
	,[SBForRunnerOn2ndFlag]
	,[SBForRunnerOn3rdFlag]
	,[CSForRunnerOn1stFlag]
	,[CSForRunnerOn2ndFlag]
	,[CSForRunnerOn3rdFlag]
	,[POForRunnerOn1stFlag]
	,[POForRunnerOn2ndFlag]
	,[POForRunnerOn3rdFlag]
	,[ResponsiblePitcherForRunnerOn1st]
	,[ResponsiblePitcherForRunnerOn2nd]
	,[ResponsiblePitcherForRunnerOn3rd]
	,[NewGameFlag]
	,[EndGameFlag]
	,[PinchRunnerOn1st]
	,[PinchRunnerOn2nd]
	,[PinchRunnerOn3rd]
	,[RunnerRemovedForPinchRunnerOn1st]
	,[RunnerRemovedForPinchRunnerOn1st2nd]
	,[RunnerRemovedForPinchRunnerOn1st3rd]
	,[BatterRemovedForPinchHitter]
	,[PositionOfBatterRemovedForPinchHitter]
	,[FielderWithFirstPutout]
	,[FielderWithSecondPutout]
	,[FielderWithThirdPutout]
	,[FielderWithFirstAssist]
	,[FielderWithSecondAssist]
	,[FielderWithThirdAssist]
	,[FielderWithFourthAssist]
	,[FielderWithFifthAssist]
)
SELECT
	[GameID] = g.[GameID] -- UNIQUEIDENTIFIER
	,e.[EventNum] -- INT
	,e.[Inning] -- INT
	,e.[BattingTeam] -- BIT
	,e.[Outs] -- INT
	,e.[Balls] -- INT
	,e.[Strikes] -- INT
	,e.[PitchSequence] -- VARCHAR(25)
	,e.[VisScore] -- INT
	,e.[HomeScore] -- INT
	,[Batter] = b.[PlayerID] -- UNIQUEIDENTIFIER
	,[BatterHand] -- CHAR(1)
	,[ResBatter] = rb.[PlayerID] -- UNIQUEIDENTIFIER
	,[ResBatterHand] -- CHAR(1)
	,[Pitcher] = p.[PlayerID] -- UNIQUEIDENTIFIER
	,[PitcherHand] -- CHAR(1)
	,[ResPitcher] = rp.[PlayerID] -- UNIQUEIDENTIFIER
	,[ResPitcherHand] -- CHAR(1)
	,[Catcher] = c.[PlayerID] -- UNIQUEIDENTIFIER
	,[FirstBase] = f.[PlayerID] -- UNIQUEIDENTIFIER
	,[SecondBase] = s.[PlayerID] -- UNIQUEIDENTIFIER
	,[ThirdBase] = t.[PlayerID] -- UNIQUEIDENTIFIER
	,[Shortstop] = ss.[PlayerID] -- UNIQUEIDENTIFIER
	,[LeftField] = lf.[PlayerID] -- UNIQUEIDENTIFIER
	,[CenterField] = cf.[PlayerID] -- UNIQUEIDENTIFIER
	,[RightField] = rf.[PlayerID] -- UNIQUEIDENTIFIER
	,[FirstRunner] = fr.[PlayerID] -- UNIQUEIDENTIFIER
	,[SecondRunner] = sr.[PlayerID] -- UNIQUEIDENTIFIER
	,[ThirdRunner] = tr.[PlayerID] -- UNIQUEIDENTIFIER
	,e.[EventText] -- VARCHAR(50)
	,[LeadoffFlag] = CASE WHEN e.[LeadoffFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[PinchHitFlag] = CASE WHEN e.[PinchHitFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,e.[DefensivePosition] -- INT
	,e.[LineupPosition] -- INT
	,e.[EventType] -- INT
	,[BatterEventFlag] = CASE WHEN e.[BatterEventFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[ABFlag] = CASE WHEN e.[ABFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,e.[HitValue] -- INT
	,[SHFlag] = CASE WHEN e.[SHFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[SFFlag] = CASE WHEN e.[SFFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,e.[OutsOnPlay] -- INT
	,[DoublePlayFlag] = CASE WHEN e.[DoublePlayFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[TriplePlayFlag] = CASE WHEN e.[TriplePlayFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,e.[RBIOnPlay] -- INT
	,[WildPitchFlag] = CASE WHEN e.[WildPitchFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[PassedBallFlag] = CASE WHEN e.[PassedBallFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,e.[FieldedBy] -- INT
	,e.[BattedBallType] -- CHAR(1)
	,[BuntFlag] = CASE WHEN e.[BuntFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[FoulFlag] = CASE WHEN e.[FoulFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,e.[HitLocation] -- VARCHAR(4)
	,e.[NumErrors] -- INT
	,e.[ErrorPlayer1] -- INT
	,e.[ErrorType1] -- CHAR(1)
	,e.[ErrorPlayer2] -- INT
	,e.[ErrorType2] -- CHAR(1)
	,e.[ErrorPlayer3] -- INT
	,e.[ErrorType3] -- CHAR(1)
	,e.[BatterDest]  -- INT
	,e.[RunnerOn1stDest] -- INT
	,e.[RunnerOn2ndDest] -- INT
	,e.[RunnerOn3rdDest] -- INT
	,e.[PlayOnBatter] -- VARCHAR(10)
	,e.[PlayOnRunnerOn1st] -- VARCHAR(10)
	,e.[PlayOnRunnerOn2nd] -- VARCHAR(10)
	,e.[PlayOnRunnerOn3rd] -- VARCHAR(10)
	,[SBForRunnerOn1stFlag] = CASE WHEN e.[SBForRunnerOn1stFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[SBForRunnerOn2ndFlag] = CASE WHEN e.[SBForRunnerOn2ndFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[SBForRunnerOn3rdFlag] = CASE WHEN e.[SBForRunnerOn3rdFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[CSForRunnerOn1stFlag] = CASE WHEN e.[CSForRunnerOn1stFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[CSForRunnerOn2ndFlag] = CASE WHEN e.[CSForRunnerOn2ndFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[CSForRunnerOn3rdFlag] = CASE WHEN e.[CSForRunnerOn3rdFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[POForRunnerOn1stFlag] = CASE WHEN e.[POForRunnerOn1stFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[POForRunnerOn2ndFlag] = CASE WHEN e.[POForRunnerOn2ndFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[POForRunnerOn3rdFlag] = CASE WHEN e.[POForRunnerOn3rdFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[ResponsiblePitcherForRunnerOn1st] = rpro1.[PlayerID] -- UNIQUEIDENTIFIER
	,[ResponsiblePitcherForRunnerOn2nd] = rpro2.[PlayerID] -- UNIQUEIDENTIFIER
	,[ResponsiblePitcherForRunnerOn3rd] = rpro3.[PlayerID] -- UNIQUEIDENTIFIER
	,[NewGameFlag] = CASE WHEN e.[NewGameFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[EndGameFlag] = CASE WHEN e.[EndGameFlag] = 'T' THEN 1 ELSE 0 END -- BIT
	,[PinchRunnerOn1st] = CASE WHEN e.[PinchRunnerOn1st] = 'T' THEN 1 ELSE 0 END -- BIT
	,[PinchRunnerOn2nd] = CASE WHEN e.[PinchRunnerOn2nd] = 'T' THEN 1 ELSE 0 END -- BIT
	,[PinchRunnerOn3rd] = CASE WHEN e.[PinchRunnerOn3rd] = 'T' THEN 1 ELSE 0 END -- BIT
	,[RunnerRemovedForPinchRunnerOn1st] = rrpro1.[PlayerID] -- UNIQUEIDENTIFIER
	,[RunnerRemovedForPinchRunnerOn1st2nd] = rrpro12.[PlayerID] -- UNIQUEIDENTIFIER
	,[RunnerRemovedForPinchRunnerOn1st3rd] = rrpro13.[PlayerID] -- UNIQUEIDENTIFIER
	,[BatterRemovedForPinchHitter] = brph.[PlayerID] -- UNIQUEIDENTIFIER
	,e.[PositionOfBatterRemovedForPinchHitter] -- INT
	,e.[FielderWithFirstPutout] -- INT
	,e.[FielderWithSecondPutout] -- INT
	,e.[FielderWithThirdPutout] -- INT
	,e.[FielderWithFirstAssist] -- INT
	,e.[FielderWithSecondAssist] -- INT
	,e.[FielderWithThirdAssist] -- INT
	,e.[FielderWithFourthAssist] -- INT
	,e.[FielderWithFifthAssist] -- INT
FROM
	#Event_CleanPlayerID e
	LEFT JOIN [dbo].[Game] g ON e.[GameID] = g.[RetroGameID]
	LEFT JOIN [dbo].[PlayerMaster] b ON e.[Batter] = b.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rb ON e.[ResBatter] = rb.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] p ON e.[Pitcher] = p.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rp ON e.[ResPitcher] = rp.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] c ON e.[Catcher] = c.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] f ON e.[FirstBase] = f.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] s ON e.[SecondBase] = s.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] t ON e.[ThirdBase] = t.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] ss ON e.[Shortstop] = ss.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] lf ON e.[LeftField] = lf.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] cf ON e.[CenterField] = cf.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rf ON e.[RightField] = rf.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] fr ON e.[FirstRunner] = fr.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] sr ON e.[SecondRunner] = sr.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] tr ON e.[ThirdRunner] = tr.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rpro1 ON e.[ResponsiblePitcherForRunnerOn1st] = rpro1.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rpro2 ON e.[ResponsiblePitcherForRunnerOn2nd] = rpro2.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rpro3 ON e.[ResponsiblePitcherForRunnerOn3rd] = rpro3.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rrpro1 ON e.[RunnerRemovedForPinchRunnerOn1st] = rrpro1.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rrpro12 ON e.[RunnerRemovedForPinchRunnerOn1st2nd] = rrpro12.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] rrpro13 ON e.[RunnerRemovedForPinchRunnerOn1st3rd] = rrpro13.[RetroPlayerID]
	LEFT JOIN [dbo].[PlayerMaster] brph ON e.[BatterRemovedForPinchHitter] = brph.[RetroPlayerID]
GO

