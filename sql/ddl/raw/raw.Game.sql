IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Game]') AND type in (N'U'))
DROP TABLE [raw].[Game]

CREATE TABLE [raw].[Game](
	[GameID] [nvarchar](500) NULL,
	[Date] [nvarchar](500) NULL,
	[GameNumber] [nvarchar](500) NULL,
	[DayOfWeek] [nvarchar](500) NULL,
	[StartTime] [nvarchar](500) NULL,
	[DHUsedFlag] [nvarchar](500) NULL,
	[DayNightFlag] [nvarchar](500) NULL,
	[VisitingTeam] [nvarchar](500) NULL,
	[HomeTeam] [nvarchar](500) NULL,
	[GameSite] [nvarchar](500) NULL,
	[VisitorStartingPitcher] [nvarchar](500) NULL,
	[HomeStartingPitcher] [nvarchar](500) NULL,
	[HomePlateUmpire] [nvarchar](500) NULL,
	[FirstBaseUmpire] [nvarchar](500) NULL,
	[SecondBaseUmpire] [nvarchar](500) NULL,
	[ThirdBaseUmpire] [nvarchar](500) NULL,
	[LeftFieldUmpire] [nvarchar](500) NULL,
	[RightFieldUmpire] [nvarchar](500) NULL,
	[Attendance] [nvarchar](500) NULL,
	[PSScorer] [nvarchar](500) NULL,
	[Translator] [nvarchar](500) NULL,
	[Inputter] [nvarchar](500) NULL,
	[InputTime] [nvarchar](500) NULL,
	[EditTime] [nvarchar](500) NULL,
	[HowScored] [nvarchar](500) NULL,
	[PitchesEntered] [nvarchar](500) NULL,
	[Temperature] [nvarchar](500) NULL,
	[WindDirection] [nvarchar](500) NULL,
	[WindSpeed] [nvarchar](500) NULL,
	[FieldCondition] [nvarchar](500) NULL,
	[Precipitation] [nvarchar](500) NULL,
	[Sky] [nvarchar](500) NULL,
	[TimeOfGame] [nvarchar](500) NULL,
	[NumberOfInnings] [nvarchar](500) NULL,
	[VisitorFinalScore] [nvarchar](500) NULL,
	[HomeFinalScore] [nvarchar](500) NULL,
	[VisitorHits] [nvarchar](500) NULL,
	[HomeHits] [nvarchar](500) NULL,
	[VisitorErrors] [nvarchar](500) NULL,
	[HomeErrors] [nvarchar](500) NULL,
	[VisitorLeftOnBase] [nvarchar](500) NULL,
	[HomeLeftOnBase] [nvarchar](500) NULL,
	[WinningPitcher] [nvarchar](500) NULL,
	[LosingPitcher] [nvarchar](500) NULL,
	[SaveFor] [nvarchar](500) NULL,
	[GWRBI] [nvarchar](500) NULL,
	[VisitorBatter1] [nvarchar](500) NULL,
	[VisitorPosition1] [nvarchar](500) NULL,
	[VisitorBatter2] [nvarchar](500) NULL,
	[VisitorPosition2] [nvarchar](500) NULL,
	[VisitorBatter3] [nvarchar](500) NULL,
	[VisitorPosition3] [nvarchar](500) NULL,
	[VisitorBatter4] [nvarchar](500) NULL,
	[VisitorPosition4] [nvarchar](500) NULL,
	[VisitorBatter5] [nvarchar](500) NULL,
	[VisitorPosition5] [nvarchar](500) NULL,
	[VisitorBatter6] [nvarchar](500) NULL,
	[VisitorPosition6] [nvarchar](500) NULL,
	[VisitorBatter7] [nvarchar](500) NULL,
	[VisitorPosition7] [nvarchar](500) NULL,
	[VisitorBatter8] [nvarchar](500) NULL,
	[VisitorPosition8] [nvarchar](500) NULL,
	[VisitorBatter9] [nvarchar](500) NULL,
	[VisitorPosition9] [nvarchar](500) NULL,
	[HomeBatter1] [nvarchar](500) NULL,
	[HomePosition1] [nvarchar](500) NULL,
	[HomeBatter2] [nvarchar](500) NULL,
	[HomePosition2] [nvarchar](500) NULL,
	[HomeBatter3] [nvarchar](500) NULL,
	[HomePosition3] [nvarchar](500) NULL,
	[HomeBatter4] [nvarchar](500) NULL,
	[HomePosition4] [nvarchar](500) NULL,
	[HomeBatter5] [nvarchar](500) NULL,
	[HomePosition5] [nvarchar](500) NULL,
	[HomeBatter6] [nvarchar](500) NULL,
	[HomePosition6] [nvarchar](500) NULL,
	[HomeBatter7] [nvarchar](500) NULL,
	[HomePosition7] [nvarchar](500) NULL,
	[HomeBatter8] [nvarchar](500) NULL,
	[HomePosition8] [nvarchar](500) NULL,
	[HomeBatter9] [nvarchar](500) NULL,
	[HomePosition9] [nvarchar](500) NULL,
	[VisitingFinisher] [nvarchar](500) NULL,
	[HomeFinisher] [nvarchar](500) NULL,
	[OfficialScorer] [nvarchar](500) NULL,
	[GameType] [nvarchar](500) NULL,
	[SourceFile] [nvarchar](500) NULL
)
