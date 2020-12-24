CREATE TABLE [dbo].[PlayerMaster]
(
	[PlayerID] UNIQUEIDENTIFIER NOT NULL
	,[RetroPlayerID] CHAR(8) NOT NULL
	,[FirstName] VARCHAR(25) NULL
	,[LastName] VARCHAR(25) NULL
	,[PlayerDebut] DATE NULL
	,[ManagerDebut] DATE NULL
	,[CoachDebut] DATE NULL
	,[UmpDebut] DATE NULL
	,CONSTRAINT [pk_PlayerMaster] PRIMARY KEY NONCLUSTERED ([PlayerID])
)
GO

ALTER TABLE [dbo].[PlayerMaster] ADD CONSTRAINT [df_PlayerID] DEFAULT NEWID() FOR [PlayerID]
GO

ALTER TABLE [dbo].[PlayerMaster] ADD CONSTRAINT [ak_PlayerMaster_RetroPlayerID] UNIQUE ([RetroPlayerID])
GO

