CREATE TABLE [stg].[Game]
(
	[StgGameID] UNIQUEIDENTIFIER NOT NULL
	,[RetroGameID] CHAR(12) NULL
	,[ParkID] CHAR(5) NULL
	,[Date] DATE NULL
	,[GameNumber] INT NULL
	,[DayOfWeek] VARCHAR(10) NULL
	,[StartTime] VARCHAR(5) NULL
	,[DHUsedFlag] BIT NULL
	,[DayNightFlag] CHAR(1) NULL
	,[VisitingTeam] CHAR(3) NULL
	,[HomeTeam] CHAR(3) NULL
	,[VisitorStartingPitcher] CHAR(8) NULL
	,[HomeStartingPitcher] CHAR(8) NULL
	,[HomePlateUmpire] CHAR(8) NULL
	,[FirstBaseUmpire] CHAR(8) NULL
	,[SecondBaseUmpire] CHAR(8) NULL
	,[ThirdBaseUmpire] CHAR(8) NULL
	,[LeftFieldUmpire] CHAR(8) NULL
	,[RightFieldUmpire] CHAR(8) NULL
	,[Attendance] INT NULL
	,[PSScorer] NVARCHAR(500) NULL
	,[Translator] NVARCHAR(500) NULL
	,[Inputter] NVARCHAR(500) NULL
	,[InputTime] NVARCHAR(500) NULL
	,[EditTime] NVARCHAR(500) NULL
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
	,[WinningPitcher] CHAR(8) NULL
	,[LosingPitcher] CHAR(8) NULL
	,[SaveFor] CHAR(8) NULL
	,[GWRBI] VARCHAR(25) NULL
	,[VisitorBatter1] CHAR(8) NULL
	,[VisitorPosition1] INT
	,[VisitorBatter2] CHAR(8) NULL
	,[VisitorPosition2] INT
	,[VisitorBatter3] CHAR(8) NULL
	,[VisitorPosition3] INT
	,[VisitorBatter4] CHAR(8) NULL
	,[VisitorPosition4] INT
	,[VisitorBatter5] CHAR(8) NULL
	,[VisitorPosition5] INT
	,[VisitorBatter6] CHAR(8) NULL
	,[VisitorPosition6] INT
	,[VisitorBatter7] CHAR(8) NULL
	,[VisitorPosition7] INT
	,[VisitorBatter8] CHAR(8) NULL
	,[VisitorPosition8] INT
	,[VisitorBatter9] CHAR(8) NULL
	,[VisitorPosition9] INT
	,[HomeBatter1] CHAR(8) NULL
	,[HomePosition1] INT
	,[HomeBatter2] CHAR(8) NULL
	,[HomePosition2] INT
	,[HomeBatter3] CHAR(8) NULL
	,[HomePosition3] INT
	,[HomeBatter4] CHAR(8) NULL
	,[HomePosition4] INT
	,[HomeBatter5] CHAR(8) NULL
	,[HomePosition5] INT
	,[HomeBatter6] CHAR(8) NULL
	,[HomePosition6] INT
	,[HomeBatter7] CHAR(8) NULL
	,[HomePosition7] INT
	,[HomeBatter8] CHAR(8) NULL
	,[HomePosition8] INT
	,[HomeBatter9] CHAR(8) NULL
	,[HomePosition9] INT
	,[VisitingFinisher] CHAR(8) NULL
	,[HomeFinisher] CHAR(8) NULL
	,[OfficialScorer] CHAR(8) NULL
	,CONSTRAINT [pk_Game] PRIMARY KEY NONCLUSTERED ([StgGameID])
)
GO

ALTER TABLE [stg].[Game] ADD CONSTRAINT [df_Game_StgGameID] DEFAULT NEWID() FOR [StgGameID]
GO

