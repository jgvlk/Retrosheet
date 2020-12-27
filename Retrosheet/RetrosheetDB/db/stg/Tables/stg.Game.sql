CREATE TABLE [stg].[Game]
(
	[StgGameID] UNIQUEIDENTIFIER NOT NULL
	,[RetroGameID] VARCHAR(25) NULL
	,[ParkID] VARCHAR(25) NULL
	,[Date] DATE NULL
	,[GameNumber] INT NULL
	,[DayOfWeek] VARCHAR(25) NULL
	,[StartTime] VARCHAR(25) NULL
	,[DHUsedFlag] BIT NULL
	,[DayNightFlag] VARCHAR(25) NULL
	,[VisitingTeam] VARCHAR(25) NULL
	,[HomeTeam] VARCHAR(25) NULL
	,[VisitorStartingPitcher] VARCHAR(25) NULL
	,[HomeStartingPitcher] VARCHAR(25) NULL
	,[HomePlateUmpire] VARCHAR(25) NULL
	,[FirstBaseUmpire] VARCHAR(25) NULL
	,[SecondBaseUmpire] VARCHAR(25) NULL
	,[ThirdBaseUmpire] VARCHAR(25) NULL
	,[LeftFieldUmpire] VARCHAR(25) NULL
	,[RightFieldUmpire] VARCHAR(25) NULL
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
	,[WinningPitcher] VARCHAR(25) NULL
	,[LosingPitcher] VARCHAR(25) NULL
	,[SaveFor] VARCHAR(25) NULL
	,[GWRBI] VARCHAR(25) NULL
	,[VisitorBatter1] VARCHAR(25) NULL
	,[VisitorPosition1] INT
	,[VisitorBatter2] VARCHAR(25) NULL
	,[VisitorPosition2] INT
	,[VisitorBatter3] VARCHAR(25) NULL
	,[VisitorPosition3] INT
	,[VisitorBatter4] VARCHAR(25) NULL
	,[VisitorPosition4] INT
	,[VisitorBatter5] VARCHAR(25) NULL
	,[VisitorPosition5] INT
	,[VisitorBatter6] VARCHAR(25) NULL
	,[VisitorPosition6] INT
	,[VisitorBatter7] VARCHAR(25) NULL
	,[VisitorPosition7] INT
	,[VisitorBatter8] VARCHAR(25) NULL
	,[VisitorPosition8] INT
	,[VisitorBatter9] VARCHAR(25) NULL
	,[VisitorPosition9] INT
	,[HomeBatter1] VARCHAR(25) NULL
	,[HomePosition1] INT
	,[HomeBatter2] VARCHAR(25) NULL
	,[HomePosition2] INT
	,[HomeBatter3] VARCHAR(25) NULL
	,[HomePosition3] INT
	,[HomeBatter4] CHAR(8) NULL
	,[HomePosition4] INT
	,[HomeBatter5] VARCHAR(25) NULL
	,[HomePosition5] INT
	,[HomeBatter6] VARCHAR(25) NULL
	,[HomePosition6] INT
	,[HomeBatter7] VARCHAR(25) NULL
	,[HomePosition7] INT
	,[HomeBatter8] VARCHAR(25) NULL
	,[HomePosition8] INT
	,[HomeBatter9] VARCHAR(25) NULL
	,[HomePosition9] INT
	,[VisitingFinisher] VARCHAR(25) NULL
	,[HomeFinisher] VARCHAR(25) NULL
	,[OfficialScorer] VARCHAR(25) NULL
	,CONSTRAINT [pk_Game] PRIMARY KEY NONCLUSTERED ([StgGameID])
)
GO

ALTER TABLE [stg].[Game] ADD CONSTRAINT [df_Game_StgGameID] DEFAULT NEWID() FOR [StgGameID]
GO

