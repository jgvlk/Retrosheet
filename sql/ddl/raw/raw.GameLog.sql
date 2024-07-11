IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[GameLog]') AND type in (N'U'))
DROP TABLE [raw].[GameLog]

CREATE TABLE [raw].[GameLog](
    [Date] [nvarchar](500) NULL,
    [GameNum] [nvarchar](500) NULL,
    [DayOfWeek] [nvarchar](500) NULL,
    [VisitingTeam] [nvarchar](500) NULL,
    [VisitingTeamLeague] [nvarchar](500) NULL,
    [VisitingTeamSeasonGameNum] [nvarchar](500) NULL,
    [HomeTeam] [nvarchar](500) NULL,
    [HomeTeamLeague] [nvarchar](500) NULL,
    [HomeTeamSeasonGameNum] [nvarchar](500) NULL,
    [VisitingTeamScore] [nvarchar](500) NULL,
    [HomeTeamScore] [nvarchar](500) NULL,
    [LengthOfGame] [nvarchar](500) NULL,
    [DayNight] [nvarchar](500) NULL,
    [CompletionInfo] [nvarchar](500) NULL,
    [ForfeitInfo] [nvarchar](500) NULL,
    [ProtestInfo] [nvarchar](500) NULL,
    [ParkID] [nvarchar](500) NULL,
    [Attendance] [nvarchar](500) NULL,
    [TimeOfGame] [nvarchar](500) NULL,
    [VisitingTeamLineScore] [nvarchar](500) NULL,
    [HomeTeamLineScore] [nvarchar](500) NULL,
    [VisitingTeamAtBats] [nvarchar](500) NULL,
    [VisitingTeamHits] [nvarchar](500) NULL,
    [VisitingTeamDoubles] [nvarchar](500) NULL,
    [VisitingTeamTriples] [nvarchar](500) NULL,
    [VisitingTeamHomeRuns] [nvarchar](500) NULL,
    [VisitingTeamRbi] [nvarchar](500) NULL,
    [VisitingTeamSacrificeHits] [nvarchar](500) NULL,
    [VisitingTeamSacrificeFlies] [nvarchar](500) NULL,
    [VisitingTeamHbp] [nvarchar](500) NULL,
    [VisitingTeamWalks] [nvarchar](500) NULL,
    [VisitingTeamIntentionalWalks] [nvarchar](500) NULL,
    [VisitingTeamStrikeouts] [nvarchar](500) NULL,
    [VisitingTeamStolenBases] [nvarchar](500) NULL,
    [VisitingTeamCaughtStealing] [nvarchar](500) NULL,
    [VisitingTeamGroundedIntoDp] [nvarchar](500) NULL,
    [VisitingTeamAwardedFirstOnCatcherInterference] [nvarchar](500) NULL,
    [VisitingTeamLob] [nvarchar](500) NULL,
    [VisitingTeamPitchersUsed] [nvarchar](500) NULL,
    [VisitingTeamIndivEarnedRuns] [nvarchar](500) NULL,
    [VisitingTeamTeamEarnedRuns] [nvarchar](500) NULL,
    [VisitingTeamWildPitches] [nvarchar](500) NULL,
    [VisitingTeamBalks] [nvarchar](500) NULL,
    [VisitingTeamPutouts] [nvarchar](500) NULL,
    [VisitingTeamAssits] [nvarchar](500) NULL,
    [VisitingTeamErrors] [nvarchar](500) NULL,
    [VisitingTeamPassedBalls] [nvarchar](500) NULL,
    [VisitingTeamDoublePlays] [nvarchar](500) NULL,
    [VisitingTeamTriplePlays] [nvarchar](500) NULL,
    [HomeTeamAtBats] [nvarchar](500) NULL,
    [HomeTeamHits] [nvarchar](500) NULL,
    [HomeTeamDoubles] [nvarchar](500) NULL,
    [HomeTeamTriples] [nvarchar](500) NULL,
    [HomeTeamHomeRuns] [nvarchar](500) NULL,
    [HomeTeamRbi] [nvarchar](500) NULL,
    [HomeTeamSacrificeHits] [nvarchar](500) NULL,
    [HomeTeamSacrificeFlies] [nvarchar](500) NULL,
    [HomeTeamHbp] [nvarchar](500) NULL,
    [HomeTeamWalks] [nvarchar](500) NULL,
    [HomeTeamIntentionalWalks] [nvarchar](500) NULL,
    [HomeTeamStrikeouts] [nvarchar](500) NULL,
    [HomeTeamStolenBases] [nvarchar](500) NULL,
    [HomeTeamCaughtStealing] [nvarchar](500) NULL,
    [HomeTeamGroundedIntoDp] [nvarchar](500) NULL,
    [HomeTeamAwardedFirstOnCatcherInterference] [nvarchar](500) NULL,
    [HomeTeamLob] [nvarchar](500) NULL,
    [HomeTeamPitchersUsed] [nvarchar](500) NULL,
    [HomeTeamIndivEarnedRuns] [nvarchar](500) NULL,
    [HomeTeamTeamEarnedRuns] [nvarchar](500) NULL,
    [HomeTeamWildPitches] [nvarchar](500) NULL,
    [HomeTeamBalks] [nvarchar](500) NULL,
    [HomeTeamPutouts] [nvarchar](500) NULL,
    [HomeTeamAssits] [nvarchar](500) NULL,
    [HomeTeamErrors] [nvarchar](500) NULL,
    [HomeTeamPassedBalls] [nvarchar](500) NULL,
    [HomeTeamDoublePlays] [nvarchar](500) NULL,
    [HomeTeamTriplePlays] [nvarchar](500) NULL,
    [HomePlateUmpID] [nvarchar](500) NULL,
    [HomePlateUmpName] [nvarchar](500) NULL,
    [FirstBaseUmpID] [nvarchar](500) NULL,
    [FirstBaseUmpName] [nvarchar](500) NULL,
    [SecondBaseUmpID] [nvarchar](500) NULL,
    [SecondBaseUmpName] [nvarchar](500) NULL,
    [ThirdBaseUmpID] [nvarchar](500) NULL,
    [ThirdBaseUmpName] [nvarchar](500) NULL,
    [LfUmpID] [nvarchar](500) NULL,
    [LfUmpName] [nvarchar](500) NULL,
    [RfUmpID] [nvarchar](500) NULL,
    [RfUmpName] [nvarchar](500) NULL,
    [VisitingTeamManagerID] [nvarchar](500) NULL,
    [VisitingTeamManagerName] [nvarchar](500) NULL,
    [HomeTeamManagerID] [nvarchar](500) NULL,
    [HomeTeamManagerName] [nvarchar](500) NULL,
    [WinningPitcherID] [nvarchar](500) NULL,
    [WinningPitcherName] [nvarchar](500) NULL,
    [LosingPitcherID] [nvarchar](500) NULL,
    [LosingPitcherName] [nvarchar](500) NULL,
    [SavingPitcherID] [nvarchar](500) NULL,
    [SavingPitcherName] [nvarchar](500) NULL,
    [GwRbiBatterID] [nvarchar](500) NULL,
    [GwRbiBatterName] [nvarchar](500) NULL,
    [VisitingStartingPitcherID] [nvarchar](500) NULL,
    [VisitingPitcherStartingPitcherName] [nvarchar](500) NULL,
    [HomeTeamStartingPitcherID] [nvarchar](500) NULL,
    [HomeTeamStartingPitcherName] [nvarchar](500) NULL,
    [VisitingTeamBatting1ID] [nvarchar](500) NULL,
    [VisitingTeamBatting1Name] [nvarchar](500) NULL,
    [VisitingTeamBatting1Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting2ID] [nvarchar](500) NULL,
    [VisitingTeamBatting2Name] [nvarchar](500) NULL,
    [VisitingTeamBatting2Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting3ID] [nvarchar](500) NULL,
    [VisitingTeamBatting3Name] [nvarchar](500) NULL,
    [VisitingTeamBatting3Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting4ID] [nvarchar](500) NULL,
    [VisitingTeamBatting4Name] [nvarchar](500) NULL,
    [VisitingTeamBatting4Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting5ID] [nvarchar](500) NULL,
    [VisitingTeamBatting5Name] [nvarchar](500) NULL,
    [VisitingTeamBatting5Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting6ID] [nvarchar](500) NULL,
    [VisitingTeamBatting6Name] [nvarchar](500) NULL,
    [VisitingTeamBatting6Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting7ID] [nvarchar](500) NULL,
    [VisitingTeamBatting7Name] [nvarchar](500) NULL,
    [VisitingTeamBatting7Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting8ID] [nvarchar](500) NULL,
    [VisitingTeamBatting8Name] [nvarchar](500) NULL,
    [VisitingTeamBatting8Pos] [nvarchar](500) NULL,
    [VisitingTeamBatting9ID] [nvarchar](500) NULL,
    [VisitingTeamBatting9Name] [nvarchar](500) NULL,
    [VisitingTeamBatting9Pos] [nvarchar](500) NULL,
    [HomeTeamBatting1ID] [nvarchar](500) NULL,
    [HomeTeamBatting1Name] [nvarchar](500) NULL,
    [HomeTeamBatting1Pos] [nvarchar](500) NULL,
    [HomeTeamBatting2ID] [nvarchar](500) NULL,
    [HomeTeamBatting2Name] [nvarchar](500) NULL,
    [HomeTeamBatting2Pos] [nvarchar](500) NULL,
    [HomeTeamBatting3ID] [nvarchar](500) NULL,
    [HomeTeamBatting3Name] [nvarchar](500) NULL,
    [HomeTeamBatting3Pos] [nvarchar](500) NULL,
    [HomeTeamBatting4ID] [nvarchar](500) NULL,
    [HomeTeamBatting4Name] [nvarchar](500) NULL,
    [HomeTeamBatting4Pos] [nvarchar](500) NULL,
    [HomeTeamBatting5ID] [nvarchar](500) NULL,
    [HomeTeamBatting5Name] [nvarchar](500) NULL,
    [HomeTeamBatting5Pos] [nvarchar](500) NULL,
    [HomeTeamBatting6ID] [nvarchar](500) NULL,
    [HomeTeamBatting6Name] [nvarchar](500) NULL,
    [HomeTeamBatting6Pos] [nvarchar](500) NULL,
    [HomeTeamBatting7ID] [nvarchar](500) NULL,
    [HomeTeamBatting7Name] [nvarchar](500) NULL,
    [HomeTeamBatting7Pos] [nvarchar](500) NULL,
    [HomeTeamBatting8ID] [nvarchar](500) NULL,
    [HomeTeamBatting8Name] [nvarchar](500) NULL,
    [HomeTeamBatting8Pos] [nvarchar](500) NULL,
    [HomeTeamBatting9ID] [nvarchar](500) NULL,
    [HomeTeamBatting9Name] [nvarchar](500) NULL,
    [HomeTeamBatting9Pos] [nvarchar](500) NULL,
    [AdditionalInfo] [nvarchar](500) NULL,
    [AcquisitionInfo] [nvarchar](500) NULL,
    [SourceFile] [nvarchar](500) NULL
)