USE [Retrosheet]
GO

/****** Object:  Table [raw].[Game]    Script Date: 9/25/2023 8:46:28 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Game]') AND type in (N'U'))
DROP TABLE [raw].[Game]
GO

/****** Object:  Table [raw].[Game]    Script Date: 9/25/2023 8:46:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [raw].[Game](
	[GameID] [varchar](500) NOT NULL,
	[Date] [varchar](500) NULL,
	[GameNumber] [varchar](500) NULL,
	[DayOfWeek] [varchar](500) NULL,
	[StartTime] [varchar](500) NULL,
	[DHUsedFlag] [varchar](500) NULL,
	[DayNightFlag] [varchar](500) NULL,
	[VisitingTeam] [varchar](500) NULL,
	[HomeTeam] [varchar](500) NULL,
	[GameSite] [varchar](500) NULL,
	[VisitorStartingPitcher] [varchar](500) NULL,
	[HomeStartingPitcher] [varchar](500) NULL,
	[HomePlateUmpire] [varchar](500) NULL,
	[FirstBaseUmpire] [varchar](500) NULL,
	[SecondBaseUmpire] [varchar](500) NULL,
	[ThirdBaseUmpire] [varchar](500) NULL,
	[LeftFieldUmpire] [varchar](500) NULL,
	[RightFieldUmpire] [varchar](500) NULL,
	[Attendance] [varchar](500) NULL,
	[PSScorer] [varchar](500) NULL,
	[Translator] [varchar](500) NULL,
	[Inputter] [varchar](500) NULL,
	[InputTime] [varchar](500) NULL,
	[EditTime] [varchar](500) NULL,
	[HowScored] [varchar](500) NULL,
	[PitchesEntered] [varchar](500) NULL,
	[Temperature] [varchar](500) NULL,
	[WindDirection] [varchar](500) NULL,
	[WindSpeed] [varchar](500) NULL,
	[FieldCondition] [varchar](500) NULL,
	[Precipitation] [varchar](500) NULL,
	[Sky] [varchar](500) NULL,
	[TimeOfGame] [varchar](500) NULL,
	[NumberOfInnings] [varchar](500) NULL,
	[VisitorFinalScore] [varchar](500) NULL,
	[HomeFinalScore] [varchar](500) NULL,
	[VisitorHits] [varchar](500) NULL,
	[HomeHits] [varchar](500) NULL,
	[VisitorErrors] [varchar](500) NULL,
	[HomeErrors] [varchar](500) NULL,
	[VisitorLeftOnBase] [varchar](500) NULL,
	[HomeLeftOnBase] [varchar](500) NULL,
	[WinningPitcher] [varchar](500) NULL,
	[LosingPitcher] [varchar](500) NULL,
	[SaveFor] [varchar](500) NULL,
	[GWRBI] [varchar](500) NULL,
	[VisitorBatter1] [varchar](500) NULL,
	[VisitorPosition1] [varchar](500) NULL,
	[VisitorBatter2] [varchar](500) NULL,
	[VisitorPosition2] [varchar](500) NULL,
	[VisitorBatter3] [varchar](500) NULL,
	[VisitorPosition3] [varchar](500) NULL,
	[VisitorBatter4] [varchar](500) NULL,
	[VisitorPosition4] [varchar](500) NULL,
	[VisitorBatter5] [varchar](500) NULL,
	[VisitorPosition5] [varchar](500) NULL,
	[VisitorBatter6] [varchar](500) NULL,
	[VisitorPosition6] [varchar](500) NULL,
	[VisitorBatter7] [varchar](500) NULL,
	[VisitorPosition7] [varchar](500) NULL,
	[VisitorBatter8] [varchar](500) NULL,
	[VisitorPosition8] [varchar](500) NULL,
	[VisitorBatter9] [varchar](500) NULL,
	[VisitorPosition9] [varchar](500) NULL,
	[HomeBatter1] [varchar](500) NULL,
	[HomePosition1] [varchar](500) NULL,
	[HomeBatter2] [varchar](500) NULL,
	[HomePosition2] [varchar](500) NULL,
	[HomeBatter3] [varchar](500) NULL,
	[HomePosition3] [varchar](500) NULL,
	[HomeBatter4] [varchar](500) NULL,
	[HomePosition4] [varchar](500) NULL,
	[HomeBatter5] [varchar](500) NULL,
	[HomePosition5] [varchar](500) NULL,
	[HomeBatter6] [varchar](500) NULL,
	[HomePosition6] [varchar](500) NULL,
	[HomeBatter7] [varchar](500) NULL,
	[HomePosition7] [varchar](500) NULL,
	[HomeBatter8] [varchar](500) NULL,
	[HomePosition8] [varchar](500) NULL,
	[HomeBatter9] [varchar](500) NULL,
	[HomePosition9] [varchar](500) NULL,
	[VisitingFinisher] [varchar](500) NULL,
	[HomeFinisher] [varchar](500) NULL,
	[OfficialScorer] [varchar](500) NULL,
	[GameType] [varchar](500) NULL
) ON [PRIMARY]
GO


