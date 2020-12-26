CREATE TABLE [dbo].[FranchiseMaster]
(
	[FranchiseID] UNIQUEIDENTIFIER NOT NULL
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
	,CONSTRAINT [pk_FranchiseMaster] PRIMARY KEY ([FranchiseID])
)
GO

ALTER TABLE [dbo].[FranchiseMaster] ADD CONSTRAINT [df_FranchiseMaster_FranchiseID] DEFAULT NEWID() FOR [FranchiseID]
GO

