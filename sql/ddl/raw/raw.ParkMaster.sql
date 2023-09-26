IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[ParkMaster]') AND type in (N'U'))
DROP TABLE [raw].[ParkMaster]

CREATE TABLE [raw].[ParkMaster](
	[ParkID] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[AKA] [nvarchar](500) NULL,
	[City] [nvarchar](500) NULL,
	[State] [nvarchar](500) NULL,
	[Start] [nvarchar](500) NULL,
	[End] [nvarchar](500) NULL,
	[League] [nvarchar](500) NULL,
	[Notes] [nvarchar](500) NULL
)
