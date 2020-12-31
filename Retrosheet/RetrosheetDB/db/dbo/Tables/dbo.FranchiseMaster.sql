﻿CREATE TABLE [dbo].[FranchiseMaster]
(
	[FranchiseID] INT NOT NULL IDENTITY(1,1)
	,[CurrentRetroFranchiseID] CHAR(3) NOT NULL
	,[RetroFranchiseID] CHAR(3) NOT NULL
	,[League] CHAR(2) NOT NULL
	,[Division] CHAR(1) NULL
	,[LocationName] VARCHAR(25) NULL
	,[Nickname] VARCHAR(50) NULL
	,[AltNickname] VARCHAR(50) NULL
	,[Start] DATE NOT NULL
	,[End] DATE NULL
	,[City] VARCHAR(25) NOT NULL
	,[State] CHAR(2) NOT NULL
	,[dCreated] DATETIME NOT NULL
	,[dModified] DATETIME NOT NULL
	,CONSTRAINT [pk_FranchiseMaster] PRIMARY KEY ([FranchiseID])
)
GO

ALTER TABLE [dbo].[FranchiseMaster] ADD CONSTRAINT [df_FranchiseMaster_dCreated] DEFAULT GETDATE() FOR [dCreated]
GO

ALTER TABLE [dbo].[FranchiseMaster] ADD CONSTRAINT [df_FranchiseMaster_dModified] DEFAULT GETDATE() FOR [dModified]
GO

