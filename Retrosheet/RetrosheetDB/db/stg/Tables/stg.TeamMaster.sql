CREATE TABLE [stg].[TeamMaster]
(
	[StgTeamID] INT NOT NULL IDENTITY(1,1)
	,[RetroTeamID] CHAR(3) NOT NULL
	,[League] CHAR(2) NOT NULL
	,[City] VARCHAR(25) NOT NULL
	,[Nickname] VARCHAR(25) NOT NULL
	,[Start] INT NULL
	,[End] INT NULL
	,[RowHash] NVARCHAR(64) NULL
	,[dCreated] DATETIME NOT NULL
	,CONSTRAINT [pk_TeamMaster] PRIMARY KEY ([StgTeamID])
)
GO

ALTER TABLE [stg].[TeamMaster] ADD CONSTRAINT [df_TeamMaster_dCreated] DEFAULT GETDATE() FOR [dCreated]
GO

