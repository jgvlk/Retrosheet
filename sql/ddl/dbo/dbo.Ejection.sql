IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ejection]') AND type in (N'U'))
DROP TABLE [dbo].[Ejection]

CREATE TABLE [dbo].[Ejection](
	[EjectionID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [nvarchar](500) NULL,
	[Date] [nvarchar](500) NULL,
	[DH] [nvarchar](500) NULL,
	[Ejectee] [nvarchar](500) NULL,
	[EjecteeName] [nvarchar](500) NULL,
	[Team] [nvarchar](500) NULL,
	[Job] [nvarchar](500) NULL,
	[Umpire] [nvarchar](500) NULL,
	[UmpireName] [nvarchar](500) NULL,
    [Inning] [nvarchar](500) NULL,
    [Reason] [nvarchar](500) NULL
)
