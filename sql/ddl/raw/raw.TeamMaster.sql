IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TeamMaster]') AND type in (N'U'))
DROP TABLE [raw].[TeamMaster]

CREATE TABLE [raw].[TeamMaster](
	[TeamID] [nvarchar](500) NULL,
	[League] [nvarchar](500) NULL,
	[City] [nvarchar](500) NULL,
	[Nickname] [nvarchar](500) NULL,
	[First] [nvarchar](500) NULL,
	[Last] [nvarchar](500) NULL
)
