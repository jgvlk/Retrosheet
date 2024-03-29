IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamMaster]') AND type in (N'U'))
DROP TABLE [dbo].[TeamMaster]

CREATE TABLE [dbo].[TeamMaster](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[RetroTeamID] [char](3) NOT NULL,
	[League] [char](2) NULL,
	[City] [varchar](25) NOT NULL,
	[Nickname] [varchar](25) NOT NULL,
	[Start] [int] NULL,
	[End] [int] NULL
 CONSTRAINT [pk_TeamMaster] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_TeamMaster_RetroTeamID] UNIQUE NONCLUSTERED 
(
	[RetroTeamID] ASC,
	[League] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
