IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discrepancy]') AND type in (N'U'))
DROP TABLE [dbo].[Discrepancy]

CREATE TABLE [dbo].[Discrepancy](
	[DiscrepancyID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ID] [nvarchar](500) NULL,
	[Player] [nvarchar](500) NULL,
	[Year] [nvarchar](500) NULL,
	[Team] [nvarchar](500) NULL,
	[Type] [nvarchar](500) NULL,
	[Pos] [nvarchar](500) NULL,
	[Cat] [nvarchar](500) NULL,
	[GameID] [nvarchar](500) NULL,
	[Retro] [nvarchar](500) NULL,
    [Official] [nvarchar](500) NULL,
    [Cross] [nvarchar](500) NULL,
    [Code] [nvarchar](500) NULL,
    [Notes] [nvarchar](500) NULL,
    [Accepted] [nvarchar](500) NULL,
	[SourceFile] [nvarchar](500) NULL
)
