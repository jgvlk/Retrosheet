IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]

CREATE TABLE [dbo].[Game](
	[GameID] [bigint] IDENTITY(1,1) NOT NULL,
	[RetroGameID] [char](12) NULL,
	[ParkID] [int] NULL,
	[GameType] [varchar](50) NULL,
	[Date] [date] NULL,
	[GameNumber] [int] NULL,
	[DayOfWeek] [varchar](10) NULL,
	[StartTime] [varchar](5) NULL,
	[DHUsedFlag] [bit] NULL,
	[DayNightFlag] [char](1) NULL,
	[VisitingTeam] [char](3) NULL,
	[HomeTeam] [char](3) NULL,
	[VisitorStartingPitcher] [int] NULL,
	[HomeStartingPitcher] [int] NULL,
	[HomePlateUmpire] [int] NULL,
	[FirstBaseUmpire] [int] NULL,
	[SecondBaseUmpire] [int] NULL,
	[ThirdBaseUmpire] [int] NULL,
	[LeftFieldUmpire] [int] NULL,
	[RightFieldUmpire] [int] NULL,
	[Attendance] [int] NULL,
	[HowScored] [int] NULL,
	[PitchesEntered] [int] NULL,
	[Temperature] [int] NULL,
	[WindDirection] [int] NULL,
	[WindSpeed] [int] NULL,
	[FieldCondition] [int] NULL,
	[Precipitation] [int] NULL,
	[Sky] [int] NULL,
	[TimeOfGame] [int] NULL,
	[NumberOfInnings] [int] NULL,
	[VisitorFinalScore] [int] NULL,
	[HomeFinalScore] [int] NULL,
	[VisitorHits] [int] NULL,
	[HomeHits] [int] NULL,
	[VisitorErrors] [int] NULL,
	[HomeErrors] [int] NULL,
	[VisitorLeftOnBase] [int] NULL,
	[HomeLeftOnBase] [int] NULL,
	[WinningPitcher] [int] NULL,
	[LosingPitcher] [int] NULL,
	[SaveFor] [int] NULL,
	[GWRBI] [int] NULL,
	[VisitorBatter1] [int] NULL,
	[VisitorPosition1] [int] NULL,
	[VisitorBatter2] [int] NULL,
	[VisitorPosition2] [int] NULL,
	[VisitorBatter3] [int] NULL,
	[VisitorPosition3] [int] NULL,
	[VisitorBatter4] [int] NULL,
	[VisitorPosition4] [int] NULL,
	[VisitorBatter5] [int] NULL,
	[VisitorPosition5] [int] NULL,
	[VisitorBatter6] [int] NULL,
	[VisitorPosition6] [int] NULL,
	[VisitorBatter7] [int] NULL,
	[VisitorPosition7] [int] NULL,
	[VisitorBatter8] [int] NULL,
	[VisitorPosition8] [int] NULL,
	[VisitorBatter9] [int] NULL,
	[VisitorPosition9] [int] NULL,
	[HomeBatter1] [int] NULL,
	[HomePosition1] [int] NULL,
	[HomeBatter2] [int] NULL,
	[HomePosition2] [int] NULL,
	[HomeBatter3] [int] NULL,
	[HomePosition3] [int] NULL,
	[HomeBatter4] [int] NULL,
	[HomePosition4] [int] NULL,
	[HomeBatter5] [int] NULL,
	[HomePosition5] [int] NULL,
	[HomeBatter6] [int] NULL,
	[HomePosition6] [int] NULL,
	[HomeBatter7] [int] NULL,
	[HomePosition7] [int] NULL,
	[HomeBatter8] [int] NULL,
	[HomePosition8] [int] NULL,
	[HomeBatter9] [int] NULL,
	[HomePosition9] [int] NULL,
	[VisitingFinisher] [int] NULL,
	[HomeFinisher] [int] NULL,
	[OfficialScorer] [int] NULL
 CONSTRAINT [pk_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_Game_RetroGameID] UNIQUE NONCLUSTERED 
(
	[RetroGameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
