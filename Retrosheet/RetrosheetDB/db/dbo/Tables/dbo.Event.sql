CREATE TABLE [dbo].[Event]
(
	[EventID] UNIQUEIDENTIFIER NOT NULL
	,[GameID] UNIQUEIDENTIFIER NOT NULL
	,[EventNum] INT NULL
	,[Inning] INT NULL
	,[BattingTeam] BIT NULL
	,[Outs] INT NULL
	,[Balls] INT NULL
	,[Strikes] INT NULL
	,[PitchSequence] VARCHAR(25) NULL
	,[VisScore] INT NULL
	,[HomeScore] INT NULL
	,[Batter] UNIQUEIDENTIFIER NULL
	,[BatterHand] CHAR(1) NULL
	,[ResBatter] UNIQUEIDENTIFIER NULL
	,[ResBatterHand] CHAR(1) NULL
	,[Pitcher] UNIQUEIDENTIFIER NULL
	,[PitcherHand] CHAR(1) NULL
	,[ResPitcher] UNIQUEIDENTIFIER NULL
	,[ResPitcherHand] CHAR(1) NULL
	,[Catcher] UNIQUEIDENTIFIER NULL
	,[FirstBase] UNIQUEIDENTIFIER NULL
	,[SecondBase] UNIQUEIDENTIFIER NULL
	,[ThirdBase] UNIQUEIDENTIFIER NULL
	,[Shortstop] UNIQUEIDENTIFIER NULL
	,[LeftField] UNIQUEIDENTIFIER NULL
	,[CenterField] UNIQUEIDENTIFIER NULL
	,[RightField] UNIQUEIDENTIFIER NULL
	,[FirstRunner] UNIQUEIDENTIFIER NULL
	,[SecondRunner] UNIQUEIDENTIFIER NULL
	,[ThirdRunner]UNIQUEIDENTIFIER NULL
	,[EventText] VARCHAR(50) NULL
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
	,[HitLocation] VARCHAR(4) NULL
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
	,[PlayOnBatter] VARCHAR(10) NULL
	,[PlayOnRunnerOn1st] VARCHAR(10) NULL
	,[PlayOnRunnerOn2nd] VARCHAR(10) NULL
	,[PlayOnRunnerOn3rd] VARCHAR(10) NULL
	,[SBForRunnerOn1stFlag] BIT NULL
	,[SBForRunnerOn2ndFlag] BIT NULL
	,[SBForRunnerOn3rdFlag] BIT NULL
	,[CSForRunnerOn1stFlag] BIT NULL
	,[CSForRunnerOn2ndFlag] BIT NULL
	,[CSForRunnerOn3rdFlag] BIT NULL
	,[POForRunnerOn1stFlag] BIT NULL
	,[POForRunnerOn2ndFlag] BIT NULL
	,[POForRunnerOn3rdFlag] BIT NULL
	,[ResponsiblePitcherForRunnerOn1st] UNIQUEIDENTIFIER NULL
	,[ResponsiblePitcherForRunnerOn2nd] UNIQUEIDENTIFIER NULL
	,[ResponsiblePitcherForRunnerOn3rd] UNIQUEIDENTIFIER NULL
	,[NewGameFlag] BIT NULL
	,[EndGameFlag] BIT NULL
	,[PinchRunnerOn1st] BIT NULL
	,[PinchRunnerOn2nd] BIT NULL
	,[PinchRunnerOn3rd] BIT NULL
	,[RunnerRemovedForPinchRunnerOn1st] UNIQUEIDENTIFIER NULL
	,[RunnerRemovedForPinchRunnerOn1st2nd] UNIQUEIDENTIFIER NULL
	,[RunnerRemovedForPinchRunnerOn1st3rd] UNIQUEIDENTIFIER NULL
	,[BatterRemovedForPinchHitter] UNIQUEIDENTIFIER NULL
	,[PositionOfBatterRemovedForPinchHitter] INT NULL
	,[FielderWithFirstPutout] INT NULL
	,[FielderWithSecondPutout] INT NULL
	,[FielderWithThirdPutout] INT NULL
	,[FielderWithFirstAssist] INT NULL
	,[FielderWithSecondAssist] INT NULL
	,[FielderWithThirdAssist] INT NULL
	,[FielderWithFourthAssist] INT NULL
	,[FielderWithFifthAssist] INT NULL
)
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [df_Event_EventID] DEFAULT NEWID() FOR [EventID]
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [ak_Event_RetroGameID_EventNum] UNIQUE ([GameID], [EventNum])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster01] FOREIGN KEY ([Batter]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster02] FOREIGN KEY ([ResBatter]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster03] FOREIGN KEY ([Pitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster04] FOREIGN KEY ([ResPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster05] FOREIGN KEY ([Catcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster06] FOREIGN KEY ([FirstBase]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster07] FOREIGN KEY ([SecondBase]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster08] FOREIGN KEY ([ThirdBase]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster09] FOREIGN KEY ([Shortstop]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster10] FOREIGN KEY ([LeftField]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster11] FOREIGN KEY ([CenterField]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster12] FOREIGN KEY ([RightField]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster13] FOREIGN KEY ([FirstRunner]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster14] FOREIGN KEY ([SecondRunner]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster15] FOREIGN KEY ([ThirdRunner]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster16] FOREIGN KEY ([ResponsiblePitcherForRunnerOn1st]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster17] FOREIGN KEY ([ResponsiblePitcherForRunnerOn2nd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster18] FOREIGN KEY ([ResponsiblePitcherForRunnerOn3rd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster19] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster20] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st2nd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster21] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st3rd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster22] FOREIGN KEY ([BatterRemovedForPinchHitter]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

