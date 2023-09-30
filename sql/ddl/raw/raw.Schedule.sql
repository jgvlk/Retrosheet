IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Schedule]') AND type in (N'U'))
DROP TABLE [raw].[Schedule]

CREATE TABLE [raw].[Schedule](
    [Date] [nvarchar](500) NULL,
    [GameNum] [nvarchar](500) NULL,
    [DayOfWeek] [nvarchar](500) NULL,
    [VisitingTeam] [nvarchar](500) NULL,
    [VisitingTeamLeague] [nvarchar](500) NULL,
    [VisitingTeamSeasonGameNum] [nvarchar](500) NULL,
    [HomeTeam] [nvarchar](500) NULL,
    [HomeTeamLeague] [nvarchar](500) NULL,
    [HomeTeamSeasonGameNum] [nvarchar](500) NULL,
    [GameStartDuring] [nvarchar](500) NULL,
    [PostponmentIndicator] [nvarchar](500) NULL,
    [DateOfMakeup] [nvarchar](500) NULL,
    [SourceFile] [nvarchar](500) NULL
)
