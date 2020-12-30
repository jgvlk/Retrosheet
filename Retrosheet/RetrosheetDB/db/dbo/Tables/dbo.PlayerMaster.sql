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
	,CONSTRAINT [pk_PlayerMaster] PRIMARY KEY ([PlayerID])
)
GO

ALTER TABLE [dbo].[PlayerMaster] ADD CONSTRAINT [ak_PlayerMaster_RetroPlayerID] UNIQUE ([RetroPlayerID])
GO

