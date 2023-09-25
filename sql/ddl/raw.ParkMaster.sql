USE [Retrosheet]
GO

/****** Object:  Table [raw].[ParkMaster]    Script Date: 9/25/2023 1:29:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[ParkMaster]') AND type in (N'U'))
DROP TABLE [raw].[ParkMaster]
GO

/****** Object:  Table [raw].[ParkMaster]    Script Date: 9/25/2023 1:29:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [raw].[ParkMaster](
	[ParkID] [varchar](500) NOT NULL,
	[Name] [varchar](500) NULL,
	[AKA] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[Start] [varchar](500) NULL,
	[End] [varchar](500) NULL,
	[League] [varchar](500) NULL,
	[Notes] [varchar](500) NULL
) ON [PRIMARY]
GO


