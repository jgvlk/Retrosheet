﻿CREATE TABLE [stg].[PlayerMaster]
(
	[StgPlayerID] INT NOT NULL IDENTITY(1,1)
	,[RetroPlayerID] CHAR(8) NOT NULL
	,[FirstName] VARCHAR(25) NULL
	,[LastName] VARCHAR(25) NULL
	,[PlayerDebut] DATE NULL
	,[ManagerDebut] DATE NULL
	,[CoachDebut] DATE NULL
	,[UmpDebut] DATE NULL
	,[RowHash] NVARCHAR(64) NULL
	,[dCreated] DATETIME NOT NULL
	,CONSTRAINT [pk_PlayerMaster] PRIMARY KEY ([StgPlayerID])
)
GO

ALTER TABLE [stg].[PlayerMaster] ADD CONSTRAINT [df_PlayerMaster_dCreated] DEFAULT GETDATE() FOR [dCreated]
GO
