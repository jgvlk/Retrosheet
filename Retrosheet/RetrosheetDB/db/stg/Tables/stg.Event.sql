CREATE TABLE [stg].[Event]
(
	[StgEventID] UNIQUEIDENTIFIER NOT NULL
	,[RetroGameID] CHAR(12) NOT NULL
	,[EventNum] INT NULL
	,[Inning] INT NULL
	,[BattingTeam] BIT NULL
	,[Outs] INT NULL
	,[Balls] INT NULL
	,[Strikes] INT NULL
	,[PitchSequence] VARCHAR(MAX) NULL
	,[VisScore] INT NULL
	,[HomeScore] INT NULL
	,[Batter] CHAR(8) NULL
	,[BatterHand] CHAR(1) NULL
	,[ResBatter] CHAR(8) NULL
	,[ResBatterHand] CHAR(1) NULL
	,[Pitcher] CHAR(8) NULL
	,[PitcherHand] CHAR(1) NULL
	,[ResPitcher] CHAR(8) NULL
	,[ResPitcherHand] CHAR(1) NULL
	,[Catcher] CHAR(8) NULL
	,[FirstBase] CHAR(8) NULL
	,[SecondBase] CHAR(8) NULL
	,[ThirdBase] CHAR(8) NULL
	,[Shortstop] CHAR(8) NULL
	,[LeftField] CHAR(8) NULL
	,[CenterField] CHAR(8) NULL
	,[RightField] CHAR(8) NULL
	,[FirstRunner] CHAR(8) NULL
	,[SecondRunner] CHAR(8) NULL
	,[ThirdRunner] CHAR(8) NULL
	,[EventText] VARCHAR(MAX) NULL
	,[LeadoffFlag] BIT NULL
	,[PinchHitFlag] BIT NULL
	,[DefensivePosition] INT NULL
	,[LineupPosition] INT NULL
	,[EventType] INT NULL
	,[BatterEventFlag] BIT NULL
	,[ABFlag] BIT NULL
	,[HitValue] INT NULL
	,[SHFlag] BIT NULL
	,[SFFlag] BIT NULL
	,[OutsOnPlay] INT NULL
	,[DoublePlayFlag] BIT NULL
	,[TriplePlayFlag] BIT NULL
	,[RBIOnPlay] INT NULL
	,[WildPitchFlag] BIT NULL
	,[PassedBallFlag] BIT NULL
	,[FieldedBy] BIT NULL
	,[BattedBallType] CHAR(1) NULL
	,[BuntFlag] BIT NULL
	,[FoulFlag] BIT NULL
	,[HitLocation] VARCHAR(10) NULL
	,[NumErrors] INT NULL
	,[ErrorPlayer1] INT NULL
	,[ErrorType1] CHAR(1) NULL
	,[ErrorPlayer2] INT NULL
	,[ErrorType2] CHAR(1) NULL
	,[ErrorPlayer3] INT NULL
	,[ErrorType3] CHAR(1) NULL
	,[BatterDest] INT NULL
	,[RunnerOn1stDest] INT NULL
	,[RunnerOn2ndDest] INT NULL
	,[RunnerOn3rdDest] INT NULL
	,[PlayOnBatter] VARCHAR(50) NULL
	,[PlayOnRunnerOn1st] VARCHAR(50) NULL
	,[PlayOnRunnerOn2nd] VARCHAR(50) NULL
	,[PlayOnRunnerOn3rd] VARCHAR(50) NULL
	,[SBForRunnerOn1stFlag] BIT NULL
	,[SBForRunnerOn2ndFlag] BIT NULL
	,[SBForRunnerOn3rdFlag] BIT NULL
	,[CSForRunnerOn1stFlag] BIT NULL
	,[CSForRunnerOn2ndFlag] BIT NULL
	,[CSForRunnerOn3rdFlag] BIT NULL
	,[POForRunnerOn1stFlag] BIT NULL
	,[POForRunnerOn2ndFlag] BIT NULL
	,[POForRunnerOn3rdFlag] BIT NULL
	,[ResponsiblePitcherForRunnerOn1st] CHAR(8) NULL
	,[ResponsiblePitcherForRunnerOn2nd] CHAR(8) NULL
	,[ResponsiblePitcherForRunnerOn3rd] CHAR(8) NULL
	,[NewGameFlag] BIT NULL
	,[EndGameFlag] BIT NULL
	,[PinchRunnerOn1st] BIT NULL
	,[PinchRunnerOn2nd] BIT NULL
	,[PinchRunnerOn3rd] BIT NULL
	,[RunnerRemovedForPinchRunnerOn1st] CHAR(8) NULL
	,[RunnerRemovedForPinchRunnerOn1st2nd] CHAR(8) NULL
	,[RunnerRemovedForPinchRunnerOn1st3rd] CHAR(8) NULL
	,[BatterRemovedForPinchHitter] CHAR(8) NULL
	,[PositionOfBatterRemovedForPinchHitter] INT NULL
	,[FielderWithFirstPutout] INT NULL
	,[FielderWithSecondPutout] INT NULL
	,[FielderWithThirdPutout] INT NULL
	,[FielderWithFirstAssist] INT NULL
	,[FielderWithSecondAssist] INT NULL
	,[FielderWithThirdAssist] INT NULL
	,[FielderWithFourthAssist] INT NULL
	,[FielderWithFifthAssist] INT NULL
	,CONSTRAINT [pk_Event] PRIMARY KEY NONCLUSTERED ([StgEventID])
)
GO

ALTER TABLE [stg].[Event] ADD CONSTRAINT [df_Event_StgEventID] DEFAULT NEWID() FOR [StgEventID]
GO

