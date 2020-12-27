CREATE TABLE [stg].[Event]
(
	[StgEventID] UNIQUEIDENTIFIER NOT NULL
	,[RetroGameID] VARCHAR(25) NOT NULL
	,[EventNum] INT NULL
	,[Inning] INT NULL
	,[BattingTeam] BIT NULL
	,[Outs] INT NULL
	,[Balls] INT NULL
	,[Strikes] INT NULL
	,[PitchSequence] VARCHAR(MAX) NULL
	,[VisScore] INT NULL
	,[HomeScore] INT NULL
	,[Batter] VARCHAR(25) NULL
	,[BatterHand] VARCHAR(25) NULL
	,[ResBatter] VARCHAR(25) NULL
	,[ResBatterHand] VARCHAR(25) NULL
	,[Pitcher] VARCHAR(25) NULL
	,[PitcherHand] VARCHAR(25) NULL
	,[ResPitcher] VARCHAR(25) NULL
	,[ResPitcherHand] VARCHAR(25) NULL
	,[Catcher] VARCHAR(25) NULL
	,[FirstBase] VARCHAR(25) NULL
	,[SecondBase] VARCHAR(25) NULL
	,[ThirdBase] VARCHAR(25) NULL
	,[Shortstop] VARCHAR(25) NULL
	,[LeftField] VARCHAR(25) NULL
	,[CenterField] VARCHAR(25) NULL
	,[RightField] VARCHAR(25) NULL
	,[FirstRunner] VARCHAR(25) NULL
	,[SecondRunner]VARCHAR(25) NULL
	,[ThirdRunner] VARCHAR(25) NULL
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
	,[BattedBallType] VARCHAR(25) NULL
	,[BuntFlag] BIT NULL
	,[FoulFlag] BIT NULL
	,[HitLocation] VARCHAR(25) NULL
	,[NumErrors] INT NULL
	,[ErrorPlayer1] INT NULL
	,[ErrorType1] VARCHAR(25) NULL
	,[ErrorPlayer2] INT NULL
	,[ErrorType2] VARCHAR(25) NULL
	,[ErrorPlayer3] INT NULL
	,[ErrorType3] VARCHAR(25) NULL
	,[BatterDest] INT NULL
	,[RunnerOn1stDest] INT NULL
	,[RunnerOn2ndDest] INT NULL
	,[RunnerOn3rdDest] INT NULL
	,[PlayOnBatter] VARCHAR(100) NULL
	,[PlayOnRunnerOn1st] VARCHAR(100) NULL
	,[PlayOnRunnerOn2nd] VARCHAR(100) NULL
	,[PlayOnRunnerOn3rd] VARCHAR(100) NULL
	,[SBForRunnerOn1stFlag] BIT NULL
	,[SBForRunnerOn2ndFlag] BIT NULL
	,[SBForRunnerOn3rdFlag] BIT NULL
	,[CSForRunnerOn1stFlag] BIT NULL
	,[CSForRunnerOn2ndFlag] BIT NULL
	,[CSForRunnerOn3rdFlag] BIT NULL
	,[POForRunnerOn1stFlag] BIT NULL
	,[POForRunnerOn2ndFlag] BIT NULL
	,[POForRunnerOn3rdFlag] BIT NULL
	,[ResponsiblePitcherForRunnerOn1st] VARCHAR(25) NULL
	,[ResponsiblePitcherForRunnerOn2nd] VARCHAR(25) NULL
	,[ResponsiblePitcherForRunnerOn3rd] VARCHAR(25) NULL
	,[NewGameFlag] BIT NULL
	,[EndGameFlag] BIT NULL
	,[PinchRunnerOn1st] BIT NULL
	,[PinchRunnerOn2nd] BIT NULL
	,[PinchRunnerOn3rd] BIT NULL
	,[RunnerRemovedForPinchRunnerOn1st] VARCHAR(25) NULL
	,[RunnerRemovedForPinchRunnerOn1st2nd] VARCHAR(25) NULL
	,[RunnerRemovedForPinchRunnerOn1st3rd] VARCHAR(25) NULL
	,[BatterRemovedForPinchHitter] VARCHAR(25) NULL
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

