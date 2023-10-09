IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FranchiseMaster]') AND type in (N'U'))
DROP TABLE [dbo].[FranchiseMaster]

CREATE TABLE [dbo].[FranchiseMaster](
	[FranchiseID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentRetroFranchiseID] [char](3) NOT NULL,
	[RetroFranchiseID] [char](3) NOT NULL,
	[League] [char](2) NULL,
	[Division] [char](1) NULL,
	[LocationName] [varchar](25) NULL,
	[Nickname] [varchar](50) NULL,
	[AltNickname] [varchar](50) NULL,
	[Start] [date] NOT NULL,
	[End] [date] NULL,
	[City] [varchar](25) NOT NULL,
	[State] [char](2) NOT NULL
 CONSTRAINT [pk_FranchiseMaster] PRIMARY KEY CLUSTERED 
(
	[FranchiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
