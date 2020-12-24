CREATE TABLE [dbo].[Game]
(
	[GameID] UNIQUEIDENTIFIER NOT NULL
	,[RetroGameID] CHAR(12) NOT NULL
	,[ParkID] NVARCHAR(500) NULL
	,[Date] DATE NULL
	,[GameNumber] INT NULL
	,[DayOfWeek] VARCHAR(10) NULL
	,[StartTime] VARCHAR(4) NULL
	,[DHUsedFlag] NVARCHAR(500) NULL
	,[DayNightFlag] NVARCHAR(500) NULL
	,[VisitingTeam] NVARCHAR(500) NULL
	,[HomeTeam] NVARCHAR(500) NULL
	,[VisitorStartingPitcher] NVARCHAR(500) NULL
	,[HomeStartingPitcher] NVARCHAR(500) NULL
	,[HomePlateUmpire] NVARCHAR(500) NULL
	,[FirstBaseUmpire] NVARCHAR(500) NULL
	,[SecondBaseUmpire] NVARCHAR(500) NULL
	,[ThirdBaseUmpire] NVARCHAR(500) NULL
	,[LeftFieldUmpire] NVARCHAR(500) NULL
	,[RightFieldUmpire] NVARCHAR(500) NULL
	,[Attendance] NVARCHAR(500) NULL
	,[PSScorer] NVARCHAR(500) NULL
	,[Translator] NVARCHAR(500) NULL
	,[Inputter] NVARCHAR(500) NULL
	,[InputTime] NVARCHAR(500) NULL
	,[EditTime] NVARCHAR(500) NULL
	,[HowScored] NVARCHAR(500) NULL
	,[PitchesEntered] NVARCHAR(500) NULL
	,[Temperature] NVARCHAR(500) NULL
	,[WindDirection] NVARCHAR(500) NULL
	,[WindSpeed] NVARCHAR(500) NULL
	,[FieldCondition] NVARCHAR(500) NULL
	,[Precipitation] NVARCHAR(500) NULL
	,[Sky] NVARCHAR(500) NULL
	,[TimeOfGame] NVARCHAR(500) NULL
	,[NumberOfInnings] NVARCHAR(500) NULL
	,[VisitorFinalScore] NVARCHAR(500) NULL
	,[HomeFinalScore] NVARCHAR(500) NULL
	,[VisitorHits] NVARCHAR(500) NULL
	,[HomeHits] NVARCHAR(500) NULL
	,[VisitorErrors] NVARCHAR(500) NULL
	,[HomeErrors] NVARCHAR(500) NULL
	,[VisitorLeftOnBase] NVARCHAR(500) NULL
	,[HomeLeftOnBase] NVARCHAR(500) NULL
	,[WinningPitcher] NVARCHAR(500) NULL
	,[LosingPitcher] NVARCHAR(500) NULL
	,[SaveFor] NVARCHAR(500) NULL
	,[GWRBI] NVARCHAR(500) NULL
	,[VisitorBatter1] NVARCHAR(500) NULL
	,[VisitorPosition1] NVARCHAR(500) NULL
	,[VisitorBatter2] NVARCHAR(500) NULL
	,[VisitorPosition2] NVARCHAR(500) NULL
	,[VisitorBatter3] NVARCHAR(500) NULL
	,[VisitorPosition3] NVARCHAR(500) NULL
	,[VisitorBatter4] NVARCHAR(500) NULL
	,[VisitorPosition4] NVARCHAR(500) NULL
	,[VisitorBatter5] NVARCHAR(500) NULL
	,[VisitorPosition5] NVARCHAR(500) NULL
	,[VisitorBatter6] NVARCHAR(500) NULL
	,[VisitorPosition6] NVARCHAR(500) NULL
	,[VisitorBatter7] NVARCHAR(500) NULL
	,[VisitorPosition7] NVARCHAR(500) NULL
	,[VisitorBatter8] NVARCHAR(500) NULL
	,[VisitorPosition8] NVARCHAR(500) NULL
	,[VisitorBatter9] NVARCHAR(500) NULL
	,[VisitorPosition9] NVARCHAR(500) NULL
	,[HomeBatter1] NVARCHAR(500) NULL
	,[HomePosition1] NVARCHAR(500) NULL
	,[HomeBatter2] NVARCHAR(500) NULL
	,[HomePosition2] NVARCHAR(500) NULL
	,[HomeBatter3] NVARCHAR(500) NULL
	,[HomePosition3] NVARCHAR(500) NULL
	,[HomeBatter4] NVARCHAR(500) NULL
	,[HomePosition4] NVARCHAR(500) NULL
	,[HomeBatter5] NVARCHAR(500) NULL
	,[HomePosition5] NVARCHAR(500) NULL
	,[HomeBatter6] NVARCHAR(500) NULL
	,[HomePosition6] NVARCHAR(500) NULL
	,[HomeBatter7] NVARCHAR(500) NULL
	,[HomePosition7] NVARCHAR(500) NULL
	,[HomeBatter8] NVARCHAR(500) NULL
	,[HomePosition8] NVARCHAR(500) NULL
	,[HomeBatter9] NVARCHAR(500) NULL
	,[HomePosition9] NVARCHAR(500) NULL
	,[VisitingFinisher] NVARCHAR(500) NULL
	,[HomeFinisher] NVARCHAR(500) NULL
	,[OfficialScorer] NVARCHAR(500) NULL
)
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [df_Game_GameID] DEFAULT NEWID() FOR [GameID]
GO

ALTER TABLE [dbo].[Game] ADD CONSTRAINT [ak_Game_RetroGameID] UNIQUE ([RetroGameID])
GO

