IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[FranchiseMaster]') AND type in (N'U'))
DROP TABLE [raw].[FranchiseMaster]

CREATE TABLE [raw].[FranchiseMaster](
	[CurrentFranchiseID] [nvarchar](500) NULL,
	[FranchiseID] [nvarchar](500) NULL,
	[League] [nvarchar](500) NULL,
	[Division] [nvarchar](500) NULL,
	[LocationName] [nvarchar](500) NULL,
	[Nickname] [nvarchar](500) NULL,
	[AltNickname] [nvarchar](500) NULL,
	[Start] [nvarchar](500) NULL,
	[End] [nvarchar](500) NULL,
	[City] [nvarchar](500) NULL,
	[State] [nvarchar](500) NULL
)
