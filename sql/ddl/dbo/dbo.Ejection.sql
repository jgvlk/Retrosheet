IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ejection]') AND type in (N'U'))
DROP TABLE [dbo].[Ejection]

CREATE TABLE [dbo].[Ejection](
    [EjectionID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Date] [date] NULL,
    [RetroGameID] [char](12) NULL,
    [GameID] [bigint] NULL,
    [RetroTeamID] [char](3) NULL,
    [TeamID] [int] NULL,
    [Ejectee] [varchar](50) NULL,
    [EjecteePlayerID] [int] NULL,
    [Umpire] [varchar](50) NULL,
    [UmpirePlayerID] [int] NULL,
    [DH] [int] NULL,
    [Job] [char](1) NULL,
    [Inning] [int] NULL,
    [Reason] [varchar](500) NULL
)
