IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discrepancy]') AND type in (N'U'))
DROP TABLE [dbo].[Discrepancy]

CREATE TABLE [dbo].[Discrepancy](
	[DiscrepancyID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ID] [char](9) NULL,
	[Player] [char](8) NULL,
	[Year] [int] NULL,
	[Team] [char](3) NULL,
	[Type] [char](1) NULL,
	[Pos] [varchar](2) NULL,
	[Cat] [varchar](3) NULL,
	[GameID] [varchar](14) NULL,
	[Retro] [decimal](6,1) NULL,
    [Official] [decimal](6,1) NULL,
    [Cross] [char](9) NULL,
    [Code] [varchar](50) NULL,
    [Notes] [varchar](256) NULL,
    [Accepted] [varchar](50) NULL
)
