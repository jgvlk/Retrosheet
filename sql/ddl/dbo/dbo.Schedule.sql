IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
DROP TABLE [dbo].[Schedule]

CREATE TABLE [dbo].[Schedule](
    [ScheduleID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Date] [date] NULL,
    [GameNum] [int] NULL,
    [DayOfWeek] [char](3) NULL,
    [VisitingTeam] [char](3) NULL,
    [VisitingTeamLeague] [char](2) NULL,
    [VisitingTeamSeasonGameNum] [int] NULL,
    [HomeTeam] [char](3) NULL,
    [HomeTeamLeague] [char](2) NULL,
    [HomeTeamSeasonGameNum] [int] NULL,
    [GameStartDuring] [char](1) NULL,
    [PostponementIndicator] [varchar](100) NULL,
    [DateOfMakeup] [varchar](50) NULL
)
