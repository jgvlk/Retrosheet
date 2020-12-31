CREATE TABLE [dbo].[PlayerMaster]
(
	[PlayerID] INT NOT NULL IDENTITY(1,1)
	,[RetroPlayerID] CHAR(8) NOT NULL
	,[FirstName] VARCHAR(25) NULL
	,[LastName] VARCHAR(25) NULL
	,[PlayerDebut] DATE NULL
	,[ManagerDebut] DATE NULL
	,[CoachDebut] DATE NULL
	,[UmpDebut] DATE NULL
	,[dCreated] DATETIME NOT NULL
	,[dModified] DATETIME NOT NULL
	,CONSTRAINT [pk_PlayerMaster] PRIMARY KEY ([PlayerID])
)
GO

ALTER TABLE [dbo].[PlayerMaster] ADD CONSTRAINT [df_PlayerMaster_dCreated] DEFAULT GETDATE() FOR [dCreated]
GO

ALTER TABLE [dbo].[PlayerMaster] ADD CONSTRAINT [df_PlayerMaster_dModified] DEFAULT GETDATE() FOR [dModified]
GO

ALTER TABLE [dbo].[PlayerMaster] ADD CONSTRAINT [ak_PlayerMaster_RetroPlayerID] UNIQUE ([RetroPlayerID])
GO

