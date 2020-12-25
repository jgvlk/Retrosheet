CREATE TABLE [dbo].[Game]
(
	[GameID] UNIQUEIDENTIFIER NOT NULL
	,[RetroGameID] CHAR(12) NOT NULL
	,[ParkID] UNIQUEIDENTIFIER NOT NULL
	,[Date] DATE NULL
	,[GameNumber] INT NULL
	,[DayOfWeek] VARCHAR(10) NULL
	,[StartTime] VARCHAR(5) NULL
	,[DHUsedFlag] BIT NULL
	,[DayNightFlag] CHAR(1) NULL
	,[VisitingTeam] CHAR(3) NULL
	,[HomeTeam] CHAR(3) NULL
	,[VisitorStartingPitcher] UNIQUEIDENTIFIER NULL
	,[HomeStartingPitcher] UNIQUEIDENTIFIER NULL
	,[HomePlateUmpire] UNIQUEIDENTIFIER NULL
	,[FirstBaseUmpire] UNIQUEIDENTIFIER NULL
	,[SecondBaseUmpire] UNIQUEIDENTIFIER NULL
	,[ThirdBaseUmpire] UNIQUEIDENTIFIER NULL
	,[LeftFieldUmpire] UNIQUEIDENTIFIER NULL
	,[RightFieldUmpire] UNIQUEIDENTIFIER NULL
	,[Attendance] INT NULL
	--,[PSScorer] NVARCHAR(500) NULL
	--,[Translator] NVARCHAR(500) NULL
	--,[Inputter] NVARCHAR(500) NULL
	--,[InputTime] NVARCHAR(500) NULL
	--,[EditTime] NVARCHAR(500) NULL
	,[HowScored] INT NULL
	,[PitchesEntered] INT NULL
	,[Temperature] INT NULL
	,[WindDirection] INT NULL
	,[WindSpeed] INT NULL
	,[FieldCondition] INT NULL
	,[Precipitation] INT NULL
	,[Sky] INT NULL
	,[TimeOfGame] INT NULL
	,[NumberOfInnings] INT NULL
	,[VisitorFinalScore] INT NULL
	,[HomeFinalScore] INT NULL
	,[VisitorHits] INT NULL
	,[HomeHits] INT NULL
	,[VisitorErrors] INT NULL
	,[HomeErrors] INT NULL
	,[VisitorLeftOnBase] INT NULL
	,[HomeLeftOnBase] INT NULL
	,[WinningPitcher] UNIQUEIDENTIFIER NULL
	,[LosingPitcher] UNIQUEIDENTIFIER NULL
	,[SaveFor] UNIQUEIDENTIFIER NULL
	,[GWRBI] VARCHAR(25) NULL
	,[VisitorBatter1] UNIQUEIDENTIFIER NULL
	,[VisitorPosition1] INT
	,[VisitorBatter2] UNIQUEIDENTIFIER NULL
	,[VisitorPosition2] INT
	,[VisitorBatter3] UNIQUEIDENTIFIER NULL
	,[VisitorPosition3] INT
	,[VisitorBatter4] UNIQUEIDENTIFIER NULL
	,[VisitorPosition4] INT
	,[VisitorBatter5] UNIQUEIDENTIFIER NULL
	,[VisitorPosition5] INT
	,[VisitorBatter6] UNIQUEIDENTIFIER NULL
	,[VisitorPosition6] INT
	,[VisitorBatter7] UNIQUEIDENTIFIER NULL
	,[VisitorPosition7] INT
	,[VisitorBatter8] UNIQUEIDENTIFIER NULL
	,[VisitorPosition8] INT
	,[VisitorBatter9] UNIQUEIDENTIFIER NULL
	,[VisitorPosition9] INT
	,[HomeBatter1] UNIQUEIDENTIFIER NULL
	,[HomePosition1] INT
	,[HomeBatter2] UNIQUEIDENTIFIER NULL
	,[HomePosition2] INT
	,[HomeBatter3] UNIQUEIDENTIFIER NULL
	,[HomePosition3] INT
	,[HomeBatter4] UNIQUEIDENTIFIER NULL
	,[HomePosition4] INT
	,[HomeBatter5] UNIQUEIDENTIFIER NULL
	,[HomePosition5] INT
	,[HomeBatter6] UNIQUEIDENTIFIER NULL
	,[HomePosition6] INT
	,[HomeBatter7] UNIQUEIDENTIFIER NULL
	,[HomePosition7] INT
	,[HomeBatter8] UNIQUEIDENTIFIER NULL
	,[HomePosition8] INT
	,[HomeBatter9] UNIQUEIDENTIFIER NULL
	,[HomePosition9] INT
	,[VisitingFinisher] UNIQUEIDENTIFIER NULL
	,[HomeFinisher] UNIQUEIDENTIFIER NULL
	,[OfficialScorer] UNIQUEIDENTIFIER NULL
)
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [df_Game_GameID] DEFAULT NEWID() FOR [GameID]
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [ak_Game_RetroGameID] UNIQUE ([RetroGameID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_ParkMaster] FOREIGN KEY ([ParkID]) REFERENCES [dbo].[ParkMaster]([ParkID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster01] FOREIGN KEY ([VisitorStartingPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster02] FOREIGN KEY ([HomeStartingPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster03] FOREIGN KEY ([HomePlateUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster04] FOREIGN KEY ([FirstBaseUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster05] FOREIGN KEY ([SecondBaseUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster06] FOREIGN KEY ([ThirdBaseUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster07] FOREIGN KEY ([LeftFieldUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster08] FOREIGN KEY ([RightFieldUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster09] FOREIGN KEY ([WinningPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster10] FOREIGN KEY ([LosingPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster11] FOREIGN KEY ([SaveFor]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster12] FOREIGN KEY ([VisitorBatter1]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster13] FOREIGN KEY ([VisitorBatter2]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster14] FOREIGN KEY ([VisitorBatter3]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster15] FOREIGN KEY ([VisitorBatter4]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster16] FOREIGN KEY ([VisitorBatter5]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster17] FOREIGN KEY ([VisitorBatter6]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster18] FOREIGN KEY ([VisitorBatter7]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster19] FOREIGN KEY ([VisitorBatter8]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster20] FOREIGN KEY ([VisitorBatter9]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster21] FOREIGN KEY ([HomeBatter1]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster22] FOREIGN KEY ([HomeBatter2]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster23] FOREIGN KEY ([HomeBatter3]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster24] FOREIGN KEY ([HomeBatter4]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster25] FOREIGN KEY ([HomeBatter5]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster26] FOREIGN KEY ([HomeBatter6]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster27] FOREIGN KEY ([HomeBatter7]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster28] FOREIGN KEY ([HomeBatter8]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster29] FOREIGN KEY ([HomeBatter9]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster30] FOREIGN KEY ([VisitingFinisher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster31] FOREIGN KEY ([HomeFinisher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster32] FOREIGN KEY ([OfficialScorer]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
GO



