CREATE TABLE [dbo].[TeamMaster]
(
	[TeamID] UNIQUEIDENTIFIER NOT NULL
	,[RetroTeamID] CHAR(3) NOT NULL
	,[League] CHAR(2) NOT NULL
	,[City] VARCHAR(25) NOT NULL
	,[Nickname] VARCHAR(25) NOT NULL
	,[Start] INT NULL
	,[End] INT NULL
	,CONSTRAINT [pk_TeamMaster] PRIMARY KEY ([TeamID])
)
GO

ALTER TABLE [dbo].[TeamMaster] ADD CONSTRAINT [df_TeamMaster_TeamID] DEFAULT NEWID() FOR [TeamID]
GO

