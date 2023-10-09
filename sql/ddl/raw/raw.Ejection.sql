IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Ejection]') AND type in (N'U'))
DROP TABLE [raw].[Ejection]

CREATE TABLE [raw].[Ejection](
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
