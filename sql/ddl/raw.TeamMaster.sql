USE [Retrosheet]
GO

/****** Object:  Table [raw].[TeamMaster]    Script Date: 9/25/2023 1:32:22 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TeamMaster]') AND type in (N'U'))
DROP TABLE [raw].[TeamMaster]
GO

/****** Object:  Table [raw].[TeamMaster]    Script Date: 9/25/2023 1:32:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [raw].[TeamMaster](
	[TeamID] [varchar](500) NULL,
	[League] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[Nickname] [varchar](500) NULL,
	[Start] [varchar](500) NULL,
	[End] [varchar](500) NULL
) ON [PRIMARY]
GO


