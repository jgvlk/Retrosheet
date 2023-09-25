USE [Retrosheet]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Event]') AND type in (N'U'))
DROP TABLE [raw].[Event]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [raw].[Event](
	[GameID] [nvarchar](500) NOT NULL,
	[VisitingTeam] [nvarchar](500) NULL,
	[Inning] [nvarchar](500) NULL,
	[BattingTeam] [nvarchar](500) NULL,
	[Outs] [nvarchar](500) NULL,
	[Balls] [nvarchar](500) NULL,
	[Strikes] [nvarchar](500) NULL,
	[PitchSequence] [nvarchar](500) NULL,
	[VisScore] [nvarchar](500) NULL,
	[HomeScore] [nvarchar](500) NULL,
	[Batter] [nvarchar](500) NULL,
	[BatterHand] [nvarchar](500) NULL,
	[ResBatter] [nvarchar](500) NULL,
	[ResBatterHand] [nvarchar](500) NULL,
	[Pitcher] [nvarchar](500) NULL,
	[PitcherHand] [nvarchar](500) NULL,
	[ResPitcher] [nvarchar](500) NULL,
	[ResPitcherHand] [nvarchar](500) NULL,
	[Catcher] [nvarchar](500) NULL,
	[FirstBase] [nvarchar](500) NULL,
	[SecondBase] [nvarchar](500) NULL,
	[ThirdBase] [nvarchar](500) NULL,
	[Shortstop] [nvarchar](500) NULL,
	[LeftField] [nvarchar](500) NULL,
	[CenterField] [nvarchar](500) NULL,
	[RightField] [nvarchar](500) NULL,
	[FirstRunner] [nvarchar](500) NULL,
	[SecondRunner] [nvarchar](500) NULL,
	[ThirdRunner] [nvarchar](500) NULL,
	[EventText] [nvarchar](500) NULL,
	[LeadoffFlag] [nvarchar](500) NULL,
	[PinchHitFlag] [nvarchar](500) NULL,
	[DefensivePosition] [nvarchar](500) NULL,
	[LineupPosition] [nvarchar](500) NULL,
	[EventType] [nvarchar](500) NULL,
	[BatterEventFlag] [nvarchar](500) NULL,
	[ABFlag] [nvarchar](500) NULL,
	[HitValue] [nvarchar](500) NULL,
	[SHFlag] [nvarchar](500) NULL,
	[SFFlag] [nvarchar](500) NULL,
	[OutsOnPlay] [nvarchar](500) NULL,
	[DoublePlayFlag] [nvarchar](500) NULL,
	[TriplePlayFlag] [nvarchar](500) NULL,
	[RBIOnPlay] [nvarchar](500) NULL,
	[WildPitchFlag] [nvarchar](500) NULL,
	[PassedBallFlag] [nvarchar](500) NULL,
	[FieldedBy] [nvarchar](500) NULL,
	[BattedBallType] [nvarchar](500) NULL,
	[BuntFlag] [nvarchar](500) NULL,
	[FoulFlag] [nvarchar](500) NULL,
	[HitLocation] [nvarchar](500) NULL,
	[NumErrors] [nvarchar](500) NULL,
	[ErrorPlayer1] [nvarchar](500) NULL,
	[ErrorType1] [nvarchar](500) NULL,
	[ErrorPlayer2] [nvarchar](500) NULL,
	[ErrorType2] [nvarchar](500) NULL,
	[ErrorPlayer3] [nvarchar](500) NULL,
	[ErrorType3] [nvarchar](500) NULL,
	[BatterDest] [nvarchar](500) NULL,
	[RunnerOn1stDest] [nvarchar](500) NULL,
	[RunnerOn2ndDest] [nvarchar](500) NULL,
	[RunnerOn3rdDest] [nvarchar](500) NULL,
	[PlayOnBatter] [nvarchar](500) NULL,
	[PlayOnRunnerOn1st] [nvarchar](500) NULL,
	[PlayOnRunnerOn2nd] [nvarchar](500) NULL,
	[PlayOnRunnerOn3rd] [nvarchar](500) NULL,
	[SBForRunnerOn1stFlag] [nvarchar](500) NULL,
	[SBForRunnerOn2ndFlag] [nvarchar](500) NULL,
	[SBForRunnerOn3rdFlag] [nvarchar](500) NULL,
	[CSForRunnerOn1stFlag] [nvarchar](500) NULL,
	[CSForRunnerOn2ndFlag] [nvarchar](500) NULL,
	[CSForRunnerOn3rdFlag] [nvarchar](500) NULL,
	[POForRunnerOn1stFlag] [nvarchar](500) NULL,
	[POForRunnerOn2ndFlag] [nvarchar](500) NULL,
	[POForRunnerOn3rdFlag] [nvarchar](500) NULL,
	[ResponsiblePitcherForRunnerOn1st] [nvarchar](500) NULL,
	[ResponsiblePitcherForRunnerOn2nd] [nvarchar](500) NULL,
	[ResponsiblePitcherForRunnerOn3rd] [nvarchar](500) NULL,
	[NewGameFlag] [nvarchar](500) NULL,
	[EndGameFlag] [nvarchar](500) NULL,
	[PinchRunnerOn1st] [nvarchar](500) NULL,
	[PinchRunnerOn2nd] [nvarchar](500) NULL,
	[PinchRunnerOn3rd] [nvarchar](500) NULL,
	[RunnerRemovedForPinchRunnerOn1st] [nvarchar](500) NULL,
	[RunnerRemovedForPinchRunnerOn1st2nd] [nvarchar](500) NULL,
	[RunnerRemovedForPinchRunnerOn1st3rd] [nvarchar](500) NULL,
	[BatterRemovedForPinchHitter] [nvarchar](500) NULL,
	[PositionOfBatterRemovedForPinchHitter] [nvarchar](500) NULL,
	[FielderWithFirstPutout] [nvarchar](500) NULL,
	[FielderWithSecondPutout] [nvarchar](500) NULL,
	[FielderWithThirdPutout] [nvarchar](500) NULL,
	[FielderWithFirstAssist] [nvarchar](500) NULL,
	[FielderWithSecondAssist] [nvarchar](500) NULL,
	[FielderWithThirdAssist] [nvarchar](500) NULL,
	[FielderWithFourthAssist] [nvarchar](500) NULL,
	[FielderWithFifthAssist] [nvarchar](500) NULL,
	[EventNum] [nvarchar](500) NULL,
	[SourceFileName] [nvarchar](500) NULL
) ON [PRIMARY]
GO


