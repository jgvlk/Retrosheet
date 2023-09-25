USE [Retrosheet]
GO

/****** Object:  Table [raw].[FranchiseMaster]    Script Date: 9/25/2023 1:33:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[FranchiseMaster]') AND type in (N'U'))
DROP TABLE [raw].[FranchiseMaster]
GO

/****** Object:  Table [raw].[FranchiseMaster]    Script Date: 9/25/2023 1:33:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [raw].[FranchiseMaster](
	[CurrentFranchiseID] [varchar](500) NULL,
	[FranchiseID] [varchar](500) NULL,
	[League] [varchar](500) NULL,
	[Division] [varchar](500) NULL,
	[LocationName] [varchar](500) NULL,
	[Nickname] [varchar](500) NULL,
	[AltNickname] [varchar](500) NULL,
	[Start] [varchar](500) NULL,
	[End] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL
) ON [PRIMARY]
GO


