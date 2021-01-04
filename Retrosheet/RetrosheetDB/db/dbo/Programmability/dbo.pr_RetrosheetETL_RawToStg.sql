CREATE PROCEDURE [dbo].[pr_RetrosheetETL_RawToStg]
	@Return INT OUTPUT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

------- START PROCEDURE CODE -----------------------------------------------------------------------

		DECLARE @ErrorLine NVARCHAR(MAX)
		DECLARE @ErrorMessage NVARCHAR(MAX)





		/* PlayerMaster */

		-- Insert Data
		INSERT INTO [stg].[PlayerMaster]
		(
			[RetroPlayerID]
			,[FirstName]
			,[LastName]
			,[PlayerDebut]
			,[ManagerDebut]
			,[CoachDebut]
			,[UmpDebut]
		)
		SELECT DISTINCT
			[RetroPlayerID] = UPPER([PlayerID])
			,[FirstName]
			,[LastName]
			,[PlayerDebut]
			,[ManagerDebut]
			,[CoachDebut]
			,[UmpDebut]
		FROM
			[raw].[PlayerMaster]
		ORDER BY
			[RetroPlayerID]


		-- Hash Data Rows
		UPDATE plm
		SET [RowHash] = HASHBYTES('SHA2_512', (
			SELECT
				[RetroPlayerID]
				,[FirstName]
				,[LastName]
				,[PlayerDebut]
				,[ManagerDebut]
				,[CoachDebut]
				,[UmpDebut]
			FOR XML RAW
			) )
		FROM
			[stg].[PlayerMaster] plm





		/* ParkMaster */

		-- Insert Data
		INSERT INTO [stg].[ParkMaster]
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
		SELECT DISTINCT
			[RetroParkID] = UPPER([ParkID])
			,[Name]
			,[AKA]
			,[City]
			,[State]
			,[Start]
			,[End]
			,[League]
			,[Notes]
		FROM
			[raw].[ParkMaster]
		ORDER BY
			[RetroParkID]


		-- Hash Data Rows
		UPDATE pkm
		SET [RowHash] = HASHBYTES('SHA2_512', (
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
			FOR XML RAW
			) )
		FROM
			[stg].[ParkMaster] pkm





		/* Franchise Master */

		-- Insert Data
		INSERT INTO [stg].[FranchiseMaster]
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
		SELECT DISTINCT
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
		ORDER BY
			[CurrentFranchiseID]
			,[RetroFranchiseID]
			,[Start]


		-- Hash Data Rows
		UPDATE fm
		SET [RowHash] = HASHBYTES('SHA2_512', (
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
			FOR XML RAW
			) )
		FROM
			[stg].[FranchiseMaster] fm






		/* TeamMaster */

		-- Insert Data
		INSERT INTO [stg].[TeamMaster]
		(
			[RetroTeamID]
			,[League]
			,[City]
			,[Nickname]
			,[Start]
			,[End]
		)
		SELECT DISTINCT
			[RetroTeamID] = [TeamID]
			,[League]
			,[City]
			,[Nickname]
			,[Start]
			,[End]
		FROM
			[raw].[TeamMaster]
		ORDER BY
			[RetroTeamID]
			,[Start]


		-- Hash Data Rows
		UPDATE tm
		SET [RowHash] = HASHBYTES('SHA2_512', (
			SELECT
				[RetroTeamID]
				,[League]
				,[City]
				,[Nickname]
				,[Start]
				,[End]
			FOR XML RAW
			) )
		FROM
			[stg].[TeamMaster] tm





		/* Game */

		-- Insert Data
		INSERT INTO [stg].[Game]
		(
			[RetroGameID]
			,[RetroParkID]
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
			,[GameType]
		)
		SELECT
			[RetroGameID] = [GameID]
			,[RetroParkID] = [GameSite]
			,[Date] = SUBSTRING([GameID], 4, 4) + '-' + SUBSTRING([GameID], 8, 2) + '-' + SUBSTRING([GameID], 10, 2)
			,[GameNumber]
			,[DayOfWeek]
			,[StartTime] =
				CASE
					WHEN LEN([StartTime]) = N'4' THEN SUBSTRING([StartTime], 1, 2) + ':' + SUBSTRING([StartTime], 3, 2)
					WHEN LEN([StartTime]) = N'3' THEN SUBSTRING([StartTime], 1, 1) + ':' + SUBSTRING([StartTime], 2, 2)
					ELSE NULL
				END
			,[DHUsedFlag] = CASE WHEN [DHUsedFlag] = N'T' THEN 1 ELSE 0 END
			,[DayNightFlag]
			,[VisitingTeam]
			,[HomeTeam]
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
			,[GameType]
		FROM
			[raw].[Game]
		ORDER BY
			[Date]
			,[GameID]
			,CONVERT(INT, [GameNumber])


		-- Hash Data Rows
		UPDATE g
		SET [RowHash] = HASHBYTES('SHA2_512', (
			SELECT
				[RetroGameID]
				,[RetroParkID]
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
				,[GameType]
				FOR XML RAW
			) )
		FROM
			[stg].[Game] g






		/* Event */

		-- Insert Data
		INSERT INTO [stg].[Event]
		(
			[RetroGameID]
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
			[RetroGameID] = [GameID]
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
			,[LeadoffFlag] = CASE WHEN [LeadoffFlag] = 'T' THEN 1 ELSE 0 END
			,[PinchHitFlag] = CASE WHEN [PinchHitFlag] = 'T' THEN 1 ELSE 0 END
			,[DefensivePosition]
			,[LineupPosition]
			,[EventType]
			,[BatterEventFlag] = CASE WHEN [BatterEventFlag] = 'T' THEN 1 ELSE 0 END
			,[ABFlag] = CASE WHEN [ABFlag] = 'T' THEN 1 ELSE 0 END
			,[HitValue]
			,[SHFlag] = CASE WHEN [SHFlag] = 'T' THEN 1 ELSE 0 END
			,[SFFlag] = CASE WHEN [SFFlag] = 'T' THEN 1 ELSE 0 END
			,[OutsOnPlay]
			,[DoublePlayFlag] = CASE WHEN [DoublePlayFlag] = 'T' THEN 1 ELSE 0 END
			,[TriplePlayFlag] = CASE WHEN [TriplePlayFlag] = 'T' THEN 1 ELSE 0 END
			,[RBIOnPlay]
			,[WildPitchFlag] = CASE WHEN [WildPitchFlag] = 'T' THEN 1 ELSE 0 END
			,[PassedBallFlag] = CASE WHEN [PassedBallFlag] = 'T' THEN 1 ELSE 0 END
			,[FieldedBy]
			,[BattedBallType]
			,[BuntFlag] = CASE WHEN [BuntFlag] = 'T' THEN 1 ELSE 0 END
			,[FoulFlag] = CASE WHEN [FoulFlag] = 'T' THEN 1 ELSE 0 END
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
			,[SBForRunnerOn1stFlag] = CASE WHEN [SBForRunnerOn1stFlag] = 'T' THEN 1 ELSE 0 END
			,[SBForRunnerOn2ndFlag] = CASE WHEN [SBForRunnerOn2ndFlag] = 'T' THEN 1 ELSE 0 END
			,[SBForRunnerOn3rdFlag] = CASE WHEN [SBForRunnerOn3rdFlag] = 'T' THEN 1 ELSE 0 END
			,[CSForRunnerOn1stFlag] = CASE WHEN [CSForRunnerOn1stFlag] = 'T' THEN 1 ELSE 0 END
			,[CSForRunnerOn2ndFlag] = CASE WHEN [CSForRunnerOn2ndFlag] = 'T' THEN 1 ELSE 0 END
			,[CSForRunnerOn3rdFlag] = CASE WHEN [CSForRunnerOn3rdFlag] = 'T' THEN 1 ELSE 0 END
			,[POForRunnerOn1stFlag] = CASE WHEN [POForRunnerOn1stFlag] = 'T' THEN 1 ELSE 0 END
			,[POForRunnerOn2ndFlag] = CASE WHEN [POForRunnerOn2ndFlag] = 'T' THEN 1 ELSE 0 END
			,[POForRunnerOn3rdFlag] = CASE WHEN [POForRunnerOn3rdFlag] = 'T' THEN 1 ELSE 0 END
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
			,[NewGameFlag] = CASE WHEN [NewGameFlag] = 'T' THEN 1 ELSE 0 END
			,[EndGameFlag] = CASE WHEN [EndGameFlag] = 'T' THEN 1 ELSE 0 END
			,[PinchRunnerOn1st] = CASE WHEN [PinchRunnerOn1st] = 'T' THEN 1 ELSE 0 END
			,[PinchRunnerOn2nd] = CASE WHEN [PinchRunnerOn2nd] = 'T' THEN 1 ELSE 0 END
			,[PinchRunnerOn3rd] = CASE WHEN [PinchRunnerOn3rd] = 'T' THEN 1 ELSE 0 END
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
		FROM
			[raw].[Event]
		ORDER BY
			SUBSTRING([GameID], 4, 4) + '-' + SUBSTRING([GameID], 8, 2) + '-' + SUBSTRING([GameID], 10, 2)
			,[GameID]
			,CONVERT(INT, [EventNum])


		-- Hash Data Rows
		UPDATE e
		SET [RowHash] =
			HASHBYTES('SHA2_512', (
				SELECT
					[RetroGameID]
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
				FOR XML RAW
			)
		)
		FROM
			[stg].[Event] e





------- END PROCEDURE CODE -------------------------------------------------------------------------

		COMMIT TRANSACTION
		RETURN 0

	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		SET @ErrorLine = ERROR_LINE()
		SET @ErrorMessage = ERROR_MESSAGE()

		RAISERROR('ERROR LINE: %s', 0, 1, @ErrorLine)
		RAISERROR('ERROR MESSAGE: %s', 0, 1, @ErrorMessage)

		RETURN 1

	END CATCH
END
GO

