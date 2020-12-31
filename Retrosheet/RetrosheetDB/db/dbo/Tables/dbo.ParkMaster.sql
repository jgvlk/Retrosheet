CREATE TABLE [dbo].[ParkMaster]
(
	[ParkID] INT NOT NULL IDENTITY(1,1)
	,[RetroParkID] CHAR(5) NOT NULL
	,[Name] VARCHAR(50) NULL
	,[AKA] VARCHAR(50) NULL
	,[City] VARCHAR(25) NULL
	,[State] VARCHAR(10) NULL
	,[Start] DATE NULL
	,[End] DATE NULL
	,[League] CHAR(2) NULL
	,[Notes] VARCHAR(100) NULL
	,[dCreated] DATETIME NOT NULL
	,[dModified] DATETIME NOT NULL
	,CONSTRAINT [pk_ParkMaster] PRIMARY KEY ([ParkID])
)
GO

ALTER TABLE [dbo].[ParkMaster] ADD CONSTRAINT [df_ParkMaster_dCreated] DEFAULT GETDATE() FOR [dCreated]
GO

ALTER TABLE [dbo].[ParkMaster] ADD CONSTRAINT [df_ParkMaster_dModified] DEFAULT GETDATE() FOR [dModified]
GO

ALTER TABLE [dbo].[ParkMaster] ADD CONSTRAINT [ak_ParkMaster_RetroParkID] UNIQUE ([RetroParkID])
GO

