USE [Retrosheet]



/* PlayerMaster */

-- Insert Data
INSERT INTO [dbo].[PlayerMaster]
           ([RetroPlayerID]
           ,[FirstName]
           ,[LastName]
           ,[Nickname]
           ,[Birthdate]
           ,[BirthCity]
           ,[BirthState]
           ,[BirthCountry]
           ,[PlayerDebut]
           ,[PlayerLastGame]
           ,[ManagerDebut]
           ,[ManagerLastGame]
           ,[CoachDebut]
           ,[CoachLastGame]
           ,[UmpDebut]
           ,[UmpLastGame]
           ,[DeathDate]
           ,[DeathCity]
           ,[DeathState]
           ,[DeathCountry]
           ,[Bats]
           ,[Throws]
           ,[Height]
           ,[Weight]
           ,[Cemetery]
           ,[CemeteryCity]
           ,[CemeteryState]
           ,[CemeteryCountry]
           ,[CemeteryNote]
           ,[BirthName]
           ,[NameChg]
           ,[BatChg]
           ,[IsHof])
SELECT
	[RetroPlayerID]
	,[FirstName]
	,[LastName]
	,[Nickname]
	,[Birthdate]
	,[BirthCity]
	,[BirthState]
	,[BirthCountry]
	,[PlayerDebut]
	,[PlayerLastGame]
	,[ManagerDebut]
	,[ManagerLastGame]
	,[CoachDebut]
	,[CoachLastGame]
	,[UmpDebut]
	,[UmpLastGame]
	,[DeathDate]
	,[DeathCity]
	,[DeathState]
	,[DeathCountry]
	,[Bats]
	,[Throws]
	,[Height]
	,[Weight]
	,[Cemetery]
	,[CemeteryCity]
	,[CemeteryState]
	,[CemeteryCountry]
	,[CemeteryNote]
	,[BirthName]
	,[NameChg]
	,[BatChg]
	,[IsHof]
FROM
	[stg].[PlayerMaster]
ORDER BY
	[RetroPlayerID]





/* ParkMaster */

-- Insert Data
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
	[RetroParkID]
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
ORDER BY
	[RetroParkID]





/* Franchise Master */

-- Insert Data
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
FROM
	[stg].[FranchiseMaster]
ORDER BY
	[CurrentRetroFranchiseID]
	,[RetroFranchiseID]
	,[Start]






/* TeamMaster */

-- Insert Data
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
	[RetroTeamID]
	,[League]
	,[City]
	,[Nickname]
	,[Start]
	,[End]
FROM
	[stg].[TeamMaster]
ORDER BY
	[RetroTeamID]
	,[Start]





/* Game */

-- Insert Data
INSERT INTO [dbo].[Game]
(
	[ParkID]
	,[GameTypeID]
	,[RetroGameID]
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
	pk.[ParkID]
	,[GameTypeID] = gt.[GameTypeID]
	,[RetroGameID]
	,[Date]
	,[GameNumber]
	,[DayOfWeek]
	,[StartTime]
	,[DHUsedFlag]
	,[DayNightFlag]
	,[VisitingTeam]
	,[HomeTeam]
	,[VisitorStartingPitcher] = vsp.[PlayerID]
	,[HomeStartingPitcher] = hsp.[PlayerID]
	,[HomePlateUmpire] = hpu.[PlayerID]
	,[FirstBaseUmpire] = fbu.[PlayerID]
	,[SecondBaseUmpire] = sbu.[PlayerID]
	,[ThirdBaseUmpire] = tbu.[PlayerID]
	,[LeftFieldUmpire] = lfu.[PlayerID]
	,[RightFieldUmpire] = rfu.[PlayerID]
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
	,[WinningPitcher] = win.[PlayerID]
	,[LosingPitcher] = los.[PlayerID]
	,[SaveFor] = sav.[PlayerID]
	,[GWRBI] = gwrbi.[PlayerID]
	,[VisitorBatter1] = vb1.[PlayerID]
	,[VisitorPosition1]
	,[VisitorBatter2] = vb2.[PlayerID]
	,[VisitorPosition2]
	,[VisitorBatter3] = vb3.[PlayerID]
	,[VisitorPosition3]
	,[VisitorBatter4] = vb4.[PlayerID]
	,[VisitorPosition4]
	,[VisitorBatter5] = vb5.[PlayerID]
	,[VisitorPosition5]
	,[VisitorBatter6] = vb6.[PlayerID]
	,[VisitorPosition6]
	,[VisitorBatter7] = vb7.[PlayerID]
	,[VisitorPosition7]
	,[VisitorBatter8] = vb8.[PlayerID]
	,[VisitorPosition8]
	,[VisitorBatter9] = vb9.[PlayerID]
	,[VisitorPosition9]
	,[HomeBatter1] = hb1.[PlayerID]
	,[HomePosition1]
	,[HomeBatter2] = hb2.[PlayerID]
	,[HomePosition2]
	,[HomeBatter3] = hb3.[PlayerID]
	,[HomePosition3]
	,[HomeBatter4] = hb4.[PlayerID]
	,[HomePosition4]
	,[HomeBatter5] = hb5.[PlayerID]
	,[HomePosition5]
	,[HomeBatter6] = hb6.[PlayerID]
	,[HomePosition6]
	,[HomeBatter7] = hb7.[PlayerID]
	,[HomePosition7]
	,[HomeBatter8] = hb8.[PlayerID]
	,[HomePosition8]
	,[HomeBatter9] = hb9.[PlayerID]
	,[HomePosition9]
	,[VisitingFinisher] = vif.[PlayerID]
	,[HomeFinisher] = hmf.[PlayerID]
	,[OfficialScorer] = sco.[PlayerID]
FROM
	[stg].[Game] g
	LEFT JOIN [dbo].[GameType] gt ON g.[GameType] = gt.[GameType]
	LEFT JOIN [dbo].[ParkMaster] pk ON g.[RetroParkID] = pk.[RetroParkID]
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
	LEFT JOIN [dbo].[PlayerMaster] gwrbi ON g.[GWRBI] = gwrbi.[RetroPlayerID]
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
ORDER BY
	g.[Date]
	,g.[RetroGameID]





/* Event */

-- Insert Data
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
	g.[GameID]
	,[EventNum]
	,[Inning]
	,[BattingTeam]
	,[Outs]
	,[Balls]
	,[Strikes]
	,[PitchSequence]
	,[VisScore]
	,[HomeScore]
	,[Batter] = b.[PlayerID]
	,[BatterHand]
	,[ResBatter] = rb.[PlayerID]
	,[ResBatterHand]
	,[Pitcher] = p.[PlayerID]
	,[PitcherHand]
	,[ResPitcher] = rp.[PlayerID]
	,[ResPitcherHand]
	,[Catcher] = c.[PlayerID]
	,[FirstBase] = f.[PlayerID]
	,[SecondBase] = s.[PlayerID]
	,[ThirdBase] = t.[PlayerID]
	,[Shortstop] = ss.[PlayerID]
	,[LeftField] = lf.[PlayerID]
	,[CenterField] = cf.[PlayerID]
	,[RightField] = rf.[PlayerID]
	,[FirstRunner] = fr.[PlayerID]
	,[SecondRunner] = sr.[PlayerID]
	,[ThirdRunner] = tr.[PlayerID]
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
	,[ResponsiblePitcherForRunnerOn1st] = rpro1.[PlayerID]
	,[ResponsiblePitcherForRunnerOn2nd] = rpro2.[PlayerID]
	,[ResponsiblePitcherForRunnerOn3rd] = rpro3.[PlayerID]
	,[NewGameFlag]
	,[EndGameFlag]
	,[PinchRunnerOn1st]
	,[PinchRunnerOn2nd]
	,[PinchRunnerOn3rd]
	,[RunnerRemovedForPinchRunnerOn1st] = rrpro1.[PlayerID]
	,[RunnerRemovedForPinchRunnerOn1st2nd] = rrpro12.[PlayerID]
	,[RunnerRemovedForPinchRunnerOn1st3rd] = rrpro13.[PlayerID]
	,[BatterRemovedForPinchHitter] = brph.[PlayerID]
	,[PositionOfBatterRemovedForPinchHitter]
	,[FielderWithFirstPutout]
	,[FielderWithSecondPutout]
	,[FielderWithThirdPutout]
	,[FielderWithFirstAssist]
	,[FielderWithSecondAssist]
	,[FielderWithThirdAssist]
	,[FielderWithFourthAssist]
	,[FielderWithFifthAssist]
FROM
	[stg].[Event] e
	LEFT JOIN [dbo].[Game] g ON e.[RetroGameID] = g.[RetroGameID]
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
ORDER BY
	g.[Date]
	,g.[RetroGameID]
	,[EventNum]


